import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static FlutterSecureStorage? storage;

  static Future<StorageUtil?> getInstance() async {
    if (_storageUtil == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = StorageUtil._();
      secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();

  _init() {
    storage = new FlutterSecureStorage();
  }

  // get string
  static Future<String> getString(
      {required String key, String defValue = ''}) async {
    if (storage == null) return defValue;
    return await storage?.read(key: key) ?? defValue;
  }

  // put string
  static Future putString({required String key, required String value}) async {
    if (storage == null) return null;
    await storage?.write(key: key, value: value);
  }

  static logout() {
    storage?.deleteAll();
  }
}
