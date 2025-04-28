// /*
// dev_dependencies:
//   flutter_test:
//     sdk: flutter
//   mockito: ^5.0.17
//   cloud_firestore_mocks: ^0.2.0
//   fake_cloud_firestore: ^1.3.0
// */

// import 'package:app/feature/todo/domain/entity/todo_entity.dart';
// import 'package:app/feature/todo/infra/todo_repository.dart';
// import 'package:app/presentation/page/todo/notifier/model/todo_form_model.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('TodoRepository', () {
//     late FakeFirebaseFirestore firestore;
//     late TodoRepository repository;

//     setUp(() {
//       firestore = FakeFirebaseFirestore();
//       repository = TodoRepository(firestore: firestore, userId: 'testUser');
//     });

//     test('createTodo should add a new todo', () async {
//       final form = TodoFormModel(
//         title: 'Test Todo',
//         description: 'Description',
//         dueDate: DateTime(2025),
//       );

//       await repository.createTodo(todoForm: form, sortOrder: 1);

//       final snapshot =
//           await firestore
//               .collection('users')
//               .doc('testUser')
//               .collection('todos')
//               .get();

//       expect(snapshot.docs.length, 1);
//       expect(snapshot.docs.first['title'], 'Test Todo');
//       expect(snapshot.docs.first['sortOrder'], 1);
//     });

//     test('updateIsCompleted should update the isCompleted field', () async {
//       final docRef = await firestore
//           .collection('users')
//           .doc('testUser')
//           .collection('todos')
//           .add({
//             'title': 'Test',
//             'description': '',
//             'isCompleted': false,
//             'dueDate': null,
//             'sortOrder': 0,
//             'createdAt': DateTime.now(),
//             'updatedAt': DateTime.now(),
//           });

//       final todo = TodoEntity.fromJson({
//         'id': docRef.id,
//         'title': 'Test',
//         'description': '',
//         'isCompleted': false,
//         'dueDate': null,
//         'sortOrder': 0,
//         'createdAt': DateTime.now().toIso8601String(),
//         'updatedAt': DateTime.now().toIso8601String(),
//       });

//       await repository.updateIsCompleted(todo: todo, isCompleted: true);

//       final updated = await docRef.get();
//       expect(updated['isCompleted'], true);
//     });

//     test('deleteTodo should remove the document', () async {
//       final docRef = await firestore
//           .collection('users')
//           .doc('testUser')
//           .collection('todos')
//           .add({
//             'title': 'Test',
//             'description': '',
//             'isCompleted': false,
//             'dueDate': null,
//             'sortOrder': 0,
//             'createdAt': DateTime.now(),
//             'updatedAt': DateTime.now(),
//           });

//       final todo = TodoEntity.fromJson({
//         'id': docRef.id,
//         'title': 'Test',
//         'description': '',
//         'isCompleted': false,
//         'dueDate': null,
//         'sortOrder': 0,
//         'createdAt': DateTime.now().toIso8601String(),
//         'updatedAt': DateTime.now().toIso8601String(),
//       });

//       await repository.deleteTodo(todo: todo);

//       final docs =
//           await firestore
//               .collection('users')
//               .doc('testUser')
//               .collection('todos')
//               .get();

//       expect(docs.docs.isEmpty, true);
//     });

//     // 他にも以下のテストを追加するとよいです
//     // - updateTodo のテスト
//     // - updateSortOrder のテスト
//     // - realTimeFetchTodoList のストリーム変化に対するテスト（pumpとlistenを使う）
//   });
// }
