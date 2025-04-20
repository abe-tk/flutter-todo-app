// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoFormNotifierHash() => r'9715d5974231a4bc13719691a2be55a12f495263';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TodoFormNotifier
    extends BuildlessAutoDisposeNotifier<TodoFormModel> {
  late final TodoEntity? todo;

  TodoFormModel build(TodoEntity? todo);
}

/// See also [TodoFormNotifier].
@ProviderFor(TodoFormNotifier)
const todoFormNotifierProvider = TodoFormNotifierFamily();

/// See also [TodoFormNotifier].
class TodoFormNotifierFamily extends Family<TodoFormModel> {
  /// See also [TodoFormNotifier].
  const TodoFormNotifierFamily();

  /// See also [TodoFormNotifier].
  TodoFormNotifierProvider call(TodoEntity? todo) {
    return TodoFormNotifierProvider(todo);
  }

  @override
  TodoFormNotifierProvider getProviderOverride(
    covariant TodoFormNotifierProvider provider,
  ) {
    return call(provider.todo);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoFormNotifierProvider';
}

/// See also [TodoFormNotifier].
class TodoFormNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TodoFormNotifier, TodoFormModel> {
  /// See also [TodoFormNotifier].
  TodoFormNotifierProvider(TodoEntity? todo)
    : this._internal(
        () => TodoFormNotifier()..todo = todo,
        from: todoFormNotifierProvider,
        name: r'todoFormNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$todoFormNotifierHash,
        dependencies: TodoFormNotifierFamily._dependencies,
        allTransitiveDependencies:
            TodoFormNotifierFamily._allTransitiveDependencies,
        todo: todo,
      );

  TodoFormNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todo,
  }) : super.internal();

  final TodoEntity? todo;

  @override
  TodoFormModel runNotifierBuild(covariant TodoFormNotifier notifier) {
    return notifier.build(todo);
  }

  @override
  Override overrideWith(TodoFormNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoFormNotifierProvider._internal(
        () => create()..todo = todo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todo: todo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TodoFormNotifier, TodoFormModel>
  createElement() {
    return _TodoFormNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoFormNotifierProvider && other.todo == todo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TodoFormNotifierRef on AutoDisposeNotifierProviderRef<TodoFormModel> {
  /// The parameter `todo` of this provider.
  TodoEntity? get todo;
}

class _TodoFormNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TodoFormNotifier, TodoFormModel>
    with TodoFormNotifierRef {
  _TodoFormNotifierProviderElement(super.provider);

  @override
  TodoEntity? get todo => (origin as TodoFormNotifierProvider).todo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
