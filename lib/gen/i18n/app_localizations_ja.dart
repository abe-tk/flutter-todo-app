// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get todoListPageAppBarTitle => 'Flutter Todo App';

  @override
  String get sortBottomSheetTitle => '並べ替え';

  @override
  String get sortBottomSheetItemSpecifiedOrder => '指定した順序';

  @override
  String get sortBottomSheetItemDueDate => '期限日';

  @override
  String get sortOrderRequiredMessage => 'タスクを並び替えるには、「指定した順序」に変更する必要があります。';

  @override
  String get todoNotRegistered => 'タスクが登録されていません。';

  @override
  String get todoTitleFormHintText => 'タイトルを入力';

  @override
  String validatorTodoTitle(String validateResult) {
    String _temp0 = intl.Intl.selectLogic(
      validateResult,
      {
        'valid': '',
        'empty': '入力してください。',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get todoDescriptionFormHintText => '詳細を入力';

  @override
  String get todoDueDateFormIsEmptyText => '日付を入力';

  @override
  String get saveBtnText => '保存する';

  @override
  String get completeBtnText => '完了とする';

  @override
  String get incompleteBtnText => '未完了とする';

  @override
  String get todoCreateMessage => 'タスクを追加しました。';

  @override
  String get todoUpdateMessage => 'タスクを更新しました。';

  @override
  String get todoCompleteMessage => 'タスクを完了としました。';

  @override
  String get todoIncompleteMessage => 'タスクを未完了としました。';

  @override
  String get todoDeleteMessage => 'タスクを削除しました。';

  @override
  String get signIn => 'サインイン';

  @override
  String get signUp => 'サインアップ';

  @override
  String get signOut => 'サインアウト';

  @override
  String get invalidCredential => '認証情報が無効です。もう一度お試しください。';

  @override
  String get invalidEmail => 'メールアドレスの形式が正しくありません。';

  @override
  String get userDisabled => 'このアカウントは無効化されています。管理者にお問い合わせください。';

  @override
  String get emailAlreadyInUse => 'このメールアドレスはすでに使用されています。別のメールアドレスをお試しください。';

  @override
  String get operationNotAllowed => 'この操作は現在許可されていません。管理者にお問い合わせください。';

  @override
  String get weakPassword => 'パスワードが短すぎます。6文字以上にしてください。';

  @override
  String get unexpectedError => '予期せぬエラーが発生しました。';
}
