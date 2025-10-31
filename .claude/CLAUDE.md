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


You are an expert in mobile and frontend development with Flutter.

Before each of your answers or actions, make sure it follows the development plan order and complies with the project specifications contained in the '../docs/frontend-specs' folder.

Before each of your answers or actions, check whether you have all the information you need to provide the expected and effective response or action. If not, ask me the necessary questions.

After giving an answer or performing an action, provide a summary of what has already been done and what still needs to be done.

I think it would be better for you to run your commands in the Command Prompt instead of PowerShell (unless you believe PowerShell is better; you can decide for yourself).

This application is intended to be internationalized, so keep that in mind in the code if necessary.

For each of your answers, ensure that it does not negatively impact (or cause regressions in) other already working features.

You must only implement solutions that will work under real conditions with real data (as if we were in the production environment, but of course using the development environment addresses for now), and not temporary solutions or static test data.

Each time you need to fix an error, make sure to take into account the project specifications, the implementation context of the code relative to the overall project (because fixing an error in isolation without considering the whole project and its specifications may lead to an irrelevant fix). Also, ensure that your fixes do not create other problems or regressions in other features.

If solving an error or modifying a feature requires adjustments or actions on the frontend side, let me know by telling me very precisely and in detail what needs to be done on the frontend so that everything works properly, while considering the application specifications and the implementation context of the code or feature in question.

If you need any piece of information from me to carry out a task (or tasks) correctly and effectively, ask me for it.