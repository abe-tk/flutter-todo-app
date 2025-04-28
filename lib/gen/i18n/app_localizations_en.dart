// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get todoListPageAppBarTitle => 'Flutter Todo App';

  @override
  String get sortBottomSheetTitle => 'Sort';

  @override
  String get sortBottomSheetItemSpecifiedOrder => 'Specified order';

  @override
  String get sortBottomSheetItemDueDate => 'Due date';

  @override
  String get sortOrderRequiredMessage => 'To reorder tasks, they must be changed to the “specified order”.';

  @override
  String get todoNotRegistered => 'No todo has been registered.';

  @override
  String get todoTitleFormHintText => 'Enter title';

  @override
  String validatorTodoTitle(String validateResult) {
    String _temp0 = intl.Intl.selectLogic(
      validateResult,
      {
        'valid': '',
        'empty': 'Please enter.',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get todoDescriptionFormHintText => 'Enter Detail';

  @override
  String get todoDueDateFormIsEmptyText => 'Enter due date';

  @override
  String get saveBtnText => 'Save';

  @override
  String get completeBtnText => 'Complete';

  @override
  String get incompleteBtnText => 'Incomplete';

  @override
  String get todoCreateMessage => 'Todo added.';

  @override
  String get todoUpdateMessage => 'Todo updated.';

  @override
  String get todoCompleteMessage => 'Todo marked as complete.';

  @override
  String get todoIncompleteMessage => 'Task marked as uncompleted.';

  @override
  String get todoDeleteMessage => 'Deleted task.';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signOut => 'Sign Out';

  @override
  String get invalidCredential => 'Invalid credentials. Please try again.';

  @override
  String get invalidEmail => 'Email address format is incorrect.';

  @override
  String get userDisabled => 'This account has been disabled. Please contact the administrator.';

  @override
  String get emailAlreadyInUse => 'This e-mail address is already in use. Please try another email address.';

  @override
  String get operationNotAllowed => 'This operation is currently not allowed. Please contact your administrator.';

  @override
  String get weakPassword => 'Password is too short, please make it at least 6 characters.';

  @override
  String get unexpectedError => 'An unexpected error has occurred.';
}
