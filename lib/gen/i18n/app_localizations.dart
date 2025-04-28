import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @todoListPageAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Todo App'**
  String get todoListPageAppBarTitle;

  /// No description provided for @sortBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sortBottomSheetTitle;

  /// No description provided for @sortBottomSheetItemSpecifiedOrder.
  ///
  /// In en, this message translates to:
  /// **'Specified order'**
  String get sortBottomSheetItemSpecifiedOrder;

  /// No description provided for @sortBottomSheetItemDueDate.
  ///
  /// In en, this message translates to:
  /// **'Due date'**
  String get sortBottomSheetItemDueDate;

  /// No description provided for @sortOrderRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'To reorder tasks, they must be changed to the “specified order”.'**
  String get sortOrderRequiredMessage;

  /// No description provided for @todoNotRegistered.
  ///
  /// In en, this message translates to:
  /// **'No todo has been registered.'**
  String get todoNotRegistered;

  /// No description provided for @todoTitleFormHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter title'**
  String get todoTitleFormHintText;

  /// No description provided for @validatorTodoTitle.
  ///
  /// In en, this message translates to:
  /// **'{validateResult,select, valid{}empty{Please enter.}other{}}'**
  String validatorTodoTitle(String validateResult);

  /// No description provided for @todoDescriptionFormHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter Detail'**
  String get todoDescriptionFormHintText;

  /// No description provided for @todoDueDateFormIsEmptyText.
  ///
  /// In en, this message translates to:
  /// **'Enter due date'**
  String get todoDueDateFormIsEmptyText;

  /// No description provided for @saveBtnText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveBtnText;

  /// No description provided for @completeBtnText.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get completeBtnText;

  /// No description provided for @incompleteBtnText.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get incompleteBtnText;

  /// No description provided for @todoCreateMessage.
  ///
  /// In en, this message translates to:
  /// **'Todo added.'**
  String get todoCreateMessage;

  /// No description provided for @todoUpdateMessage.
  ///
  /// In en, this message translates to:
  /// **'Todo updated.'**
  String get todoUpdateMessage;

  /// No description provided for @todoCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Todo marked as complete.'**
  String get todoCompleteMessage;

  /// No description provided for @todoIncompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Task marked as uncompleted.'**
  String get todoIncompleteMessage;

  /// No description provided for @todoDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Deleted task.'**
  String get todoDeleteMessage;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @invalidCredential.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials. Please try again.'**
  String get invalidCredential;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Email address format is incorrect.'**
  String get invalidEmail;

  /// No description provided for @userDisabled.
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled. Please contact the administrator.'**
  String get userDisabled;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This e-mail address is already in use. Please try another email address.'**
  String get emailAlreadyInUse;

  /// No description provided for @operationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'This operation is currently not allowed. Please contact your administrator.'**
  String get operationNotAllowed;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too short, please make it at least 6 characters.'**
  String get weakPassword;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error has occurred.'**
  String get unexpectedError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
