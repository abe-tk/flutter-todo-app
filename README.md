# flutter-todo-app

Flutter x Firebase 製のTodoアプリ

#### 使用技術

<img src="https://img.shields.io/badge/-Dart-006994.svg">
<img src="https://img.shields.io/badge/-Flutter-53c5f8.svg">
<img src="https://img.shields.io/badge/-Firebase-FFCB05.svg"> 


## デモ・機能

#### タスク一覧画面

* タスク一覧の取得と表示
* 並べ替え
  * 指定した順序
  * 期限日
* タスクの完了

https://github.com/user-attachments/assets/5f1721be-af57-4add-852d-ed866fe57b1e


#### タスク追加モーダル

* タスクの追加
  * タイトル
  * 詳細
  * 期限日

https://github.com/user-attachments/assets/ccc4116e-950a-4302-9c72-bfb8c825908b


#### タスクの詳細画面

* タスクの更新
* タスクの削除
* タスクの完了

https://github.com/user-attachments/assets/cbc33a5e-4d08-4b7d-a164-3471d18663c2


## 環境構築

本プロジェクトでは、FlutterSDKのバージョン管理に[FVM](https://fvm.app/)を使用しています。  
リポジトリをクローン後、下記コマンドを実行してください。

```
% fvm use
```


## ビルド方法

```
% fvm flutter run
```


## システム構成図

![Image](https://github.com/user-attachments/assets/7c6203eb-9d9d-4e55-a18d-7854dcd8e3be)


## ER図

```
users (コレクション)
├── {userId} (ドキュメント)
    └── todos (サブコレクション)
        ├── {todoId} (ドキュメント)
            ├── title: string
            ├── description: string
            ├── dueDate: Timestamp
            ├── isCompleted: boolean
            ├── sortOrder: number
            ├── createdAt: Timestamp
            └── updatedAt: Timestamp

```

## デザイン

[MaterialDesign3](https://m3.material.io/)に準拠しています。

## ディレクトリ構成

レイヤードアーキテクチャを採用し、feature毎に各層を作成しています。  
また、presentationのみlib直下に切り出すことで「一つのページが複数機能を持っており、どのfeatureディレクトリに振り分けたら良いか迷うという」ことの解消を目指しています。

参考：[Flutter設計パターン入門 - Chapter 07 レイヤードアーキテクチャで作る - Feature-first について](https://zenn.dev/flutteruniv/books/flutter-architecture/viewer/5_layered-architecture#feature-first-%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)

```
lib
├── config
├── enum
├── feature
│   └── todo
│       ├── application
│       │   ├── state
│       │   └── usecase
│       ├── domain
│       │   └── entity
│       └── infra
├── l10n
├── presentation
│   ├── common_widget
│   ├── mixin
│   └── page
│       └── todo
│           ├── notifier
│           │   └── model
│           └── widget
├── routing
├── util
├── app.dart
└── main.dart
```
