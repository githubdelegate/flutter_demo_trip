import 'package:shared_preferences/shared_preferences.dart';

/// 缓存管理
class BiCache {
  // 单例
  static BiCache? _instance;
  BiCache._() {
    init();
  }

  static BiCache get instance => _instance ??= BiCache._();

  BiCache._pre(SharedPreferences pre) {
    _pre = pre;
  }

  SharedPreferences? _pre;

  static Future<BiCache> preInit() async {
    if (_instance == null) {
      var pre = await SharedPreferences.getInstance();
      _instance = BiCache._pre(pre);
    }
    return _instance ??= BiCache._();
  }

  void init() async {
    _pre ??= await SharedPreferences.getInstance();
  }
}
