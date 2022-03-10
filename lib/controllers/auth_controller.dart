import 'package:brasileirao/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxString title = 'Bem vindo!'.obs;
  final RxString primaryButton = 'Entrar'.obs;
  final RxString appBarButton = 'Cadastre-se'.obs;
  final RxBool isLogin = true.obs;
  final RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    ever(isLogin, (bool visible) {
      title.value = visible ? 'Bem vindo' : 'Crie sua conta';
      primaryButton.value = visible ? 'Entrar' : 'Registre-se';
      appBarButton.value = visible ? 'Cadastre-se' : 'Login';
      formKey.currentState!.reset();
    });
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(email.text, password.text);
    isLoading.value = false;
  }

  signUp() async {
    isLoading.value = true;
    await AuthService.to.createUser(email.text, password.text);
    isLoading.value = false;
  }

  toogleRegistrar() {
    isLogin.value = !isLogin.value;
  }
}
