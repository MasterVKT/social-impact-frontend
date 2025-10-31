# Initial Prompt - Social Finance Impact Platform Frontend Development

You are developing a complete Flutter multi-platform frontend for the Social Finance Impact Platform MVP. This application must run natively on **Android, iOS, AND Web** with responsive design and platform-adaptive features.

## CRITICAL FIRST STEPS:

1. **Read "/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_ai_guide_mobile.md"** - This explains HOW to use all frontend documentation and contains MANDATORY multi-platform development rules
2. **Read "/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_development_plan_mobile.md"** - This contains the EXACT 6-phase development sequence you must follow  
3. **Read "/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/claude-rules.md"** - Frontend development rules you must follow absolutely
4. **Read "/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_architecture_mobile.md"** - Complete technical architecture and folder structure

## DOCUMENTATION STRUCTURE:

The frontend specifications are contained in 7 core documents:
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_ai_guide_mobile.md"** - Agent IA instructions and critical rules ⭐ READ FIRST
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_development_plan_mobile.md"** - 6-phase development plan with timeline
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_architecture_mobile.md"** - Clean Architecture + Riverpod structure  
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_firebase_mobile.md"** - Firebase integrations for all platforms
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_pages_mobile.md"** - Adaptive page implementations
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/frontend_uiux_mobile.md"** - Design system and responsive components
- **"/mnt/d/Projets/Social Impact/social_impact_mvp/docs/frontend-specs/description_mvp_mobile.md"** - MVP overview and features

## DEVELOPMENT PHASES (Execute in this EXACT order):

### Phase 1: Setup & Architecture Multi-Platform (Week 1-2)
**OBJECTIVE:** Flutter project working on Android, iOS, AND Web
**CRITICAL:** Follow setup instructions in frontend_ai_guide_mobile.md section 1

### Phase 2: Core Components Responsive (Week 2-3)  
**OBJECTIVE:** All adaptive components operational (mobile/tablet/desktop)

### Phase 3: Authentication Cross-Platform (Week 4)
**OBJECTIVE:** Login/register/KYC adaptive across all platforms

### Phase 4: Main Features Universal (Week 5-7)
**OBJECTIVE:** Dashboard, projects, contributions on all platforms

### Phase 5: Platform-Specific Features (Week 8-9)
**OBJECTIVE:** Mobile optimizations and web-specific features

### Phase 6: Polish & Deploy Multi-Platform (Week 10-12)
**OBJECTIVE:** Apps deployed to stores and web hosting

## MANDATORY TECHNICAL REQUIREMENTS:

- **Framework:** Flutter 3.19+ with multi-platform support
- **Platforms:** Android, iOS, Web (all three simultaneously)
- **Architecture:** Clean Architecture + Riverpod (exactly as specified)
- **Responsive:** Mobile-first with tablet/desktop adaptations
- **Firebase:** Multi-platform configuration with adaptive features
- **Testing:** Unit, widget, and integration tests for all platforms



## VALIDATION CHECKPOINTS:

After each major component:
1. Test on Android device/emulator
2. Test on iOS device/simulator  
3. Test on web browser
4. Verify responsive behavior on all screen sizes
5. Run `flutter test` and `flutter analyze`

## CRITICAL SUCCESS FACTORS:

- **NEVER** develop for one platform only
- **ALWAYS** implement responsive design patterns
- **ALWAYS** use adaptive components from the design system
- **ALWAYS** test on all three target platforms
- **ALWAYS** follow the sequential phase development

Remember: This is a multi-platform application. Every single component must work seamlessly on mobile AND web with platform-appropriate interactions and responsive design.

Start with Phase 1 setup and wait for validation before proceeding to the next component.