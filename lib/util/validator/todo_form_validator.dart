import '../../gen/i18n/app_localizations.dart';
import 'form_validator.dart';

class TodoFormValidator {
  TodoFormValidator(this.l10n);
  AppLocalizations l10n;
  final formValidator = FormValidator();

  String? title(String? title) {
    final result = _validateTitle(title);

    return result != ValidateResult.valid
        ? l10n.validatorTodoTitle(result.name)
        : null;
  }

  ValidateResult _validateTitle(String? title) {
    if (formValidator.isEmpty(title)) {
      return ValidateResult.empty;
    } else {
      return ValidateResult.valid;
    }
  }
}
