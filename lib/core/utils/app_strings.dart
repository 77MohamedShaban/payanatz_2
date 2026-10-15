import 'package:easy_localization/easy_localization.dart';

abstract final class AppStrings {
  static String get hello => "hello".tr();
  static String get hr => "hr".tr();
  static String get departments => "departments".tr();
  static String get searchHint => "search_hint".tr();
  static String get filter => "filter".tr();
  static String get createDepartment => "create_department".tr();
  static String get manager => "manager".tr();
  static String get employeesCount => "employees_count".tr();
  static String get departmentName => "department_name".tr();
  static String get departmentNameArabic => "department_name_arabic".tr();
  static String get textHereHint => "text_here_hint".tr();
  static String get fieldRequired => "field_required".tr();
  static String get code => "code".tr();
  static String get codeValidationHint => "code_validation_hint".tr();
  static String get selectManagerHint => "select_manager_hint".tr();
  static String get color => "color".tr();
  static String get description => "description".tr();
  static String get descriptionHint => "description_hint".tr();
  static String get discard => "discard".tr();
  static String get submit => "submit".tr();
  static String get creatingDepartmentTitle => "creating_department_title".tr();
  static String get creatingDepartmentConfirmation => "creating_department_confirmation".tr();
  static String get no => "no".tr();
  static String get yes => "yes".tr();
  static String get successful => "successful".tr();
  static String get createSuccessMessage => "create_success_message".tr();
  static String get noDepartmentsYet => "no_departments_yet".tr();
  static String get noDepartmentsSubtitle => "no_departments_subtitle".tr();
  
  // Validation Strings
  static String get invalidEmail => "invalid_email".tr();
  static String get passwordTooShort => "password_too_short".tr();
  static String get invalidPhone => "invalid_phone".tr();
  static String get passwordsDoNotMatch => "passwords_do_not_match".tr();
  
  // New Strings
  static String get defaultManagerName => "moataz_hamed".tr();
  static String get noMatchingDepartments => "no_matching_departments".tr();
  static String get ok => "ok".tr();
}
