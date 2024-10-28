import 'package:firebase/news_turkish/custom/loginButton.dart';
import 'package:firebase/news_turkish/custom/snackBar.dart';
import 'package:firebase/news_turkish/custom/textField.dart';
import 'package:firebase/news_turkish/service/auth/auth_service.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:firebase/news_turkish/view_model/result_list_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final AuthService authService = AuthService();
    String failMessage = '';
    bool isSecure = true;

    Future<void> registeredButtonTappedSignIn() async {
      try {
        final User? user = await authService.signIn(
            _emailController.text, _passwordController.text);
        if (user != null) {
          // Navigator.pushNamed(context, 'home-view'); kayit ekranina geri donme olur ve bu istenmez. Cunku bir kullanici sisteme kayit olduktan sonra uniq oldugundan
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          Navigator.pushReplacementNamed(context, 'home-view');
        }
      } catch (e) {
        setState(() {
          failMessage = e.toString();
          CustomSnackBar.show(context, failMessage);
        });
      }
    }

    Future<void> signInGoogle() async {
      final User? user = await authService.signWithGoogle();

      if (user != null) {
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        Navigator.pushReplacementNamed(context, 'home-view');
      }
    }

    return Scaffold(
      backgroundColor: ProjectColor.backgroundColorTwo,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Spacer(),
            Text(
              LoginScreenString.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 30),
            ),
            Spacer(),
            CustomTextField(
              title: LoginScreenString.mailAdres,
              icon: Icon(Icons.mail_outline_rounded),
              controller: _emailController,
              radius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            CustomTextField(
              sifreGizle: isSecure,
              controller: _passwordController,
              title: LoginScreenString.parola,
              icon: Icon(Icons.lock_rounded),
              radius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            LoginButton(
              title: LoginScreenString.girisYap,
              func: () {
                emptyControl(_emailController, _passwordController, failMessage)
                    ? registeredButtonTappedSignIn()
                    : CustomSnackBar.show(context, LoginScreenString.noEmpty);
              },
            ),
            IconButton(
              onPressed: () {
                signInGoogle();
              },
              icon: FaIcon(FontAwesomeIcons.google),
              iconSize: 30,
              color: Colors.white,
              padding: EdgeInsets.only(top: 10),
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'kayit');
                },
                child: Text(
                  LoginScreenString.simdiKayitOl,
                  style: Theme.of(context).textTheme.bodyLarge,
                ))
          ],
        ),
      ),
    );
  }

  bool emptyControl(TextEditingController _emailController,
      TextEditingController _passwordController, String failMessage) {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

class LoginScreenString {
  static String simdiKayitOl = 'Şimdi Kayıt Ol';
  static String noEmpty = 'Email ve şifre boş olamaz';
  static String parola = 'Parola';
  static String mailAdres = 'Mail Adresi';
  static String title = 'Gündemdeyiz';
  static String girisYap = 'Giriş Yap';
}
