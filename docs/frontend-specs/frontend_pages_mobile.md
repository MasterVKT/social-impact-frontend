# Pages et Fonctionnalités Frontend - Mobile Hybride + Web Responsive
## Social Finance Impact Platform MVP

## 1. Architecture des pages adaptatives

### 1.1 Structure universelle des pages

```dart
// shared/widgets/pages/adaptive_page_base.dart
abstract class AdaptivePageBase extends StatelessWidget {
  const AdaptivePageBase({Key? key}) : super(key: key);

  // Méthodes à implémenter par chaque page
  Widget buildMobile(BuildContext context);
  Widget buildTablet(BuildContext context);
  Widget buildDesktop(BuildContext context);
  
  // Configuration optionnelle
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;
  Widget? buildFloatingActionButton(BuildContext context) => null;
  Widget? buildBottomNavigation(BuildContext context) => null;
  Widget? buildDrawer(BuildContext context) => null;
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileScaffold(context),
      tablet: _buildTabletScaffold(context),
      desktop: _buildDesktopScaffold(context),
    );
  }
  
  Widget _buildMobileScaffold(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: buildMobile(context),
      ),
      floatingActionButton: buildFloatingActionButton(context),
      bottomNavigationBar: buildBottomNavigation(context),
      drawer: buildDrawer(context),
    );
  }
  
  Widget _buildTabletScaffold(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildTablet(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }
  
  Widget _buildDesktopScaffold(BuildContext context) {
    return Scaffold(
      body: buildDesktop(context),
    );
  }
}
```

## 2. Authentification - Pages adaptatives

### 2.1 Page de connexion multi-plateforme

