import 'package:flutter/material.dart';
import 'package:group_chat_app/screens/login_screen.dart';

class LoginButton extends StatelessWidget {

  final String text;
  final Color color;
  final Function onTap;

  LoginButton({@required this.text, @required this.color, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}