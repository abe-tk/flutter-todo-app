class FormValidator {
  FormValidator();

  bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
}

enum ValidateResult { valid, empty, other }
