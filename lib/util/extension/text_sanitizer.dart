extension TextSanitizer on String? {
  /// 必須項目の文字列をtrim（nullの場合は空文字で返す）
  String sanitizeRequired() {
    return this?.trim() ?? '';
  }

  /// 任意項目の文字列をtrim（空文字や空白だけならnullを返す）
  String? sanitizeOptional() {
    final trimmed = this?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }
}
