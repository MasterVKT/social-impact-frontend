
// Import conditionnellement selon la plateforme

export 'biometric_service_stub.dart'
    if (dart.library.io) 'biometric_service_mobile.dart'
    if (dart.library.html) 'biometric_service_web.dart';
