import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedBox _emptyCreater(double deger) {
      return SizedBox(
        height: deger,
      );
    }

    return Scaffold(
      backgroundColor: _ProjectColor().backroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.android, size: 100),
            _emptyCreater(50),
            Text(
              _ProjectStrings().helloAgain,
              style: GoogleFonts.bebasNeue(fontSize: 52),
            ),
            _emptyCreater(10),
            Text(
              _ProjectStrings().description,
              style: TextStyle(fontSize: 20),
            ),
            _emptyCreater(50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: _ProjectColor().textFieldColor,
                  filled: true,
                  hintText: _ProjectStrings().hintTextOne,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: _ProjectColor().textFieldColor,
                    border: OutlineInputBorder(),
                    hintText: _ProjectStrings().hintTextTwo),
              ),
            ),
            _emptyCreater(10),
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                width: 370,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                ),
              ),
            ),
            _emptyCreater(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _ProjectStrings().downDescriptionOne,
                  style: TextStyle(
                      color: _ProjectColor().one, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(_ProjectStrings().downDescriptionTwo)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProjectColor {
  final Color backroundColor = Color.fromARGB(255, 230, 223, 223);
  final Color textFieldColor = Color.fromARGB(255, 210, 196, 196);
  final Color one = Colors.blue;
}

class _ProjectStrings {
  final String helloAgain = 'HELLO AGAIN!';
  final String description = "Welcome back, you've been missed!";
  final String hintTextOne = 'Email';
  final String hintTextTwo = 'Password';
  final String downDescriptionOne = 'Not a member?';
  final String downDescriptionTwo = 'Register Now';
}
