import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/components/Rounded_Button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve:  Curves.decelerate);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts:
                    [TypewriterAnimatedText('Flash Chat',
                      textStyle:TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
                      speed: Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton( Colors.lightBlueAccent, 'Login', () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(Colors.blueAccent, 'Register', () {
              Navigator.pushNamed(context, RegistrationScreen.id);
              },),
          ],
        ),
      ),
    );
  }
}