```dart
// features/auth/presentation/pages/login_page.dart
class LoginPage extends AdaptivePageBase {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildMobile(BuildContext context) {
    return SingleChildScrollView(
      padding: AdaptiveSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AdaptiveSpacing.xxl(context)),
          
          // Logo mobile
          _buildMobileLogo(context),
          SizedBox(height: AdaptiveSpacing.xxl(context)),
          
          // Titre mobile
          Text(
            'Connexion',
            style: AdaptiveTextStyles.headingXLarge(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AdaptiveSpacing.sm(context)),
          
          Text(
            'Connectez-vous à votre compte',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: AdaptiveColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AdaptiveSpacing.xxl(context)),
          
          // Formulaire mobile
          _buildMobileLoginForm(context),
          SizedBox(height: AdaptiveSpacing.xl(context)),
          
          // Boutons sociaux mobile
          _buildMobileSocialButtons(context),
          
          // Biométrie si disponible sur mobile
          if (PlatformDetector.isMobile) ...[
            SizedBox(height: AdaptiveSpacing.lg(context)),
            _buildBiometricButton(context),
          ],
          
          SizedBox(height: AdaptiveSpacing.xl(context)),
          
          // Liens mobile
          _buildMobileFooterLinks(context),
        ],
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          padding: AdaptiveSpacing.paddingXL(context),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: AdaptiveSpacing.paddingXL(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo tablette
                  _buildTabletLogo(context),
                  SizedBox(height: AdaptiveSpacing.xl(context)),
                  
                  // Titre tablette
                  Text(
                    'Connexion',
                    style: AdaptiveTextStyles.headingLarge(context),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AdaptiveSpacing.lg(context)),
                  
                  // Formulaire tablette
                  _buildTabletLoginForm(context),
                  SizedBox(height: AdaptiveSpacing.lg(context)),
                  
                  // Boutons sociaux tablette
                  _buildTabletSocialButtons(context),
                  SizedBox(height: AdaptiveSpacing.lg(context)),
                  
                  // Liens tablette
                  _buildTabletFooterLinks(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Row(
      children: [
        // Panneau gauche - Image/Branding
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AdaptiveColors.primaryBlue,
                  AdaptiveColors.primaryBlueDark,
                ],
              ),
            ),
            child: _buildDesktopBrandingPanel(context),
          ),
        ),
        
        // Panneau droit - Formulaire
        Expanded(
          flex: 2,
          child: Container(
            color: AdaptiveColors.backgroundPrimary,
            child: Center(
              child: SizedBox(
                width: 400,
                child: SingleChildScrollView(
                  padding: AdaptiveSpacing.paddingXL(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo desktop
                      _buildDesktopLogo(context),
                      SizedBox(height: AdaptiveSpacing.xl(context)),
                      
                      // Titre desktop
                      Text(
                        'Connectez-vous',
                        style: AdaptiveTextStyles.headingXLarge(context),
                      ),
                      SizedBox(height: AdaptiveSpacing.sm(context)),
                      
                      Text(
                        'Accédez à votre tableau de bord',
                        style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                          color: AdaptiveColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: AdaptiveSpacing.xxl(context)),
                      
                      // Formulaire desktop
                      _buildDesktopLoginForm(context),
                      SizedBox(height: AdaptiveSpacing.xl(context)),
                      
                      // Divider
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AdaptiveSpacing.md(context),
                            ),
                            child: Text(
                              'ou',
                              style: AdaptiveTextStyles.bodySmall(context),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: AdaptiveSpacing.xl(context)),
                      
                      // Boutons sociaux desktop
                      _buildDesktopSocialButtons(context),
                      SizedBox(height: AdaptiveSpacing.xl(context)),
                      
                      // Liens desktop
                      _buildDesktopFooterLinks(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // AppBar uniquement sur mobile/tablette
    if (ResponsiveUtils.isDesktopScreen(context)) return null;
    
    return AdaptiveAppBar(
      title: 'Connexion',
      showBackButton: Navigator.canPop(context),
    );
  }

  // Formulaires adaptatifs
  Widget _buildMobileLoginForm(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authState = ref.watch(authNotifierProvider);
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email
            AdaptiveTextField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                PlatformDetector.isIOS 
                    ? CupertinoIcons.mail 
                    : Icons.email_outlined,
              ),
              onChanged: (value) => ref.read(loginFormProvider.notifier)
                  .updateEmail(value),
            ),
            SizedBox(height: AdaptiveSpacing.lg(context)),
            
            // Mot de passe
            AdaptiveTextField(
              label: 'Mot de passe',
              obscureText: true,
              prefixIcon: Icon(
                PlatformDetector.isIOS 
                    ? CupertinoIcons.lock 
                    : Icons.lock_outline,
              ),
              onChanged: (value) => ref.read(loginFormProvider.notifier)
                  .updatePassword(value),
            ),
            SizedBox(height: AdaptiveSpacing.md(context)),
            
            // Remember me + Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final rememberMe = ref.watch(loginFormProvider
                            .select((state) => state.rememberMe));
                        
                        if (PlatformDetector.isIOS) {
                          return CupertinoSwitch(
                            value: rememberMe,
                            onChanged: (value) => ref
                                .read(loginFormProvider.notifier)
                                .updateRememberMe(value),
                          );
                        } else {
                          return Checkbox(
                            value: rememberMe,
                            onChanged: (value) => ref
                                .read(loginFormProvider.notifier)
                                .updateRememberMe(value ?? false),
                          );
                        }
                      },
                    ),
                    SizedBox(width: AdaptiveSpacing.xs(context)),
                    Text(
                      'Se souvenir',
                      style: AdaptiveTextStyles.bodySmall(context),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => _showForgotPasswordDialog(context),
                  child: Text(
                    'Mot de passe oublié ?',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: AdaptiveColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AdaptiveSpacing.xl(context)),
            
            // Bouton connexion
            AdaptivePrimaryButton(
              text: 'Se connecter',
              isLoading: authState.isLoading,
              onPressed: () => _handleLogin(context, ref),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMobileSocialButtons(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return FutureBuilder<AuthCapabilities>(
          future: ref.watch(authCapabilitiesProvider.future),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }
            
            final capabilities = snapshot.data!;
            
            return Column(
              children: [
                // Google Sign-In (universel)
                if (capabilities.supportsGoogleSignIn)
                  _buildGoogleSignInButton(context, ref),
                
                // Apple Sign-In (iOS uniquement)
                if (capabilities.supportsAppleSignIn) ...[
                  SizedBox(height: AdaptiveSpacing.md(context)),
                  _buildAppleSignInButton(context, ref),
                ],
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildBiometricButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return FutureBuilder<AuthCapabilities>(
          future: ref.watch(authCapabilitiesProvider.future),
          builder: (context, snapshot) {
            if (!snapshot.hasData || !snapshot.data!.supportsBiometrics) {
              return const SizedBox.shrink();
            }
            
            return AdaptiveCard(
              onTap: () => _handleBiometricLogin(context, ref),
              child: Padding(
                padding: AdaptiveSpacing.paddingMD(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PlatformDetector.isIOS 
                          ? CupertinoIcons.touchid 
                          : Icons.fingerprint,
                      color: AdaptiveColors.primaryColor,
                    ),
                    SizedBox(width: AdaptiveSpacing.sm(context)),
                    Text(
                      'Connexion biométrique',
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        color: AdaptiveColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: AdaptiveSpacing.minimumTouchTarget,
      child: OutlinedButton.icon(
        onPressed: () => _handleGoogleSignIn(context, ref),
        icon: Image.asset(
          'assets/images/google_logo.png',
          height: 20,
          width: 20,
        ),
        label: Text(
          'Continuer avec Google',
          style: AdaptiveTextStyles.bodyMedium(context),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AdaptiveColors.borderPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildAppleSignInButton(BuildContext context, WidgetRef ref) {
    if (!PlatformDetector.isIOS) return const SizedBox.shrink();
    
    return SizedBox(
      width: double.infinity,
      height: AdaptiveSpacing.minimumTouchTarget,
      child: SignInWithAppleButton(
        onPressed: () => _handleAppleSignIn(context, ref),
        text: 'Continuer avec Apple',
        height: AdaptiveSpacing.minimumTouchTarget,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  // Gestion des événements
  Future<void> _handleLogin(BuildContext context, WidgetRef ref) async {
    try {
      final form = ref.read(loginFormProvider);
      
      if (!_validateForm(form)) {
        _showErrorMessage(context, 'Veuillez remplir tous les champs');
        return;
      }
      
      await ref.read(authNotifierProvider.notifier).signInWithEmail(
        email: form.email,
        password: form.password,
        rememberMe: form.rememberMe,
      );
      
      if (context.mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorMessage(context, e.toString());
      }
    }
  }
  
  Future<void> _handleGoogleSignIn(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authNotifierProvider.notifier).signInWithGoogle();
      if (context.mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorMessage(context, e.toString());
      }
    }
  }
  
  Future<void> _handleAppleSignIn(BuildContext context, WidgetRef ref) async {
    if (!PlatformDetector.isIOS) return;
    
    try {
      await ref.read(authNotifierProvider.notifier).signInWithApple();
      if (context.mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorMessage(context, e.toString());
      }
    }
  }
  
  Future<void> _handleBiometricLogin(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authNotifierProvider.notifier).signInWithBiometrics();
      if (context.mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorMessage(context, e.toString());
      }
    }
  }

  // Méthodes utilitaires
  bool _validateForm(LoginFormState form) {
    return form.email.isNotEmpty && 
           form.password.isNotEmpty &&
           form.email.contains('@');
  }
  
  void _showErrorMessage(BuildContext context, String message) {
    if (PlatformDetector.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Erreur'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
  
  void _showForgotPasswordDialog(BuildContext context) {
    // Implémentation du dialog mot de passe oublié
  }

  // Widgets spécifiques par plateforme
  Widget _buildMobileLogo(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: AdaptiveColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
  
  // Autres méthodes de build pour tablette et desktop...
}

// Providers pour le formulaire de connexion
@riverpod
class LoginForm extends _$LoginForm {
  @override
  LoginFormState build() {
    return const LoginFormState();
  }
  
  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }
  
  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }
  
  void updateRememberMe(bool rememberMe) {
    state = state.copyWith(rememberMe: rememberMe);
  }
}

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool rememberMe,
  }) = _LoginFormState;
}
```

