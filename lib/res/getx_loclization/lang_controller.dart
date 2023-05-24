import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  final _storage = GetStorage();
  final String localeKey = 'en_US';

  Locale? currentLocale;

  @override
  void onInit() {
    super.onInit();
    currentLocale = getSavedLocale();
  }

  void updateLocale(Locale locale) {
    currentLocale = locale;
    saveLocale(locale);
    Get.updateLocale(locale);
  }

  void saveLocale(Locale locale) {
    _storage.write(localeKey, locale.toString());
  }

  Locale? getSavedLocale() {
    final localeString = _storage.read(localeKey);
    if (localeString != null) {
      final localeList = localeString.split('_');
      if (localeList.length == 2) {
        return Locale(localeList[0], localeList[1]);
      }
    }
    return const Locale('en', 'US');
  }
}
