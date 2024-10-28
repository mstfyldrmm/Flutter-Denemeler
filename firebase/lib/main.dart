import 'package:firebase/firebase_options.dart';
import 'package:firebase/news_turkish/screen/account.dart';
import 'package:firebase/news_turkish/screen/home.dart';
import 'package:firebase/news_turkish/screen/login_screen.dart';
import 'package:firebase/news_turkish/screen/passwordReset.dart';
import 'package:firebase/news_turkish/screen/signUpPage.dart';
import 'package:firebase/news_turkish/screen/splashScreen.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:firebase/news_turkish/view_model/result_list_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ResultListViewModel>(
          create: (context) => ResultListViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ProjectColor.backgroundColor,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true),
        expansionTileTheme: ExpansionTileThemeData(
          textColor: ProjectColor.textColor,
          iconColor: ProjectColor.textColor,
          collapsedTextColor: ProjectColor.textColor,
          collapsedIconColor: ProjectColor.textColor
        ),
        listTileTheme: ListTileThemeData(
          iconColor: ProjectColor.textColor,
          textColor: ProjectColor.textColor
        ),    
        textTheme: GoogleFonts.oxygenTextTheme(
          Theme.of(context).textTheme?.copyWith(
                titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: ProjectColor.textColor),
                bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ProjectColor.textColor,
                    fontWeight: FontWeight.w700),
                bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w900, color: ProjectColor.textColor),
              ),
        ),
        useMaterial3: true,
      ),
      routes: {
        //temel istenilen, ilk acilmasi gereken sayfa
        "/login" : (context) =>  LoginPage(),
        "kayit" : (context) => const SignUpPage(),
        "home-view" : (context) => HomeScreenNews(),
        "account" : (context) => Account(),
        "sifre-yenile" : (context) => PasswordReset() 
      },
      home: SplashsScreen(),
    );
  }
}

