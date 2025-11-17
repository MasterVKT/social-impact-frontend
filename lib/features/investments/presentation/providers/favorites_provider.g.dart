// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesNotifierHash() => r'f404fc580daa838b362cd318443ae33184acc338';

/// Provider for managing favorite/saved projects with local storage
/// This is an MVP requirement for secure local storage of favorites
///
/// Copied from [FavoritesNotifier].
@ProviderFor(FavoritesNotifier)
final favoritesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FavoritesNotifier, Set<String>>.internal(
  FavoritesNotifier.new,
  name: r'favoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesNotifier = AutoDisposeAsyncNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
