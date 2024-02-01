import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String signature;

  TaskModel(this.signature);
}