## 3. Dashboard - Interface adaptative

### 3.1 Dashboard principal multi-plateforme

```dart
// features/dashboard/presentation/pages/dashboard_page.dart
class DashboardPage extends AdaptivePageBase {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget buildMobile(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh data
        await _refreshDashboardData(context);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: AdaptiveSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header mobile avec avatar et notifications
            _buildMobileHeader(context),
            SizedBox(height: AdaptiveSpacing.xl(context)),
            
            // Stats cards mobile (vertical)
            _buildMobileStatsCards(context),
            SizedBox(height: AdaptiveSpacing.xl(context)),
            
            // Actions rapides mobile
            _buildMobileQuickActions(context),
            SizedBox(height: AdaptiveSpacing.xl(context)),
            
            // Projets récents mobile
            _buildMobileRecentProjects(context),
            SizedBox(height: AdaptiveSpacing.xl(context)),
            
            // Activité récente mobile
            _buildMobileRecentActivity(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return SingleChildScrollView(
      padding: AdaptiveSpacing.paddingXL(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header tablette
          _buildTabletHeader(context),
          SizedBox(height: AdaptiveSpacing.xl(context)),
          
          // Stats en grille 2x2
          _buildTabletStatsGrid(context),
          SizedBox(height: AdaptiveSpacing.xl(context)),
          
          // Layout deux colonnes
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Colonne gauche
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildTabletRecentProjects(context),
                    SizedBox(height: AdaptiveSpacing.xl(context)),
                    _buildTabletQuickActions(context),
                  ],
                ),
              ),
              SizedBox(width: AdaptiveSpacing.xl(context)),
              
              // Colonne droite
              Expanded(
                flex: 1,
                child: _buildTabletActivityFeed(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SingleChildScrollView(
      padding: AdaptiveSpacing.paddingXL(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header desktop avec breadcrumbs
          _buildDesktopHeader(context),
          SizedBox(height: AdaptiveSpacing.xl(context)),
          
          // Stats en ligne 4 colonnes
          _buildDesktopStatsRow(context),
          SizedBox(height: AdaptiveSpacing.xxl(context)),
          
          // Layout trois colonnes
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Colonne principale
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildDesktopProjectsOverview(context),
                    SizedBox(height: AdaptiveSpacing.xl(context)),
                    _buildDesktopRecentProjects(context),
                  ],
                ),
              ),
              SizedBox(width: AdaptiveSpacing.xl(context)),
              
              // Sidebar droite
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _buildDesktopQuickActions(context),
                    SizedBox(height: AdaptiveSpacing.xl(context)),
                    _buildDesktopActivityFeed(context),
                    SizedBox(height: AdaptiveSpacing.xl(context)),
                    _buildDesktopNotifications(context),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Header adaptatifs
  Widget _buildMobileHeader(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(currentUserProvider);
        
        return user.when(
          data: (userData) => Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 24,
                backgroundImage: userData?.profilePicture != null
                    ? NetworkImage(userData!.profilePicture!)
                    : null,
                child: userData?.profilePicture == null
                    ? Text(userData?.firstName[0] ?? 'U')
                    : null,
              ),
              SizedBox(width: AdaptiveSpacing.md(context)),
              
              // Salutation
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour,',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: AdaptiveColors.textSecondary,
                      ),
                    ),
                    Text(
                      userData?.firstName ?? 'Utilisateur',
                      style: AdaptiveTextStyles.headingMedium(context),
                    ),
                  ],
                ),
              ),
              
              // Notifications mobile
              _buildMobileNotificationBadge(context),
            ],
          ),
          loading: () => _buildHeaderSkeleton(context),
          error: (error, stack) => _buildHeaderError(context),
        );
      },
    );
  }

  Widget _buildMobileNotificationBadge(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifications = ref.watch(unreadNotificationsProvider);
        
        return notifications.when(
          data: (count) => Stack(
            children: [
              IconButton(
                icon: Icon(
                  PlatformDetector.isIOS 
                      ? CupertinoIcons.bell 
                      : Icons.notifications_outlined,
                ),
                onPressed: () => _showNotifications(context),
              ),
              if (count > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AdaptiveColors.errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      count > 99 ? '99+' : count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          loading: () => IconButton(
            icon: Icon(
              PlatformDetector.isIOS 
                  ? CupertinoIcons.bell 
                  : Icons.notifications_outlined,
            ),
            onPressed: null,
          ),
          error: (error, stack) => const SizedBox.shrink(),
        );
      },
    );
  }

  // Stats cards adaptatifs
  Widget _buildMobileStatsCards(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final stats = ref.watch(userStatsProvider);
        
        return stats.when(
          data: (statsData) => Column(
            children: [
              _buildStatCard(
                context,
                title: 'Contributions',
                value: '${statsData.totalContributions}',
                subtitle: '${statsData.totalAmountContributed.toStringAsFixed(0)}€',
                icon: Icons.favorite,
                color: AdaptiveColors.primaryColor,
              ),
              SizedBox(height: AdaptiveSpacing.md(context)),
              
              _buildStatCard(
                context,
                title: 'Projets soutenus',
                value: '${statsData.projectsSupported}',
                subtitle: '${statsData.activeProjects} actifs',
                icon: Icons.rocket_launch,
                color: AdaptiveColors.secondaryGreen,
              ),
              
              if (statsData.userType == 'project_creator') ...[
                SizedBox(height: AdaptiveSpacing.md(context)),
                _buildStatCard(
                  context,
                  title: 'Mes projets',
                  value: '${statsData.projectsCreated}',
                  subtitle: '${statsData.totalRaised.toStringAsFixed(0)}€ collectés',
                  icon: Icons.lightbulb,
                  color: AdaptiveColors.accentOrange,
                ),
              ],
            ],
          ),
          loading: () => _buildStatsCardsSkeleton(context),
          error: (error, stack) => _buildStatsError(context),
        );
      },
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return AdaptiveCard(
      child: Padding(
        padding: AdaptiveSpacing.paddingMD(context),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(AdaptiveSpacing.md(context)),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(width: AdaptiveSpacing.md(context)),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: AdaptiveTextStyles.headingLarge(context).copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: AdaptiveColors.textSecondary,
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

  // Actions rapides adaptatives
  Widget _buildMobileQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Actions rapides',
          style: AdaptiveTextStyles.headingMedium(context),
        ),
        SizedBox(height: AdaptiveSpacing.lg(context)),
        
        AdaptiveGrid(
          mobileColumns: 2,
          spacing: AdaptiveSpacing.md(context),
          children: [
            _buildQuickActionCard(
              context,
              title: 'Découvrir des projets',
              icon: Icons.explore,
              color: AdaptiveColors.primaryColor,
              onTap: () => context.go('/projects'),
            ),
            _buildQuickActionCard(
              context,
              title: 'Créer un projet',
              icon: Icons.add_circle,
              color: AdaptiveColors.secondaryGreen,
              onTap: () => context.go('/projects/create'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AdaptiveCard(
      onTap: onTap,
      child: Padding(
        padding: AdaptiveSpacing.paddingMD(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(AdaptiveSpacing.md(context)),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            SizedBox(height: AdaptiveSpacing.md(context)),
            Text(
              title,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    if (ResponsiveUtils.isDesktopScreen(context)) return null;
    
    return AdaptiveAppBar(
      title: 'Tableau de bord',
      showBackButton: false,
      actions: [
        if (ResponsiveUtils.isMobileScreen(context))
          IconButton(
            icon: Icon(
              PlatformDetector.isIOS 
                  ? CupertinoIcons.search 
                  : Icons.search,
            ),
            onPressed: () => _showSearch(context),
          ),
      ],
    );
  }

  // Méthodes utilitaires
  Future<void> _refreshDashboardData(BuildContext context) async {
    // Implémentation du refresh
  }
  
  void _showNotifications(BuildContext context) {
    // Affichage des notifications
  }
  
  void _showSearch(BuildContext context) {
    // Affichage de la recherche
  }
}
```

Cette architecture de pages adaptatives assure une expérience utilisateur optimale sur toutes les plateformes avec des interfaces natives et des interactions appropriées pour chaque environnement (mobile, tablette, desktop).