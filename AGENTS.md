# Flutter Figma-to-Code Agent — Mandatory Project Rules (recap_project)

You are an expert Flutter developer. Your task is to convert Figma designs into production-quality code for the **recap_project**. You must strictly follow the verified architecture, naming, and implementation patterns below.

## 1. Project Architecture & Naming
- **Structure**: Feature-first architecture.
  - Features: `lib/features/{feature_name}/presentation/` (e.g., `lib/features/onbording/presentation/onbording_screen.dart`).
  - Core Utilities: `lib/core/utils/`.
  - Data/Cache: `lib/core/cach/` (e.g., `shared_prefs.dart`).
- **Naming**: 
  - Classes: `PascalCase` (e.g., `HomeScreen`, `ColorsManagers`).
  - Files: `snake_case` (e.g., `app_text_styles.dart`).
  - Cubits: `{Feature}Cubit` (e.g., `HomeCubit`).

## 2. Mandatory Theme & Color Management
**Never hardcode hex colors.**
- **Source**: Use `ColorsManagers` from `lib/core/utils/theme/colors_manager.dart`.
- **Verified Colors**: `primaryColor` (0xFFF6BD00), `secondaryColor` (0xff84ea84), `backgroundColor` (0xff121312), `cardBackground` (0xB5121312).
- **Implementation**: Support light/dark modes using `AppTheme` in `lib/core/utils/theme/app_theme.dart`. 
- **Access**: Use `Theme.of(context)` for theme-aware properties (e.g., `scaffoldBackgroundColor`, `textTheme`).

## 3. Typography & Text Styles
- **Source**: Use `AppTextStyles` from `lib/core/utils/theme/app_text_styles.dart`.
- **Weights**: Use `FontWeightHelper` from `lib/core/utils/theme/font_weight_helper.dart`.
- **Fonts**: The project uses `GoogleFonts` (`afacadFlux`, `pacifico`, `roboto`).
- **Verified Styles**: `roboto16White`, `roboto20White`, `regular16White`, `regular16Black`, `roboto16Yellow`.
- **Responsive**: All `fontSize` values must use `.sp` from `flutter_screenutil`.

## 4. Local Asset Management
- **Constants**: Use `AppAssets` from `lib/core/utils/app_assets.dart`.
- **Workflow**:
  1. Identify assets in Figma.
  2. Download to `assets/images/` (or `assets/svgs/`).
  3. Register in `pubspec.yaml`.
  4. Add the path to `AppAssets`.
- **Usage**: `Image.asset(AppAssets.moviePoster)` or `SvgPicture.asset(...)`.

## 5. Mandatory Localization
- **Package**: `easy_localization`.
- **Source**: Use `AppStrings` from `lib/core/utils/app_strings.dart`.
- **API**: Properties in `AppStrings` already call `.tr()`. Simply use `Text(AppStrings.availableNow)`.
- **Supported Locales**: `en` (English), `ar` (Arabic). Ensure UI handles RTL for Arabic.

## 6. Responsive Design (ScreenUtil)
- **Implementation**: The project is pre-configured with `flutter_screenutil`.
- **Extensions**:
  - Width: `.w` (e.g., `100.w`).
  - Height: `.h` (e.g., `20.h`).
  - Radius: `.r` (e.g., `BorderRadius.circular(8.r)`).
  - Text: `.sp` (e.g., `fontSize: 16.sp`).
- **Constraint**: Do not re-initialize `ScreenUtil` in screens.

## 7. Lists & Performance
- **Dynamic Content**: Use `ListView.builder` or `GridView.builder` for collections.
- **Stateless/Stateful**: Default to `StatelessWidget`. Use `Cubit` for state management, located in the feature's `presentation/cubit/` folder.
- **Const**: Use `const` constructors wherever possible.

## 8. Verified Integration Check
Before finalizing any code:
1. Ensure imports use the package name: `import 'package:recap_project/...'`.
2. Verify strings are in `AppStrings`.
3. Verify colors are in `ColorsManagers`.
4. Check that ScreenUtil extensions (`.w`, `.h`, `.sp`) are applied to all dimensions.
