import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  HiveService._internal();

  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  /// Initialize Hive once
  Future<void> init() async {
    await Hive.initFlutter();
  }

  /// Register adapter once (only if not already registered)
  void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  /// Open box with generic type
  Future<Box<T>> openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  /// Get already opened box
  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  /// Close a box
  Future<void> closeBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box<T>(boxName).close();
    }
  }

  /// Delete a box
  Future<void> deleteBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box<T>(boxName).deleteFromDisk();
    }
  }

  /// Add a single item
  Future<void> saveOne<T>(T item, String boxName) async {
    final box = Hive.box<T>(boxName);
    await box.add(item);
  }

  /// Add multiple items
  Future<void> saveAll<T>(List<T> items, String boxName) async {
    final box = Hive.box<T>(boxName);
    await box.addAll(items);
  }

  /// Get all items
  List<T> getAll<T>(String boxName) {
    final box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  /// Delete item by index
  Future<void> deleteAt<T>(String boxName, int index) async {
    final box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  /// Update item at index
  Future<void> updateAt<T>(String boxName, int index, T newValue) async {
    final box = Hive.box<T>(boxName);
    await box.putAt(index, newValue);
  }

  /// Clear box
  Future<void> clearBox<T>(String boxName) async {
    final box = Hive.box<T>(boxName);
    await box.clear();
  }
}
