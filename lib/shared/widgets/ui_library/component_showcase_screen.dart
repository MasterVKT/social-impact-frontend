import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../adaptive/adaptive_text_styles.dart';
import '../responsive/responsive_layout.dart';
import '../../constants/spacing.dart';
import 'component_category_section.dart';
import 'component_demo_card.dart';

/// Component showcase screen displaying all UI components in the library
class ComponentShowcaseScreen extends ConsumerStatefulWidget {
  const ComponentShowcaseScreen({super.key});

  @override
  ConsumerState<ComponentShowcaseScreen> createState() =>
      _ComponentShowcaseScreenState();
}

class _ComponentShowcaseScreenState
    extends ConsumerState<ComponentShowcaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  ComponentCategory _selectedCategory = ComponentCategory.all;

  final List<ComponentCategory> _categories = ComponentCategory.values;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  /// Build mobile layout with tabs
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UI Component Library',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _showSearchDialog(context),
            icon: const Icon(Icons.search),
            tooltip: 'Search Components',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _categories.map((category) {
            return Tab(
              text: category.displayName,
              icon: Icon(_getCategoryIcon(category)),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _categories.map((category) {
          return _buildCategoryContent(context, category);
        }).toList(),
      ),
    );
  }

  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UI Component Library',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          SizedBox(
            width: 300,
            child: _buildSearchBar(context),
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: Row(
        children: [
          // Category navigation
          SizedBox(
            width: 200,
            child: NavigationRail(
              selectedIndex: _categories.indexOf(_selectedCategory),
              onDestinationSelected: (index) {
                setState(() {
                  _selectedCategory = _categories[index];
                });
              },
              extended: true,
              destinations: _categories.map((category) {
                return NavigationRailDestination(
                  icon: Icon(_getCategoryIcon(category)),
                  label: Text(category.displayName),
                );
              }).toList(),
            ),
          ),

          const VerticalDivider(thickness: 1, width: 1),

          // Component content
          Expanded(
            child: _buildCategoryContent(context, _selectedCategory),
          ),
        ],
      ),
    );
  }

  /// Build desktop layout with comprehensive showcase
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Social Impact Platform - UI Component Library',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          SizedBox(
            width: 400,
            child: _buildSearchBar(context),
          ),
          const SizedBox(width: Spacing.sm),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(value: ThemeMode.light, label: Text('Light')),
              ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
              ButtonSegment(value: ThemeMode.system, label: Text('System')),
            ],
            selected: {
              Theme.of(context).brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark
            },
            onSelectionChanged: (Set<ThemeMode> selection) {
              // Theme switching logic would go here
            },
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: Row(
        children: [
          // Sidebar with categories
          Container(
            width: 280,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Spacing.md),
                  child: _buildCategoryFilter(context),
                ),
                Expanded(
                  child: _buildCategorySidebar(context),
                ),
              ],
            ),
          ),

          // Main content area
          Expanded(
            child: _buildMainContent(context),
          ),
        ],
      ),
    );
  }

  /// Build search bar
  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      onChanged: (value) => setState(() => _searchQuery = value),
      decoration: InputDecoration(
        hintText: 'Search components...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
          vertical: Spacing.sm,
        ),
      ),
    );
  }

  /// Build category filter
  Widget _buildCategoryFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const SizedBox(height: Spacing.md),
        Wrap(
          spacing: Spacing.xs,
          runSpacing: Spacing.xs,
          children: _categories.map((category) {
            final isSelected = _selectedCategory == category;
            return FilterChip(
              selected: isSelected,
              label: Text(category.displayName),
              avatar: Icon(_getCategoryIcon(category), size: 16),
              onSelected: (selected) {
                setState(() {
                  _selectedCategory =
                      selected ? category : ComponentCategory.all;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  /// Build category sidebar
  Widget _buildCategorySidebar(BuildContext context) {
    return ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        final isSelected = _selectedCategory == category;
        final componentCount = _getComponentCount(category);

        return ListTile(
          selected: isSelected,
          leading: Icon(_getCategoryIcon(category)),
          title: Text(category.displayName),
          subtitle: Text('$componentCount components'),
          trailing: isSelected ? const Icon(Icons.chevron_right) : null,
          onTap: () => setState(() => _selectedCategory = category),
        );
      },
    );
  }

  /// Build main content
  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(context, _selectedCategory),
          const SizedBox(height: Spacing.lg),
          _buildComponentGrid(context, _selectedCategory),
        ],
      ),
    );
  }

  /// Build category content
  Widget _buildCategoryContent(
      BuildContext context, ComponentCategory category) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (category != ComponentCategory.all) ...[
            _buildCategoryHeader(context, category),
            const SizedBox(height: Spacing.lg),
          ],
          ComponentCategorySection(
            category: category,
            searchQuery: _searchQuery,
          ),
        ],
      ),
    );
  }

  /// Build category header
  Widget _buildCategoryHeader(
      BuildContext context, ComponentCategory category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(Spacing.sm),
              decoration: BoxDecoration(
                color: _getCategoryColor(category).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getCategoryIcon(category),
                color: _getCategoryColor(category),
                size: 24,
              ),
            ),
            const SizedBox(width: Spacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.displayName,
                  style: AdaptiveTextStyles.headlineSmall(context),
                ),
                Text(
                  '${_getComponentCount(category)} components',
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: Spacing.md),
        Text(
          _getCategoryDescription(category),
          style: AdaptiveTextStyles.bodyLarge(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  /// Build component grid
  Widget _buildComponentGrid(BuildContext context, ComponentCategory category) {
    final components = _getComponentsForCategory(category);
    final filteredComponents = _searchQuery.isEmpty
        ? components
        : components.where((component) {
            return component.name
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                component.description
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());
          }).toList();

    if (filteredComponents.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: Spacing.md),
            Text(
              'No components found',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            Text(
              'Try adjusting your search criteria',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200
            ? 3
            : MediaQuery.of(context).size.width > 600
                ? 2
                : 1,
        crossAxisSpacing: Spacing.md,
        mainAxisSpacing: Spacing.md,
        childAspectRatio: 1.2,
      ),
      itemCount: filteredComponents.length,
      itemBuilder: (context, index) {
        final component = filteredComponents[index];
        return ComponentDemoCard(
          component: component,
          onTap: () => _showComponentDemo(context, component),
        );
      },
    );
  }

  /// Show search dialog for mobile
  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Components'),
        content: TextField(
          autofocus: true,
          onChanged: (value) => setState(() => _searchQuery = value),
          decoration: const InputDecoration(
            hintText: 'Enter component name...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  /// Show component demo
  void _showComponentDemo(BuildContext context, UIComponent component) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      component.name,
                      style: AdaptiveTextStyles.titleLarge(context),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.md),
              Text(
                component.description,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: Spacing.lg),
              Expanded(
                child: component.demoWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Get category icon
  IconData _getCategoryIcon(ComponentCategory category) {
    switch (category) {
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

  /// Get category color
  Color _getCategoryColor(ComponentCategory category) {
    switch (category) {
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

  /// Get category description
  String _getCategoryDescription(ComponentCategory category) {
    switch (category) {
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

  /// Get component count for category
  int _getComponentCount(ComponentCategory category) {
    return _getComponentsForCategory(category).length;
  }

  /// Get components for category
  List<UIComponent> _getComponentsForCategory(ComponentCategory category) {
    final allComponents = _getAllComponents();

    if (category == ComponentCategory.all) {
      return allComponents;
    }

    return allComponents
        .where((component) => component.category == category)
        .toList();
  }

  /// Get all components
  List<UIComponent> _getAllComponents() {
    return [
      // Adaptive Components
      UIComponent(
        name: 'AdaptiveCard',
        description: 'A card that adapts to platform design guidelines',
        category: ComponentCategory.adaptive,
        demoWidget: _buildAdaptiveCardDemo(),
      ),
      UIComponent(
        name: 'AdaptiveTextStyles',
        description: 'Typography that adapts to platform conventions',
        category: ComponentCategory.adaptive,
        demoWidget: _buildTextStylesDemo(),
      ),
      UIComponent(
        name: 'ResponsiveLayout',
        description: 'Layout that responds to different screen sizes',
        category: ComponentCategory.adaptive,
        demoWidget: _buildResponsiveLayoutDemo(),
      ),

      // Button Components
      UIComponent(
        name: 'Primary Button',
        description: 'Main action button with emphasis',
        category: ComponentCategory.buttons,
        demoWidget: _buildButtonDemo(),
      ),
      UIComponent(
        name: 'Icon Button',
        description: 'Button with icon for quick actions',
        category: ComponentCategory.buttons,
        demoWidget: _buildIconButtonDemo(),
      ),

      // Input Components
      UIComponent(
        name: 'Search Bar',
        description: 'Input field optimized for search functionality',
        category: ComponentCategory.inputs,
        demoWidget: _buildSearchBarDemo(),
      ),
      UIComponent(
        name: 'Form Fields',
        description: 'Various form input components',
        category: ComponentCategory.inputs,
        demoWidget: _buildFormFieldDemo(),
      ),

      // Navigation Components
      UIComponent(
        name: 'Navigation Rail',
        description: 'Side navigation for larger screens',
        category: ComponentCategory.navigation,
        demoWidget: _buildNavigationDemo(),
      ),
      UIComponent(
        name: 'Tab Bar',
        description: 'Horizontal tab navigation',
        category: ComponentCategory.navigation,
        demoWidget: _buildTabDemo(),
      ),

      // Display Components
      UIComponent(
        name: 'Status Badge',
        description: 'Visual indicator for status information',
        category: ComponentCategory.display,
        demoWidget: _buildStatusBadgeDemo(),
      ),
      UIComponent(
        name: 'Progress Indicators',
        description: 'Visual progress feedback components',
        category: ComponentCategory.display,
        demoWidget: _buildProgressDemo(),
      ),

      // Feedback Components
      UIComponent(
        name: 'Snack Bar',
        description: 'Brief notification messages',
        category: ComponentCategory.feedback,
        demoWidget: _buildSnackBarDemo(),
      ),
      UIComponent(
        name: 'Dialog',
        description: 'Modal dialogs for important information',
        category: ComponentCategory.feedback,
        demoWidget: _buildDialogDemo(),
      ),

      // Layout Components
      UIComponent(
        name: 'Spacing Utilities',
        description: 'Consistent spacing throughout the app',
        category: ComponentCategory.layout,
        demoWidget: _buildSpacingDemo(),
      ),
      UIComponent(
        name: 'Grid Layout',
        description: 'Responsive grid system',
        category: ComponentCategory.layout,
        demoWidget: _buildGridDemo(),
      ),

      // Chart Components
      UIComponent(
        name: 'Performance Chart',
        description: 'Charts for displaying performance data',
        category: ComponentCategory.charts,
        demoWidget: _buildChartDemo(),
      ),
      UIComponent(
        name: 'Progress Chart',
        description: 'Visual progress tracking charts',
        category: ComponentCategory.charts,
        demoWidget: _buildProgressChartDemo(),
      ),

      // Business Components
      UIComponent(
        name: 'Investment Card',
        description: 'Card component for displaying investment information',
        category: ComponentCategory.business,
        demoWidget: _buildInvestmentCardDemo(),
      ),
      UIComponent(
        name: 'Project Card',
        description: 'Card component for project information',
        category: ComponentCategory.business,
        demoWidget: _buildProjectCardDemo(),
      ),
      UIComponent(
        name: 'Impact Metrics',
        description: 'Components for displaying impact measurements',
        category: ComponentCategory.business,
        demoWidget: _buildImpactMetricsDemo(),
      ),
    ];
  }

  // Demo widget builders
  Widget _buildAdaptiveCardDemo() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Adaptive Card Example',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'This card adapts to the current theme and platform',
              style: AdaptiveTextStyles.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextStylesDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: AdaptiveTextStyles.displayLarge(context)),
        Text('Headline Large',
            style: AdaptiveTextStyles.headlineLarge(context)),
        Text('Title Large', style: AdaptiveTextStyles.titleLarge(context)),
        Text('Body Large', style: AdaptiveTextStyles.bodyLarge(context)),
        Text('Body Medium', style: AdaptiveTextStyles.bodyMedium(context)),
        Text('Body Small', style: AdaptiveTextStyles.bodySmall(context)),
      ],
    );
  }

  Widget _buildResponsiveLayoutDemo() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Responsive Layout Demo',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.md),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.blue.withOpacity(0.3),
                  child: const Center(child: Text('Mobile')),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.green.withOpacity(0.3),
                  child: const Center(child: Text('Tablet')),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.orange.withOpacity(0.3),
                  child: const Center(child: Text('Desktop')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonDemo() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Primary Button'),
        ),
        const SizedBox(height: Spacing.sm),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Secondary Button'),
        ),
        const SizedBox(height: Spacing.sm),
        TextButton(
          onPressed: () {},
          child: const Text('Text Button'),
        ),
      ],
    );
  }

  Widget _buildIconButtonDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildSearchBarDemo() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildFormFieldDemo() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: Spacing.sm),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Country',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: ['UK', 'US', 'Canada'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildNavigationDemo() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Profile'),
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text('Content Area'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabDemo() {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              children: [
                Center(child: Text('Tab 1 Content')),
                Center(child: Text('Tab 2 Content')),
                Center(child: Text('Tab 3 Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadgeDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Active',
            style: TextStyle(color: Colors.green, fontSize: 12),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Pending',
            style: TextStyle(color: Colors.orange, fontSize: 12),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Inactive',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressDemo() {
    return const Column(
      children: [
        LinearProgressIndicator(value: 0.7),
        SizedBox(height: Spacing.md),
        CircularProgressIndicator(value: 0.5),
      ],
    );
  }

  Widget _buildSnackBarDemo() {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This is a snack bar demo')),
        );
      },
      child: const Text('Show Snack Bar'),
    );
  }

  Widget _buildDialogDemo() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Demo Dialog'),
            content: const Text('This is a dialog demo'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Text('Show Dialog'),
    );
  }

  Widget _buildSpacingDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 50, height: 20, color: Colors.blue),
        const SizedBox(height: Spacing.xs),
        Container(width: 100, height: 20, color: Colors.green),
        const SizedBox(height: Spacing.sm),
        Container(width: 150, height: 20, color: Colors.orange),
        const SizedBox(height: Spacing.md),
        Container(width: 200, height: 20, color: Colors.purple),
      ],
    );
  }

  Widget _buildGridDemo() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: [
              Colors.blue,
              Colors.green,
              Colors.orange,
              Colors.purple
            ][index]
                .withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text('Item ${index + 1}'),
          ),
        );
      },
    );
  }

  Widget _buildChartDemo() {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(width: 20, height: 100, color: Colors.blue),
          Container(width: 20, height: 80, color: Colors.green),
          Container(width: 20, height: 120, color: Colors.orange),
          Container(width: 20, height: 60, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildProgressChartDemo() {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            CircularProgressIndicator(
              value: 0.75,
              strokeWidth: 8,
              backgroundColor: Colors.grey.withOpacity(0.3),
            ),
            const Center(
              child: Text(
                '75%',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentCardDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.eco, color: Colors.green),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Solar Energy Project',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '€50,000 invested',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Return: +15.2%', style: TextStyle(color: Colors.green)),
              Text('Impact Score: 94', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCardDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Clean Water Initiative',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Providing clean water access to rural communities in Kenya',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 12),
          const LinearProgressIndicator(value: 0.68),
          const SizedBox(height: 8),
          const Text('68% funded • €340K raised', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildImpactMetricsDemo() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Text(
                  '2,500',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text('People Helped', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Text(
                  '15.2 MW',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text('Clean Energy', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Component category enum
enum ComponentCategory {
  all('All Components'),
  adaptive('Adaptive'),
  buttons('Buttons'),
  inputs('Inputs'),
  navigation('Navigation'),
  display('Display'),
  feedback('Feedback'),
  layout('Layout'),
  charts('Charts'),
  business('Business');

  const ComponentCategory(this.displayName);
  final String displayName;
}

/// UI Component model
class UIComponent {
  final String name;
  final String description;
  final ComponentCategory category;
  final Widget demoWidget;

  UIComponent({
    required this.name,
    required this.description,
    required this.category,
    required this.demoWidget,
  });
}
