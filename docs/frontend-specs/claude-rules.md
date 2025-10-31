# Claude Code Development Rules - Social Finance Impact Platform Frontend

## DOCUMENTATION USAGE - CRITICAL RULE

**ALWAYS read frontend_ai_guide_mobile.md FIRST**
- FIRST RULE: Follow the 6-phase development order specified in frontend_development_plan_mobile.md
- RULE: Use the exact multi-platform patterns described in frontend_ai_guide_mobile.md  
- RULE: Validate responsive design on mobile, tablet, and desktop at each step

## MANDATORY EXECUTION ORDER

**RULE: NEVER generate files out of sequence in frontend_development_plan_mobile.md**
- RULE: Follow the exact 6-phase structure (Setup → Components → Auth → Features → Platform-Specific → Deploy)
- RULE: Generate files in strict hierarchical order according to frontend_architecture_mobile.md
- RULE: Validate after every 3 files using `flutter test` and `flutter analyze`
- RULE: Test on Android, iOS, AND Web after each major component

## MULTI-PLATFORM REQUIREMENTS - ABSOLUTE

**RULE: EVERY component MUST work on Android, iOS, AND Web**
- RULE: Use ResponsiveLayout wrapper for ALL pages
- RULE: Implement platform detection with PlatformDetector class
- RULE: Apply adaptive styling according to frontend_uiux_mobile.md
- ABSOLUTE PROHIBITION: No platform-specific code without adaptive fallbacks

## FLUTTER ARCHITECTURE STANDARDS

**RULE: Follow Clean Architecture + Riverpod exactly as specified**
- RULE: Every feature MUST follow the data/domain/presentation layer structure
- RULE: Use @riverpod annotations for ALL providers  
- RULE: Implement freezed classes for ALL data models
- RULE: Apply adaptive UI patterns from shared/widgets/adaptive/

## RESPONSIVE DESIGN REQUIREMENTS

**RULE: ALL UI components MUST be responsive**
- RULE: Use AdaptiveSpacing for ALL spacing values
- RULE: Apply AdaptiveTextStyles for ALL text
- RULE: Implement mobile/tablet/desktop layouts for EVERY page
- RULE: Follow breakpoint system: mobile <600px, tablet 600-1024px, desktop >1024px

## FIREBASE INTEGRATION STANDARDS

**RULE: Follow firebase integration patterns from frontend_firebase_mobile.md exactly**
- RULE: Configure Firebase for Android, iOS, AND Web simultaneously
- RULE: Use adaptive authentication (biometrics mobile, popup web)
- RULE: Implement offline persistence for mobile, cache optimization for web
- RULE: Apply platform-specific optimizations per frontend_firebase_mobile.md

## TESTING AND VALIDATION

**RULE: Every widget MUST have unit and widget tests**  
- RULE: Test responsive behavior on all breakpoints
- RULE: Validate platform-specific features (biometrics, notifications, etc.)
- RULE: Run integration tests on actual devices/browsers
- RULE: Achieve >80% test coverage before proceeding to next phase

## SECURITY AND PERFORMANCE

**RULE: Apply platform-specific optimizations**
- RULE: Mobile: Enable offline persistence, optimize memory usage
- RULE: Web: Implement code splitting, service worker caching  
- RULE: Universal: Lazy loading, image caching, secure storage
- RULE: Follow adaptive storage patterns from core/services/

## UI/UX CONSISTENCY

**RULE: Follow adaptive design system from frontend_uiux_mobile.md**
- RULE: Use AdaptiveColors, AdaptiveTextStyles, AdaptiveSpacing exclusively
- RULE: Implement platform-native interactions (iOS: swipe, Android: material, Web: hover)
- RULE: Apply Material Design 3 with platform adaptations
- RULE: Maintain visual consistency across all platforms

## CODE ORGANIZATION

**RULE: Follow exact folder structure from frontend_architecture_mobile.md**
- RULE: Separate platform-specific code in platform/ directory
- RULE: Keep shared adaptive components in shared/widgets/adaptive/
- RULE: Organize features by domain with consistent layer structure
- RULE: Use consistent naming conventions: adaptive_*, responsive_*, platform_*

## BUILD AND DEPLOYMENT

**RULE: Build and test for ALL platforms before any commit**
```bash
flutter build apk --debug      # Android
flutter build ios --debug      # iOS  
flutter build web --debug      # Web
flutter test                   # All tests
```

**ABSOLUTE PROHIBITIONS:**
- Never skip multi-platform validation
- Never use platform-specific code without adaptive wrappers  
- Never proceed without testing responsive behavior
- Never ignore the sequential development plan
- Never commit code that fails on any target platform