import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../adaptive/adaptive_card.dart';
import '../adaptive/adaptive_spacing.dart';
import '../adaptive/adaptive_text_styles.dart';
import '../../constants/spacing.dart';
import 'component_showcase_screen.dart';
import 'component_demo_card.dart';

/// Component category section displaying components for a specific category
class ComponentCategorySection extends ConsumerWidget {
  final ComponentCategory category;
  final String searchQuery;

  const ComponentCategorySection({
    super.key,
    required this.category,
    this.searchQuery = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final components = _getComponentsForCategory();
    final filteredComponents = _filterComponents(components);

    if (filteredComponents.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (category != ComponentCategory.all) _buildSectionHeader(context),
        ..._buildComponentSections(context, filteredComponents),
      ],
    );
  }

  /// Build section header
  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.lg),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.sm),
            decoration: BoxDecoration(
              color: _getCategoryColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getCategoryIcon(),
              color: _getCategoryColor(),
              size: 20,
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            '${category.displayName} Components',
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.sm,
              vertical: Spacing.xs,
            ),
            decoration: BoxDecoration(
              color: _getCategoryColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${_getComponentsForCategory().length} items',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: _getCategoryColor(),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build component sections
  List<Widget> _buildComponentSections(
      BuildContext context, List<UIComponent> components) {
    if (category == ComponentCategory.all) {
      // Group all components by category
      final groupedComponents = <ComponentCategory, List<UIComponent>>{};

      for (final component in components) {
        groupedComponents
            .putIfAbsent(component.category, () => [])
            .add(component);
      }

      return groupedComponents.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: Spacing.xl),
          child: _buildCategoryGroup(context, entry.key, entry.value),
        );
      }).toList();
    } else {
      // Single category view
      return [_buildComponentGrid(context, components)];
    }
  }

  /// Build category group
  Widget _buildCategoryGroup(BuildContext context, ComponentCategory cat,
      List<UIComponent> components) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getCategoryIconForType(cat),
                  color: _getCategoryColorForType(cat),
                  size: 20,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  cat.displayName,
                  style: AdaptiveTextStyles.titleMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${components.length} components',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              _getCategoryDescriptionForType(cat),
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            AdaptiveSpacing.verticalLarge(),
            _buildComponentGrid(context, components),
          ],
        ),
      ),
    );
  }

  /// Build component grid
  Widget _buildComponentGrid(
      BuildContext context, List<UIComponent> components) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200
            ? 4
            : MediaQuery.of(context).size.width > 800
                ? 3
                : MediaQuery.of(context).size.width > 600
                    ? 2
                    : 1,
        crossAxisSpacing: Spacing.md,
        mainAxisSpacing: Spacing.md,
        childAspectRatio: 1.1,
      ),
      itemCount: components.length,
      itemBuilder: (context, index) {
        final component = components[index];
        return ComponentDemoCard(
          component: component,
          onTap: () => _showComponentDetails(context, component),
        );
      },
    );
  }

  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              searchQuery.isNotEmpty ? Icons.search_off : Icons.widgets,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              searchQuery.isNotEmpty
                  ? 'No components found'
                  : 'No components available',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              searchQuery.isNotEmpty
                  ? 'Try adjusting your search terms'
                  : 'Components for this category are coming soon',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Show component details
  void _showComponentDetails(BuildContext context, UIComponent component) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Spacing.sm),
                    decoration: BoxDecoration(
                      color: _getCategoryColorForType(component.category)
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getCategoryIconForType(component.category),
                      color: _getCategoryColorForType(component.category),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          component.name,
                          style: AdaptiveTextStyles.titleLarge(context),
                        ),
                        Text(
                          component.category.displayName,
                          style: AdaptiveTextStyles.bodySmall(context).copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: Spacing.md),

              // Description
              Text(
                component.description,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: Spacing.lg),

              // Demo section
              Text(
                'Live Demo',
                style: AdaptiveTextStyles.titleMedium(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: Spacing.md),

              // Demo widget
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: component.demoWidget,
                ),
              ),

              const SizedBox(height: Spacing.lg),

              // Usage info
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usage Information',
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: Spacing.sm),
                    _buildUsageInfo(context, component),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build usage information
  Widget _buildUsageInfo(BuildContext context, UIComponent component) {
    final usageInfo = _getUsageInfo(component);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: usageInfo.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: Spacing.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  '${entry.key}:',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  entry.value,
                  style: AdaptiveTextStyles.bodySmall(context),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  /// Get usage information for component
  Map<String, String> _getUsageInfo(UIComponent component) {
    switch (component.name) {
      case 'AdaptiveCard':
        return {
          'Import': "import '../widgets/adaptive/adaptive_card.dart';",
          'Usage': 'AdaptiveCard(child: YourContent())',
          'Props': 'child (required), padding, margin',
          'Platform': 'iOS, Android, Web',
        };
      case 'ResponsiveLayout':
        return {
          'Import': "import '../widgets/responsive/responsive_layout.dart';",
          'Usage': 'ResponsiveLayout(mobile: ..., tablet: ..., desktop: ...)',
          'Props': 'mobile, tablet, desktop (all required)',
          'Breakpoints': 'Mobile: <600px, Tablet: 600-1200px, Desktop: >1200px',
        };
      default:
        return {
          'Category': component.category.displayName,
          'Description': component.description,
          'Platform': 'Cross-platform',
          'Status': 'Available',
        };
    }
  }

  /// Filter components based on search query
  List<UIComponent> _filterComponents(List<UIComponent> components) {
    if (searchQuery.isEmpty) return components;

    return components.where((component) {
      return component.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          component.description
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          component.category.displayName
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).toList();
  }

  /// Get components for category
  List<UIComponent> _getComponentsForCategory() {
    // This would typically come from a provider or service
    // For now, returning mock data
    return _getAllComponents()
        .where((component) =>
            category == ComponentCategory.all || component.category == category)
        .toList();
  }

  /// Get all components (mock data)
  List<UIComponent> _getAllComponents() {
    return [
      // Adaptive Components
      UIComponent(
        name: 'AdaptiveCard',
        description: 'A card that adapts to platform design guidelines',
        category: ComponentCategory.adaptive,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'AdaptiveTextStyles',
        description: 'Typography that adapts to platform conventions',
        category: ComponentCategory.adaptive,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'ResponsiveLayout',
        description: 'Layout that responds to different screen sizes',
        category: ComponentCategory.adaptive,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'AdaptiveSpacing',
        description: 'Consistent spacing utilities across platforms',
        category: ComponentCategory.adaptive,
        demoWidget: const SizedBox(),
      ),

      // Button Components
      UIComponent(
        name: 'Primary Button',
        description: 'Main action button with emphasis',
        category: ComponentCategory.buttons,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Secondary Button',
        description: 'Outlined button for secondary actions',
        category: ComponentCategory.buttons,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Text Button',
        description: 'Low emphasis button for less important actions',
        category: ComponentCategory.buttons,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Icon Button',
        description: 'Button with icon for quick actions',
        category: ComponentCategory.buttons,
        demoWidget: const SizedBox(),
      ),

      // Input Components
      UIComponent(
        name: 'Search Bar',
        description: 'Input field optimized for search functionality',
        category: ComponentCategory.inputs,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Text Field',
        description: 'Standard text input field',
        category: ComponentCategory.inputs,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Dropdown Field',
        description: 'Selection dropdown with options',
        category: ComponentCategory.inputs,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Checkbox',
        description: 'Boolean selection input',
        category: ComponentCategory.inputs,
        demoWidget: const SizedBox(),
      ),

      // Navigation Components
      UIComponent(
        name: 'Navigation Rail',
        description: 'Side navigation for larger screens',
        category: ComponentCategory.navigation,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Bottom Navigation',
        description: 'Bottom tab navigation for mobile',
        category: ComponentCategory.navigation,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Tab Bar',
        description: 'Horizontal tab navigation',
        category: ComponentCategory.navigation,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Breadcrumb',
        description: 'Navigation breadcrumb trail',
        category: ComponentCategory.navigation,
        demoWidget: const SizedBox(),
      ),

      // Display Components
      UIComponent(
        name: 'Status Badge',
        description: 'Visual indicator for status information',
        category: ComponentCategory.display,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Avatar',
        description: 'User profile image or initials',
        category: ComponentCategory.display,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Progress Indicator',
        description: 'Visual progress feedback component',
        category: ComponentCategory.display,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Data Table',
        description: 'Structured data display component',
        category: ComponentCategory.display,
        demoWidget: const SizedBox(),
      ),

      // Feedback Components
      UIComponent(
        name: 'Snack Bar',
        description: 'Brief notification messages',
        category: ComponentCategory.feedback,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Alert Dialog',
        description: 'Modal dialogs for important information',
        category: ComponentCategory.feedback,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Toast',
        description: 'Temporary notification overlay',
        category: ComponentCategory.feedback,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Loading Overlay',
        description: 'Loading state indicator',
        category: ComponentCategory.feedback,
        demoWidget: const SizedBox(),
      ),

      // Layout Components
      UIComponent(
        name: 'Container',
        description: 'Basic layout container',
        category: ComponentCategory.layout,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Grid System',
        description: 'Responsive grid layout',
        category: ComponentCategory.layout,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Spacing Utilities',
        description: 'Consistent spacing throughout the app',
        category: ComponentCategory.layout,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Divider',
        description: 'Visual separator between content',
        category: ComponentCategory.layout,
        demoWidget: const SizedBox(),
      ),

      // Chart Components
      UIComponent(
        name: 'Line Chart',
        description: 'Line chart for trend visualization',
        category: ComponentCategory.charts,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Bar Chart',
        description: 'Bar chart for comparison data',
        category: ComponentCategory.charts,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Pie Chart',
        description: 'Pie chart for proportion data',
        category: ComponentCategory.charts,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Progress Chart',
        description: 'Visual progress tracking charts',
        category: ComponentCategory.charts,
        demoWidget: const SizedBox(),
      ),

      // Business Components
      UIComponent(
        name: 'Investment Card',
        description: 'Card component for displaying investment information',
        category: ComponentCategory.business,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Project Card',
        description: 'Card component for project information',
        category: ComponentCategory.business,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Portfolio Summary',
        description: 'Summary component for investment portfolio',
        category: ComponentCategory.business,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Impact Metrics',
        description: 'Components for displaying impact measurements',
        category: ComponentCategory.business,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Transaction Item',
        description: 'Component for displaying transaction information',
        category: ComponentCategory.business,
        demoWidget: const SizedBox(),
      ),
      UIComponent(
        name: 'Notification Card',
        description: 'Component for displaying notifications',
        category: ComponentCategory.business,
        demoWidget: const SizedBox(),
      ),
    ];
  }

  /// Get category color
  Color _getCategoryColor() {
    return _getCategoryColorForType(category);
  }

  /// Get category icon
  IconData _getCategoryIcon() {
    return _getCategoryIconForType(category);
  }

  /// Get category color for specific type
  Color _getCategoryColorForType(ComponentCategory cat) {
    switch (cat) {
      case ComponentCategory.all:
        return Colors.grey;
      case ComponentCategory.adaptive:
        return Colors.blue;
      case ComponentCategory.buttons:
        return Colors.green;
      case ComponentCategory.inputs:
        return Colors.orange;
      case ComponentCategory.navigation:
        return Colors.purple;
      case ComponentCategory.display:
        return Colors.cyan;
      case ComponentCategory.feedback:
        return Colors.red;
      case ComponentCategory.layout:
        return Colors.indigo;
      case ComponentCategory.charts:
        return Colors.amber;
      case ComponentCategory.business:
        return Colors.teal;
    }
  }

  /// Get category icon for specific type
  IconData _getCategoryIconForType(ComponentCategory cat) {
    switch (cat) {
      case ComponentCategory.all:
        return Icons.dashboard;
      case ComponentCategory.adaptive:
        return Icons.audiotrack;
      case ComponentCategory.buttons:
        return Icons.smart_button;
      case ComponentCategory.inputs:
        return Icons.input;
      case ComponentCategory.navigation:
        return Icons.navigation;
      case ComponentCategory.display:
        return Icons.display_settings;
      case ComponentCategory.feedback:
        return Icons.feedback;
      case ComponentCategory.layout:
        return Icons.view_quilt;
      case ComponentCategory.charts:
        return Icons.bar_chart;
      case ComponentCategory.business:
        return Icons.business_center;
    }
  }

  /// Get category description for specific type
  String _getCategoryDescriptionForType(ComponentCategory cat) {
    switch (cat) {
      case ComponentCategory.all:
        return 'Browse all available components in the UI library';
      case ComponentCategory.adaptive:
        return 'Components that adapt to different platforms and screen sizes';
      case ComponentCategory.buttons:
        return 'Interactive button components for user actions';
      case ComponentCategory.inputs:
        return 'Form input components for data collection';
      case ComponentCategory.navigation:
        return 'Navigation components for app structure';
      case ComponentCategory.display:
        return 'Components for displaying content and information';
      case ComponentCategory.feedback:
        return 'Components for user feedback and notifications';
      case ComponentCategory.layout:
        return 'Layout and container components for organizing content';
      case ComponentCategory.charts:
        return 'Data visualization and chart components';
      case ComponentCategory.business:
        return 'Business-specific components for the platform';
    }
  }
}
