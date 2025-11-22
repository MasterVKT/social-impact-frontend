import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import '../../utils/platform_detector.dart';

/// Stripe payment service for handling all payment operations
/// Supports Android, iOS, and Web platforms
class StripeService {
  static final StripeService _instance = StripeService._internal();
  factory StripeService() => _instance;
  StripeService._internal();

  static StripeService get instance => _instance;

  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  bool _initialized = false;

  /// Initialize Stripe with publishable key
  Future<void> initialize() async {
    if (_initialized) return;

    try {
      // Get publishable key from environment
      final publishableKey = dotenv.env['USE_TEST_MODE'] == 'true'
          ? dotenv.env['STRIPE_PUBLISHABLE_KEY_TEST']
          : dotenv.env['STRIPE_PUBLISHABLE_KEY_LIVE'];

      if (publishableKey == null || publishableKey.isEmpty) {
        throw Exception('Stripe publishable key not found in .env');
      }

      // Initialize Stripe
      Stripe.publishableKey = publishableKey;

      // Configure merchant details for Apple/Google Pay
      if (PlatformDetector.isMobile) {
        await Stripe.instance.applySettings();
      }

      _initialized = true;
      debugPrint('✅ Stripe initialized successfully');
    } catch (e) {
      debugPrint('❌ Stripe initialization error: $e');
      rethrow;
    }
  }

  /// Create a payment intent via Cloud Functions
  /// Returns the client secret for completing payment
  Future<String> createPaymentIntent({
    required double amount,
    required String currency,
    required String projectId,
    required String contributorId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final result = await _functions
          .httpsCallable('stripeCreatePaymentIntent')
          .call({
        'amount': (amount * 100).toInt(), // Convert to cents
        'currency': currency.toLowerCase(),
        'projectId': projectId,
        'contributorId': contributorId,
        'metadata': metadata ?? {},
      });

      final clientSecret = result.data['clientSecret'] as String;
      debugPrint('✅ Payment intent created: $clientSecret');
      return clientSecret;
    } catch (e) {
      debugPrint('❌ Error creating payment intent: $e');
      rethrow;
    }
  }

  /// Confirm payment with card details (Android/iOS/Web)
  Future<PaymentIntentResult> confirmPayment({
    required String clientSecret,
    String? paymentMethodId,
    BillingDetails? billingDetails,
  }) async {
    try {
      final result = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ),
      );

      debugPrint('✅ Payment confirmed: ${result.status}');
      return result;
    } catch (e) {
      debugPrint('❌ Payment confirmation error: $e');
      rethrow;
    }
  }

  /// Present payment sheet (mobile only - simplified flow)
  Future<void> presentPaymentSheet({
    required String clientSecret,
    String? customerId,
    String? ephemeralKey,
  }) async {
    if (!PlatformDetector.isMobile) {
      throw UnsupportedError('Payment sheet only available on mobile');
    }

    try {
      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Social Finance Impact',
          customerId: customerId,
          customerEphemeralKeySecret: ephemeralKey,
          style: ThemeMode.system,
          applePay: const PaymentSheetApplePay(
            merchantCountryCode: 'FR',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'FR',
            testEnv: kDebugMode,
          ),
        ),
      );

      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();
      debugPrint('✅ Payment sheet completed successfully');
    } catch (e) {
      debugPrint('❌ Payment sheet error: $e');
      rethrow;
    }
  }

  /// Handle Apple Pay (iOS only)
  Future<void> confirmApplePayPayment({
    required String clientSecret,
    required List<ApplePayCartSummaryItem> cartItems,
    required String merchantCountryCode,
  }) async {
    if (!PlatformDetector.isIOS) {
      throw UnsupportedError('Apple Pay only available on iOS');
    }

    try {
      await Stripe.instance.confirmApplePayPayment(clientSecret);
      debugPrint('✅ Apple Pay payment confirmed');
    } catch (e) {
      debugPrint('❌ Apple Pay error: $e');
      rethrow;
    }
  }

  /// Handle Google Pay (Android only)
  Future<void> confirmGooglePayPayment({
    required String clientSecret,
    required double amount,
    required String currencyCode,
  }) async {
    if (!PlatformDetector.isAndroid) {
      throw UnsupportedError('Google Pay only available on Android');
    }

    try {
      await Stripe.instance.initGooglePay(
        GooglePayInitParams(
          testEnv: kDebugMode,
          merchantName: 'Social Finance Impact',
          countryCode: 'FR',
        ),
      );

      final result = await Stripe.instance.presentGooglePay(
        PresentGooglePayParams(
          clientSecret: clientSecret,
          currencyCode: currencyCode,
        ),
      );

      debugPrint('✅ Google Pay payment confirmed');
    } catch (e) {
      debugPrint('❌ Google Pay error: $e');
      rethrow;
    }
  }

  /// Check if Apple Pay is available
  Future<bool> isApplePaySupported() async {
    if (!PlatformDetector.isIOS) return false;

    try {
      return await Stripe.instance.isApplePaySupported();
    } catch (e) {
      debugPrint('Error checking Apple Pay support: $e');
      return false;
    }
  }

  /// Check if Google Pay is available
  Future<bool> isGooglePaySupported() async {
    if (!PlatformDetector.isAndroid) return false;

    try {
      await Stripe.instance.initGooglePay(
        GooglePayInitParams(
          testEnv: kDebugMode,
          merchantName: 'Social Finance Impact',
          countryCode: 'FR',
        ),
      );
      return true;
    } catch (e) {
      debugPrint('Error checking Google Pay support: $e');
      return false;
    }
  }

  /// Retrieve payment intent status
  Future<PaymentIntent?> retrievePaymentIntent(String clientSecret) async {
    try {
      final result = await Stripe.instance.retrievePaymentIntent(clientSecret);
      return result;
    } catch (e) {
      debugPrint('Error retrieving payment intent: $e');
      return null;
    }
  }

  /// Cancel a payment intent
  Future<void> cancelPaymentIntent(String paymentIntentId) async {
    try {
      await _functions.httpsCallable('stripeCancelPaymentIntent').call({
        'paymentIntentId': paymentIntentId,
      });
      debugPrint('✅ Payment intent cancelled');
    } catch (e) {
      debugPrint('❌ Error cancelling payment intent: $e');
      rethrow;
    }
  }

  /// Get payment method details
  Future<Map<String, dynamic>?> getPaymentMethod(String paymentMethodId) async {
    try {
      final result = await _functions
          .httpsCallable('stripeGetPaymentMethod')
          .call({
        'paymentMethodId': paymentMethodId,
      });
      return result.data as Map<String, dynamic>?;
    } catch (e) {
      debugPrint('Error getting payment method: $e');
      return null;
    }
  }

  /// Dispose Stripe resources (if needed)
  void dispose() {
    _initialized = false;
  }
}
