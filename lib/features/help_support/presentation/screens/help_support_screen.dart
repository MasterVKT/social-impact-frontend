import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/help_search_bar.dart';
import '../widgets/help_category_card.dart';
import '../widgets/support_quick_actions.dart';
import '../widgets/system_status_banner.dart';
import '../../domain/entities/help_support.dart';

/// Main help and support screen with comprehensive support options
class HelpSupportScreen extends ConsumerStatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  ConsumerState<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends ConsumerState<HelpSupportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
          'Help & Support',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/support/contact'),
            icon: const Icon(Icons.contact_support),
            tooltip: 'Contact Support',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Help Center', icon: Icon(Icons.help_outline)),
            Tab(text: 'Support', icon: Icon(Icons.support_agent)),
            Tab(text: 'Community', icon: Icon(Icons.forum)),
            Tab(text: 'Status', icon: Icon(Icons.health_and_safety)),
          ],
        ),
      ),
      body: Column(
        children: [
          const SystemStatusBanner(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildHelpCenterTab(context),
                _buildSupportTab(context),
                _buildCommunityTab(context),
                _buildStatusTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _startLiveChat(context),
            icon: const Icon(Icons.chat, size: 18),
            label: const Text('Live Chat'),
          ),
          const SizedBox(width: Spacing.sm),
          ElevatedButton.icon(
            onPressed: () => context.push('/support/ticket/create'),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Ticket'),
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: Column(
        children: [
          const SystemStatusBanner(),
          Expanded(
            child: Row(
              children: [
                // Navigation rail
                SizedBox(
                  width: 200,
                  child: NavigationRail(
                    selectedIndex: _tabController.index,
                    onDestinationSelected: (index) {
                      setState(() {
                        _tabController.index = index;
                      });
                    },
                    extended: true,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.help_outline),
                        selectedIcon: Icon(Icons.help),
                        label: Text('Help Center'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.support_agent_outlined),
                        selectedIcon: Icon(Icons.support_agent),
                        label: Text('Support'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.forum_outlined),
                        selectedIcon: Icon(Icons.forum),
                        label: Text('Community'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.health_and_safety_outlined),
                        selectedIcon: Icon(Icons.health_and_safety),
                        label: Text('System Status'),
                      ),
                    ],
                  ),
                ),

                const VerticalDivider(thickness: 1, width: 1),

                // Main content
                Expanded(
                  child: IndexedStack(
                    index: _tabController.index,
                    children: [
                      _buildHelpCenterTab(context),
                      _buildSupportTab(context),
                      _buildCommunityTab(context),
                      _buildStatusTab(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build desktop layout with comprehensive dashboard
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support Center',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _viewAllTickets(context),
            icon: const Icon(Icons.confirmation_number, size: 18),
            label: const Text('My Tickets'),
          ),
          const SizedBox(width: Spacing.sm),
          TextButton.icon(
            onPressed: () => _startLiveChat(context),
            icon: const Icon(Icons.chat, size: 18),
            label: const Text('Live Chat'),
          ),
          const SizedBox(width: Spacing.sm),
          ElevatedButton.icon(
            onPressed: () => context.push('/support/ticket/create'),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Support Ticket'),
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: Column(
        children: [
          const SystemStatusBanner(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section with search
                  _buildHeaderSection(context),
                  AdaptiveSpacing.verticalLarge(),

                  // Main content grid
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left column - Help content
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _buildHelpCenterSection(context),
                            AdaptiveSpacing.verticalLarge(),
                            _buildFAQSection(context),
                          ],
                        ),
                      ),

                      const SizedBox(width: Spacing.lg),

                      // Right column - Support actions
                      Expanded(
                        child: Column(
                          children: [
                            const SupportQuickActions(),
                            AdaptiveSpacing.verticalLarge(),
                            _buildContactSection(context),
                            AdaptiveSpacing.verticalLarge(),
                            _buildRecentTicketsSection(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build help center tab
  Widget _buildHelpCenterTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelpSearchBar(
            onChanged: (query) => setState(() => _searchQuery = query),
          ),
          AdaptiveSpacing.verticalLarge(),
          _buildHelpCategories(context),
          AdaptiveSpacing.verticalLarge(),
          _buildPopularArticles(context),
          AdaptiveSpacing.verticalLarge(),
          _buildFeaturedGuides(context),
        ],
      ),
    );
  }

  /// Build support tab
  Widget _buildSupportTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SupportQuickActions(),
          AdaptiveSpacing.verticalLarge(),
          _buildMyTicketsSection(context),
          AdaptiveSpacing.verticalLarge(),
          _buildContactOptions(context),
        ],
      ),
    );
  }

  /// Build community tab
  Widget _buildCommunityTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommunityHeader(context),
          AdaptiveSpacing.verticalLarge(),
          _buildCommunityStats(context),
          AdaptiveSpacing.verticalLarge(),
          _buildRecentDiscussions(context),
        ],
      ),
    );
  }

  /// Build status tab
  Widget _buildStatusTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSystemOverview(context),
          AdaptiveSpacing.verticalLarge(),
          _buildServicesList(context),
          AdaptiveSpacing.verticalLarge(),
          _buildRecentIncidents(context),
        ],
      ),
    );
  }

  /// Build header section
  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How can we help you today?',
          style: AdaptiveTextStyles.headlineMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        Text(
          'Search our knowledge base or get in touch with our support team',
          style: AdaptiveTextStyles.bodyLarge(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        AdaptiveSpacing.verticalLarge(),
        HelpSearchBar(
          onChanged: (query) => setState(() => _searchQuery = query),
        ),
      ],
    );
  }

  /// Build help center section
  Widget _buildHelpCenterSection(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Help Topics',
              style: AdaptiveTextStyles.titleLarge(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            _buildHelpCategories(context),
          ],
        ),
      ),
    );
  }

  /// Build help categories
  Widget _buildHelpCategories(BuildContext context) {
    final categories = _getMockHelpCategories();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 3 : 2,
        crossAxisSpacing: Spacing.md,
        mainAxisSpacing: Spacing.md,
        childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return HelpCategoryCard(
          category: category,
          onTap: () => _navigateToCategory(context, category),
        );
      },
    );
  }

  /// Build FAQ section
  Widget _buildFAQSection(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => context.push('/help/faq'),
                  child: const Text('View All'),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            ..._getMockFAQs().take(5).map((faq) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: _buildFAQItem(context, faq),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Build FAQ item
  Widget _buildFAQItem(BuildContext context, FAQ faq) {
    return InkWell(
      onTap: () => _viewFAQ(context, faq),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.help_outline,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Text(
                faq.question,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  /// Build popular articles
  Widget _buildPopularArticles(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Popular Articles',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => context.push('/help/articles'),
                  child: const Text('View All'),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            ..._getMockPopularArticles().map((article) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: _buildArticleItem(context, article),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Build article item
  Widget _buildArticleItem(BuildContext context, HelpArticle article) {
    return InkWell(
      onTap: () => _viewArticle(context, article),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.article_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (article.summary != null)
                    Text(
                      article.summary!,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${article.viewCount} views',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                  ),
                ),
                if (article.estimatedReadingTime > 0)
                  Text(
                    '${article.estimatedReadingTime}m read',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build featured guides
  Widget _buildFeaturedGuides(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Featured Guides',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Step-by-step guides to help you get the most out of our platform',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            AdaptiveSpacing.verticalMedium(),
            Row(
              children: [
                Expanded(
                  child: _buildGuideCard(
                    context,
                    'Getting Started Guide',
                    'Learn the basics of impact investing',
                    Icons.play_arrow,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: _buildGuideCard(
                    context,
                    'Portfolio Management',
                    'Optimize your investment portfolio',
                    Icons.account_balance_wallet,
                    Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build guide card
  Widget _buildGuideCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          AdaptiveSpacing.verticalMedium(),
          Text(
            title,
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  /// Build my tickets section
  Widget _buildMyTicketsSection(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'My Support Tickets',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _viewAllTickets(context),
                  child: const Text('View All'),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            ..._getMockRecentTickets().map((ticket) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: _buildTicketItem(context, ticket),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Build ticket item
  Widget _buildTicketItem(BuildContext context, SupportTicket ticket) {
    return InkWell(
      onTap: () => _viewTicket(context, ticket),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(ticket.status).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ticket.status.displayName,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: _getStatusColor(ticket.status),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticket.subject,
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Ticket #${ticket.id.length >= 8 ? ticket.id.substring(0, 8) : ticket.id}',
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
            Text(
              _formatDate(ticket.createdAt),
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build contact options
  Widget _buildContactOptions(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Support',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            Row(
              children: [
                Expanded(
                  child: _buildContactOption(
                    context,
                    'Live Chat',
                    'Get instant help from our support team',
                    Icons.chat,
                    Colors.green,
                    () => _startLiveChat(context),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: _buildContactOption(
                    context,
                    'Email Support',
                    'Send us a detailed message',
                    Icons.email,
                    Colors.blue,
                    () => _sendEmail(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build contact option
  Widget _buildContactOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(Spacing.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            AdaptiveSpacing.verticalMedium(),
            Text(
              title,
              style: AdaptiveTextStyles.titleSmall(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build contact section
  Widget _buildContactSection(BuildContext context) {
    final contactInfo = _getMockContactInfo();

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            _buildContactItem(Icons.email, 'Email', contactInfo.email),
            const SizedBox(height: Spacing.sm),
            _buildContactItem(Icons.phone, 'Phone', contactInfo.phone),
            const SizedBox(height: Spacing.sm),
            _buildContactItem(
                Icons.schedule, 'Hours', contactInfo.businessHours),
            const SizedBox(height: Spacing.sm),
            _buildContactItem(Icons.access_time, 'Response Time',
                '${contactInfo.averageResponseTime} minutes avg'),
          ],
        ),
      ),
    );
  }

  /// Build contact item
  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 16,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          '$label: ',
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ),
      ],
    );
  }

  /// Build recent tickets section
  Widget _buildRecentTicketsSection(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Tickets',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            ..._getMockRecentTickets().take(3).map((ticket) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: _buildCompactTicketItem(context, ticket),
              );
            }),
            AdaptiveSpacing.verticalMedium(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _viewAllTickets(context),
                child: const Text('View All Tickets'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build compact ticket item
  Widget _buildCompactTicketItem(BuildContext context, SupportTicket ticket) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _getStatusColor(ticket.status),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            ticket.subject,
            style: AdaptiveTextStyles.bodyMedium(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          _formatDate(ticket.createdAt),
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  /// Build community header
  Widget _buildCommunityHeader(BuildContext context) {
    return AdaptiveCard(
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.forum,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Community Forum',
                        style: AdaptiveTextStyles.titleLarge(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Connect with other impact investors and share knowledge',
                        style: AdaptiveTextStyles.bodyMedium(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/community/join'),
                    icon: const Icon(Icons.add),
                    label: const Text('Join Discussion'),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.push('/community'),
                    icon: const Icon(Icons.explore),
                    label: const Text('Browse Topics'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build community stats
  Widget _buildCommunityStats(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
              _buildStatCard(context, '2,847', 'Active Members', Icons.people),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: _buildStatCard(
              context, '156', 'Discussions', Icons.chat_bubble_outline),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: _buildStatCard(
              context, '1,023', 'Solutions', Icons.check_circle_outline),
        ),
      ],
    );
  }

  /// Build stat card
  Widget _buildStatCard(
      BuildContext context, String value, String label, IconData icon) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              value,
              style: AdaptiveTextStyles.titleLarge(context).copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              label,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build recent discussions
  Widget _buildRecentDiscussions(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Discussions',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Join the conversation with fellow impact investors',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            AdaptiveSpacing.verticalLarge(),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.forum_outlined,
                    size: 48,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.3),
                  ),
                  AdaptiveSpacing.verticalMedium(),
                  Text(
                    'Community Feature Coming Soon',
                    style: AdaptiveTextStyles.titleMedium(context),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    'We\'re building an amazing community experience for impact investors',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build system overview
  Widget _buildSystemOverview(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'All Systems Operational',
                  style: AdaptiveTextStyles.titleMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'Last updated: 2 minutes ago',
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
              'All services are running normally. No known issues at this time.',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build services list
  Widget _buildServicesList(BuildContext context) {
    final services = _getMockSystemStatuses();

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service Status',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            ...services.map((status) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: _buildServiceItem(context, status),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Build service item
  Widget _buildServiceItem(BuildContext context, SystemStatus status) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _getServiceStatusColor(status.status),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            status.serviceName,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          status.status.displayName,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: _getServiceStatusColor(status.status),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// Build recent incidents
  Widget _buildRecentIncidents(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Incidents',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 48,
                    color: Colors.green,
                  ),
                  AdaptiveSpacing.verticalMedium(),
                  Text(
                    'No Recent Incidents',
                    style: AdaptiveTextStyles.titleMedium(context),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    'All services have been running smoothly',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get status color
  Color _getStatusColor(TicketStatus status) {
    switch (status) {
      case TicketStatus.open:
      case TicketStatus.reopened:
        return Colors.orange;
      case TicketStatus.inProgress:
        return Colors.blue;
      case TicketStatus.pendingCustomer:
        return Colors.amber;
      case TicketStatus.resolved:
      case TicketStatus.closed:
        return Colors.green;
    }
  }

  /// Get service status color
  Color _getServiceStatusColor(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.operational:
        return Colors.green;
      case ServiceStatus.degradedPerformance:
        return Colors.yellow;
      case ServiceStatus.partialOutage:
        return Colors.orange;
      case ServiceStatus.majorOutage:
        return Colors.red;
      case ServiceStatus.maintenance:
        return Colors.blue;
    }
  }

  /// Format date
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  // Mock data methods
  List<HelpCategory> _getMockHelpCategories() {
    return const [
      HelpCategory(
        id: 'getting-started',
        name: 'Getting Started',
        description: 'Learn the basics of impact investing',
        sortOrder: 1,
        articleIds: ['art1', 'art2'],
        iconName: 'play_arrow',
        color: '#4CAF50',
      ),
      HelpCategory(
        id: 'investments',
        name: 'Investment Management',
        description: 'Managing your investment portfolio',
        sortOrder: 2,
        articleIds: ['art3', 'art4'],
        iconName: 'account_balance_wallet',
        color: '#2196F3',
      ),
      HelpCategory(
        id: 'reporting',
        name: 'Reports & Analytics',
        description: 'Understanding your impact reports',
        sortOrder: 3,
        articleIds: ['art5', 'art6'],
        iconName: 'analytics',
        color: '#FF9800',
      ),
      HelpCategory(
        id: 'account',
        name: 'Account Settings',
        description: 'Managing your account and preferences',
        sortOrder: 4,
        articleIds: ['art7', 'art8'],
        iconName: 'settings',
        color: '#9C27B0',
      ),
    ];
  }

  List<FAQ> _getMockFAQs() {
    return [
      FAQ(
        id: 'faq1',
        question: 'How do I start investing in impact projects?',
        answer: 'Getting started is easy! First, complete your profile...',
        categoryId: 'getting-started',
        createdAt: DateTime.parse('2024-01-15T10:00:00Z'),
        updatedAt: DateTime.parse('2024-03-15T14:30:00Z'),
        viewCount: 247,
        helpfulCount: 23,
      ),
      FAQ(
        id: 'faq2',
        question: 'What are the minimum investment amounts?',
        answer: 'Minimum investment amounts vary by project...',
        categoryId: 'investments',
        createdAt: DateTime.parse('2024-01-20T11:00:00Z'),
        updatedAt: DateTime.parse('2024-03-10T15:30:00Z'),
        viewCount: 189,
        helpfulCount: 18,
      ),
      FAQ(
        id: 'faq3',
        question: 'How are impact measurements calculated?',
        answer: 'Impact measurements are calculated using...',
        categoryId: 'reporting',
        createdAt: DateTime.parse('2024-01-25T12:00:00Z'),
        updatedAt: DateTime.parse('2024-03-05T16:30:00Z'),
        viewCount: 156,
        helpfulCount: 15,
      ),
    ];
  }

  List<HelpArticle> _getMockPopularArticles() {
    return [
      HelpArticle(
        id: 'art1',
        title: 'Complete Guide to Impact Investing',
        content: 'This comprehensive guide covers...',
        categoryId: 'getting-started',
        createdAt: DateTime.parse('2024-01-15T10:00:00Z'),
        updatedAt: DateTime.parse('2024-03-15T14:30:00Z'),
        viewCount: 1247,
        helpfulCount: 89,
        estimatedReadingTime: 12,
        summary:
            'Everything you need to know to start your impact investing journey',
      ),
      HelpArticle(
        id: 'art2',
        title: 'Portfolio Diversification Strategies',
        content: 'Learn how to diversify your portfolio...',
        categoryId: 'investments',
        createdAt: DateTime.parse('2024-02-01T11:00:00Z'),
        updatedAt: DateTime.parse('2024-03-10T15:30:00Z'),
        viewCount: 892,
        helpfulCount: 67,
        estimatedReadingTime: 8,
        summary: 'Strategies for building a well-diversified impact portfolio',
      ),
      HelpArticle(
        id: 'art3',
        title: 'Understanding ESG Ratings',
        content: 'ESG ratings help you evaluate...',
        categoryId: 'reporting',
        createdAt: DateTime.parse('2024-02-15T12:00:00Z'),
        updatedAt: DateTime.parse('2024-03-05T16:30:00Z'),
        viewCount: 634,
        helpfulCount: 45,
        estimatedReadingTime: 6,
        summary:
            'How to interpret and use ESG ratings in your investment decisions',
      ),
    ];
  }

  List<SupportTicket> _getMockRecentTickets() {
    return [
      SupportTicket(
        id: 'ticket-001',
        userId: 'user1',
        subject: 'Unable to view portfolio performance',
        description: 'I cannot see my portfolio performance data...',
        priority: TicketPriority.medium,
        status: TicketStatus.inProgress,
        category: TicketCategory.technical,
        createdAt: DateTime.parse('2024-03-15T10:00:00Z'),
        updatedAt: DateTime.parse('2024-03-15T14:30:00Z'),
        assignedAgentId: 'agent1',
      ),
      SupportTicket(
        id: 'ticket-002',
        userId: 'user1',
        subject: 'Question about impact calculation',
        description:
            'How is the impact score calculated for renewable energy projects?',
        priority: TicketPriority.low,
        status: TicketStatus.resolved,
        category: TicketCategory.general,
        createdAt: DateTime.parse('2024-03-10T09:00:00Z'),
        updatedAt: DateTime.parse('2024-03-12T16:30:00Z'),
        resolvedAt: DateTime.parse('2024-03-12T16:30:00Z'),
      ),
      SupportTicket(
        id: 'ticket-003',
        userId: 'user1',
        subject: 'Payment processing issue',
        description: 'My payment failed but I was charged...',
        priority: TicketPriority.high,
        status: TicketStatus.pendingCustomer,
        category: TicketCategory.billing,
        createdAt: DateTime.parse('2024-03-12T15:00:00Z'),
        updatedAt: DateTime.parse('2024-03-14T11:30:00Z'),
        assignedAgentId: 'agent2',
      ),
    ];
  }

  List<SystemStatus> _getMockSystemStatuses() {
    return [
      SystemStatus(
        id: 'api',
        serviceName: 'API Services',
        status: ServiceStatus.operational,
        lastUpdated: DateTime.parse('2024-03-15T16:30:00Z'),
        statusMessage: 'All API endpoints are responding normally',
      ),
      SystemStatus(
        id: 'webapp',
        serviceName: 'Web Application',
        status: ServiceStatus.operational,
        lastUpdated: DateTime.parse('2024-03-15T16:30:00Z'),
        statusMessage: 'Web application is fully functional',
      ),
      SystemStatus(
        id: 'mobile',
        serviceName: 'Mobile Applications',
        status: ServiceStatus.operational,
        lastUpdated: DateTime.parse('2024-03-15T16:30:00Z'),
        statusMessage: 'iOS and Android apps are working normally',
      ),
      SystemStatus(
        id: 'payments',
        serviceName: 'Payment Processing',
        status: ServiceStatus.operational,
        lastUpdated: DateTime.parse('2024-03-15T16:30:00Z'),
        statusMessage: 'All payment processors are online',
      ),
      SystemStatus(
        id: 'notifications',
        serviceName: 'Notification Services',
        status: ServiceStatus.operational,
        lastUpdated: DateTime.parse('2024-03-15T16:30:00Z'),
        statusMessage: 'Email and push notifications are working',
      ),
    ];
  }

  ContactInfo _getMockContactInfo() {
    return const ContactInfo(
      email: 'support@socialimpact.app',
      phone: '+44 20 7123 4567',
      address: 'Social Impact Platform, London, UK',
      businessHours: 'Monday - Friday: 9:00 AM - 6:00 PM GMT',
      averageResponseTime: 15,
    );
  }

  // Navigation and action methods
  void _navigateToCategory(BuildContext context, HelpCategory category) {
    context.push('/help/category/${category.id}');
  }

  void _viewFAQ(BuildContext context, FAQ faq) {
    context.push('/help/faq/${faq.id}');
  }

  void _viewArticle(BuildContext context, HelpArticle article) {
    context.push('/help/article/${article.id}');
  }

  void _viewTicket(BuildContext context, SupportTicket ticket) {
    context.push('/support/ticket/${ticket.id}');
  }

  void _viewAllTickets(BuildContext context) {
    context.push('/support/tickets');
  }

  void _startLiveChat(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Starting live chat session...')),
    );
  }

  void _sendEmail(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opening email client...')),
    );
  }
}
