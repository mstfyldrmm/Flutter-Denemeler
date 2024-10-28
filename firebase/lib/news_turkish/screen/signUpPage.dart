import 'package:firebase/news_turkish/custom/loginButton.dart';
import 'package:firebase/news_turkish/custom/snackBar.dart';
import 'package:firebase/news_turkish/custom/textField.dart';
import 'package:firebase/news_turkish/service/auth/auth_service.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    String failMessage = '';

    Future<void> registeredButtonTapped() async {
      try {
        final AuthService authService = AuthService();
        final User? user = await authService.signUp(
            _emailController.text, _passwordController.text);
        if (user != null) {
          // Navigator.pushNamed(context, 'home-view'); kayit ekranina geri donme olur ve bu istenmez. Cunku bir kullanici sisteme kayit olduktan sonra uniq oldugundan
          Navigator.pushReplacementNamed(context, '/');
        }
      }  catch (e) {
        setState(() {
          failMessage = e.toString();
          CustomSnackBar.show(context, failMessage);
        });
      }
    }

    return Scaffold(
      backgroundColor: ProjectColor.backgroundColorTwo,
      appBar: AppBar(
        title: Text(
          SignUpPageStrings.kayitOl,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Spacer(),
            CustomTextField(
              title: SignUpPageStrings.email,
              icon: Icon(Icons.mail_outline_rounded),
              controller: _emailController,
              radius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            CustomTextField(
              sifreGizle: true,
              controller: _passwordController,
              title: SignUpPageStrings.parola,
              icon: Icon(Icons.lock_rounded),
              radius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            LoginButton(
              title: SignUpPageStrings.kayitOl,
              func: () {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  CustomSnackBar.show(context, SignUpPageStrings.errorMessage);
                } else {
                  registeredButtonTapped();
                   CustomSnackBar.show(context, SignUpPageStrings.successMessage);
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(SignUpPageStrings.girisYap,
                    style: Theme.of(context).textTheme.bodyLarge))
          ],
        ),
      ),
    );
  }
}

class SignUpPageStrings {
  static String girisYap = 'Giriş Yap';
  static String errorMessage = 'Email ve şifre boş olamaz';
  static String parola = 'Parola';
  static String email = 'Mail Adresi';
  static String kayitOl = 'Kayıt Ol';
  static String successMessage = 'Kayıt İşlemi Başarılı';
}