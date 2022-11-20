import 'package:hive/hive.dart';

class HiveAdapter<T> {
  final Box<T> box;

  HiveAdapter({required this.box});

  List<T> get values => box.values.toList();

  List<dynamic> get keys => box.keys.toList();

  Future add(T value) async {
    await box.add(value);
  }

  Future put(dynamic key, T value) async {
    await box.put(key, value);
  }

  Future delete(dynamic key) async {
    await box.delete(key);
  }
}
