# Social Finance Impact Platform Frontend Development Rules

## MANDATORY MULTI-PLATFORM DEVELOPMENT
- EVERY component MUST work on Android, iOS, AND Web
- Use ResponsiveLayout wrapper for ALL pages  
- Implement platform detection with PlatformDetector class
- Apply adaptive styling according to frontend specifications

## FLUTTER ARCHITECTURE REQUIREMENTS
- Follow Clean Architecture + Riverpod exactly as specified
- Use @riverpod annotations for ALL providers
- Implement freezed classes for ALL data models
- Apply adaptive UI patterns from shared/widgets/adaptive/


## TESTING REQUIREMENTS
- Test on Android, iOS, AND Web after each component
- Run `flutter test` and `flutter analyze` continuously
- Achieve >80% test coverage before next phase

## ABSOLUTE PROHIBITIONS
- Never skip multi-platform validation
- Never use platform-specific code without adaptive wrappers
- Never proceed without testing responsive behavior
- Never ignore the sequential development plan