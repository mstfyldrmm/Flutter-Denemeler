import 'package:animated_icon/animated_icon.dart';
import 'package:firebase/news_turkish/custom/animatedIcon.dart';
import 'package:firebase/news_turkish/custom/snackBar.dart';
import 'package:firebase/news_turkish/modules/animationCreator.dart';
import 'package:firebase/news_turkish/screen/login_screen.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _userSignOut(BuildContext context) async {
    try {
      await _auth.signOut();
      CustomSnackBar.show(context, AccountPageString.okMessage);
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      CustomSnackBar.show(context, AccountPageString.loginOutErrorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AccountPageString.title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 20
      ),),),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Card(
              color: ProjectColor.accountCardColor,
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'sifre-yenile');
                },
                leading: Icon(CupertinoIcons.person_circle_fill),
                title: Text(AccountPageString.sifreYenile),
                trailing: Icon(CupertinoIcons.chevron_right),
              ),
            ),
            Card(
              color: ProjectColor.accountCardColor,
              child: ListTile(
                onTap: () {
                  _userSignOut(context);
                  Navigator.of(context).pushAndRemoveUntil(AnimationCreator.createRoute(LoginPage()), (Route<dynamic> route) => false,);
                },
                iconColor: ProjectColor.logOutColor,
                leading: AnimatedIconWidget(icon: AnimateIcons.signOut, color: ProjectColor.logOutColor),
                title: Text(AccountPageString.cikisYap, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ProjectColor.logOutColor
                ),),
              ),
            ),
            Spacer(),
            ListTile(
              leading: AnimatedIconWidget(icon: AnimateIcons.expensive, color: Colors.amberAccent,),
              title: Text(AccountPageString.devop, style: Theme.of(context).textTheme.bodyLarge,),
            )
          ],
        ),
      ),
    );
  }
}

class AccountPageString {
  static String devop = 'Developed by Mustafa Yıldırım';
  static String cikisYap = 'Çıkış yap';
  static String sifreYenile = 'Hesap Şifresini Değiştir';
  static String title = 'Ayarlar';
  static String okMessage = 'Oturum Başarılı bir şekilde kapatıldı.';
  static String loginOutErrorMessage = 'Oturum kapatılırken sorunla karşılaşıldı.';
}