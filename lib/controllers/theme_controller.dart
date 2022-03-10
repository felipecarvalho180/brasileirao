import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
//SHARED PREFERENCES
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;
  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };

  //SHARED PREFERENCES
  // late SharedPreferences preferences;

  static ThemeController get to => Get.find();

  void loadThemeMode() async {
    //SHARED PREFERENCES
    // preferences = await SharedPreferences.getInstance();
    // String themeText = preferences.getString('theme') ?? 'light';

    Directory dir = await getApplicationDocumentsDirectory();
    Box<dynamic> box = await Hive.openBox('preferences', path: dir.path);
    String themeText = box.get('theme') ?? 'light';
    isDark.value = themeText == 'dark' ? true : false;

    setMode(themeText);
  }

  Future setMode(String themeText) async {
    ThemeMode themeMode = (themeModes[themeText])!;
    Get.changeThemeMode(themeMode);

    //SHARED PREFERENCES
    // preferences = await SharedPreferences.getInstance();
    // await preferences.setString('theme', themeText);

    Box<dynamic> box = await Hive.openBox('preferences');
    await box.put('theme', themeText);
  }

  void changeTheme() {
    setMode(isDark.value ? 'light' : 'dark');
    isDark.value = !isDark.value;
  }
}
