import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPref? _prefHelper;
  static String isLoggedInKey = 'IsLoggedIn';
  static String userIdKey = 'userId';
  static String emailKey = 'email';
  static String userMobileNo = 'userMobileNo';
  static String shopId = "shopId";

  static String isDeliveryPartner = 'isDeliveryPartner';
  static String isDeliveryLogout = 'isDeliveryLogout';

  static String authTokenKey = 'authToken';
  static String deviceId = 'deviceId';

  static String latitudeKey = 'latitude';
  static String longitudeKey = 'longitude';
  static String userNameKey = 'userName';
  static String profileImageKey = 'profileImage';
  static String phoneNumberKey = 'phoneNumber';
  static String isStopOnboardingKey = 'isShopOnboarding';
  static String vendorColorTheme = 'vendorColorTheme';

  static getInstance() {
    _prefHelper ??= SharedPref();
    return _prefHelper;
  }

  static SharedPreferences? _prefs;
  static final Map<String, dynamic> _memoryPrefs = <String, dynamic>{};

  static Future<SharedPreferences?> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> clearPref() async {
    bool clear = await _prefs!.clear();
    if (clear) {
      _memoryPrefs.clear();
    }
    return clear;
  }

  static Future<bool> clearKeyPref(String key) async {
    bool clear = await _prefs!.remove(key);
    if (clear) {
      _memoryPrefs.remove(key);
    }
    return clear;
  }

  static void setString(String key, String value) {
    _prefs!.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setListString(String key, List<String> value) {
    _prefs!.setStringList(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs!.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs!.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs!.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String getString(String key, {dynamic def}) {
    String? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs?.getString(key);
    val ??= def;
    val ??= '';
    _memoryPrefs[key] = val;
    return val;
  }

  static List<String> getListString(String key, {List<String>? def}) {
    List<String>? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs!.getStringList(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val!;
  }

  static bool exists(String key, {String? def}) {
    return _prefs!.containsKey(key);
  }

  static int getInt(String key, {int? def}) {
    int? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs!.getInt(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val!;
  }

  static double getDouble(String key, {double? def}) {
    double? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs!.getDouble(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val!;
  }

  static bool getBool(String key, {bool? def = false}) {
    bool? val = def;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (_prefs == null) {
      return val!;
    }
    val = _prefs!.getBool(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val!;
  }
}
