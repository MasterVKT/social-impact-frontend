/// Authentication feature barrel file
/// Exports all authentication-related modules

// Domain layer
export 'domain/entities/auth_state.dart';
export 'domain/entities/user.dart';
export 'domain/repositories/auth_repository.dart';
export 'domain/use_cases/auth_use_cases.dart';

// Data layer
export 'data/data.dart';

// Presentation layer
export 'presentation/providers/providers.dart';