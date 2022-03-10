import 'package:brasileirao/pages/auth_page.dart';
import 'package:brasileirao/pages/home_page.dart';
import 'package:brasileirao/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckAuthPage extends StatelessWidget {
  const CheckAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AuthService.to.isAuthenticated.value ? const HomePage() : AuthPage());
  }
}
