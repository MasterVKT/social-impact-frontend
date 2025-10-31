import 'auth_providers.dart';

/// Alias pour les providers d'authentification, pour faciliter la migration
/// et la compatibilité avec le code existant

/// Alias pour authStateNotifierProvider
/// Fournit l'état d'authentification actuel
final authStateProvider = authStateNotifierProvider;

/// Alias pour authStateStreamProvider
/// Fournit le flux des changements d'état d'authentification
final authStateChangesProvider = authStateStreamProvider;
