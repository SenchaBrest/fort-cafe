import 'package:collection/collection.dart';

enum Status {
  pending,
  inProgress,
  completed,
  canceled,
  givenAway,
  delete,
}

enum Role {
  user,
  worker,
  admin,
  ban_user,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (Role):
      return Role.values.deserialize(value) as T?;
    default:
      return null;
  }
}
