import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:brasileirao/utils/snackbar_util.dart';

class AuthService extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();
  final RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      if (user != null) {
        isAuthenticated.value = true;
      } else {
        isAuthenticated.value = false;
      }
    });
  }

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  Future<void> createUser(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      SnackBarUtil().showSnackBar(
        'Erro ao se cadastrar',
        e.message.toString(),
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      SnackBarUtil().showSnackBar(
        'Erro ao logar',
        e.message.toString(),
      );
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      SnackBarUtil().showSnackBar(
        'Erro ao sair',
        e.message.toString(),
      );
    }
  }
}
