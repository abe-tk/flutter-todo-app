/// アプリ内で使用する例外型のインターフェース
class AppException implements Exception {
  const AppException({this.code, this.message});

  /// ステータスコードや独自のエラーコードなどのエラー種別を識別するための文字列
  final String? code;

  /// 例外の内容を説明するメッセージ
  final String? message;

  @override
  String toString() {
    if (code == null) {
      return message ?? '';
    }
    return '[$code] ${message ?? ''}';
  }
}
