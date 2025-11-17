import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_provider.g.dart';

/// Provider for managing favorite/saved projects with local storage
/// This is an MVP requirement for secure local storage of favorites
@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  static const String _favoritesKey = 'favorite_projects';

  @override
  Future<Set<String>> build() async {
    return await _loadFavorites();
  }

  /// Load favorites from local storage
  Future<Set<String>> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList(_favoritesKey) ?? [];
      return Set<String>.from(favorites);
    } catch (e) {
      // Return empty set on error
      return {};
    }
  }

  /// Save favorites to local storage
  Future<void> _saveFavorites(Set<String> favorites) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_favoritesKey, favorites.toList());
    } catch (e) {
      // Silently fail - local storage is best effort
    }
  }

  /// Add a project to favorites
  Future<void> addFavorite(String projectId) async {
    final currentFavorites = state.value ?? {};
    final newFavorites = {...currentFavorites, projectId};

    // Update state immediately for responsive UI
    state = AsyncValue.data(newFavorites);

    // Persist to local storage
    await _saveFavorites(newFavorites);
  }

  /// Remove a project from favorites
  Future<void> removeFavorite(String projectId) async {
    final currentFavorites = state.value ?? {};
    final newFavorites = Set<String>.from(currentFavorites)..remove(projectId);

    // Update state immediately for responsive UI
    state = AsyncValue.data(newFavorites);

    // Persist to local storage
    await _saveFavorites(newFavorites);
  }

  /// Toggle favorite status for a project
  Future<void> toggleFavorite(String projectId) async {
    final currentFavorites = state.value ?? {};

    if (currentFavorites.contains(projectId)) {
      await removeFavorite(projectId);
    } else {
      await addFavorite(projectId);
    }
  }

  /// Check if a project is favorited
  bool isFavorite(String projectId) {
    return state.value?.contains(projectId) ?? false;
  }

  /// Get count of favorites
  int get favoritesCount {
    return state.value?.length ?? 0;
  }

  /// Clear all favorites
  Future<void> clearAllFavorites() async {
    state = const AsyncValue.data({});
    await _saveFavorites({});
  }
}
