import 'package:firebase/news_turkish/custom/loginButton.dart';
import 'package:firebase/news_turkish/custom/snackBar.dart';
import 'package:firebase/news_turkish/custom/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _mevcutParola = TextEditingController();
    TextEditingController _yeniParola = TextEditingController();
    TextEditingController _yeniParolaKontrol = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> _updateUserPassword() async {
      User? user = _auth.currentUser;

      if(user != null) {
        try {
          String email = user.email!;
          String oldPassword = _mevcutParola.text;

          AuthCredential credential = EmailAuthProvider.credential(email: email, password: oldPassword);
          await user.reauthenticateWithCredential(credential);
          String newPassword = _yeniParola.text;
          await user.updatePassword(newPassword);
          Navigator.pushReplacementNamed(context, '/login');
          CustomSnackBar.show(context, PasswordresetPageStrings.successMessage);
        } catch (e) {
          CustomSnackBar.show(context, PasswordresetPageStrings.errorMessage);
        }
      }
    }



    return Scaffold(
      appBar: AppBar(title: Text(PasswordresetPageStrings.parolaAyarlari, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 20,

      ),),),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 20),
        child: Column(
          children: [
            CustomTextField(title: PasswordresetPageStrings.mevcutParola, icon: Icon(CupertinoIcons.lock_fill), radius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), controller: _mevcutParola),
            CustomTextField(title:  PasswordresetPageStrings.yeniParola, icon: Icon(CupertinoIcons.lock_fill), controller: _yeniParola),
            CustomTextField(title: PasswordresetPageStrings.parola, icon: Icon(CupertinoIcons.lock_fill), controller: _yeniParolaKontrol, radius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),),
            Spacer(),
            LoginButton(title: PasswordresetPageStrings.kaydet, func: _updateUserPassword,),
          ],
        ),
      ),
    );
  }
}

class PasswordresetPageStrings {
  static String kaydet = 'Kaydet';
  static String parola = 'Parola';
  static String yeniParola = 'Yeni Parola';
  static String mevcutParola = 'Mevcut Parola';
  static String parolaAyarlari = 'Parola Ayarları';
  static String successMessage = 'Şifre Yenileme işlemi başarılı';
  static String errorMessage = 'Şifre Yenilenemedi. Lütfen tekrar deneyin';
}