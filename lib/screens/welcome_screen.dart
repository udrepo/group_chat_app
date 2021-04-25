import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/screens/login_screen.dart';
import 'package:group_chat_app/screens/registration_screen.dart';
import 'package:group_chat_app/widgets/login_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,
    duration: Duration(seconds: 1),);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
    controller.addListener(() {
      setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(controller.value),
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
                    height: animation.value * 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Jyldam chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  pause: const Duration(milliseconds: 700),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            LoginButton(text: 'Log in', color: Colors.pink, onTap: (){
              Navigator.pushNamed(context, LoginScreen.routeName);
            },),
           LoginButton(text: 'Register', color: Colors.pinkAccent, onTap: (){
             Navigator.pushNamed(context, RegistrationScreen.routeName);
           })
          ],
        ),
      ),
    );
  }
}


