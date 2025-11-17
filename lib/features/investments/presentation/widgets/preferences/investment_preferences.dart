// lib/features/investments/presentation/widgets/preferences/investment_preferences.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';
import '../../../../../../core/services/analytics/analytics_service.dart';

class InvestmentPreferences extends ConsumerStatefulWidget {
  const InvestmentPreferences({super.key});

  @override
  ConsumerState<InvestmentPreferences> createState() => _InvestmentPreferencesState();
}

class _InvestmentPreferencesState extends ConsumerState<InvestmentPreferences> {
  bool _emailNotifications = true;
  bool _autoDownloadReceipts = false;
  String _defaultCurrency = 'EUR';
  String _dateRange = 'all';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        children: [
          AdaptiveCard(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Notification Preferences', style: AdaptiveTextStyles.titleMedium(context)),
                  const SizedBox(height: Spacing.md),
                  SwitchListTile(
                    title: const Text('Email notifications for investments'),
                    value: _emailNotifications,
                    onChanged: (v) {
                      setState(() => _emailNotifications = v);
                      AnalyticsService.instance.logUpdateInvestmentPreferences(key: 'email_notifications', value: v);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: Spacing.md),
          AdaptiveCard(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display Preferences', style: AdaptiveTextStyles.titleMedium(context)),
                  const SizedBox(height: Spacing.md),
                  DropdownButtonFormField<String>(
                    value: _defaultCurrency,
                    decoration: const InputDecoration(labelText: 'Default Currency'),
                    items: const ['EUR', 'USD', 'GBP'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => _defaultCurrency = v);
                        AnalyticsService.instance.logUpdateInvestmentPreferences(key: 'default_currency', value: v);
                      }
                    },
                  ),
                  const SizedBox(height: Spacing.md),
                  DropdownButtonFormField<String>(
                    value: _dateRange,
                    decoration: const InputDecoration(labelText: 'Default Date Range'),
                    items: const ['all', 'last_month', 'last_3_months', 'last_year'].map((e) => DropdownMenuItem(value: e, child: Text(e.replaceAll('_', ' ')))).toList(),
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => _dateRange = v);
                        AnalyticsService.instance.logUpdateInvestmentPreferences(key: 'default_date_range', value: v);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: Spacing.md),
          AdaptiveCard(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Receipt Preferences', style: AdaptiveTextStyles.titleMedium(context)),
                  const SizedBox(height: Spacing.md),
                  SwitchListTile(
                    title: const Text('Auto-download receipts'),
                    value: _autoDownloadReceipts,
                    onChanged: (v) {
                      setState(() => _autoDownloadReceipts = v);
                      AnalyticsService.instance.logUpdateInvestmentPreferences(key: 'auto_download_receipts', value: v);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

