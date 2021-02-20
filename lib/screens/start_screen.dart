import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/rounded_forward_button.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget logoSection = Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 2,
      child: Image(
        image: AssetImage('assets/images/foodegalogo.png'),
      ),
    );

    Widget buttonSection = Container(
      child: RoundedForwardButton(
        onPressed: () {
          Navigator.pushNamed(context, 'loginscreen');
        },
      ),
    );

    Widget textSection = Container(
      height: MediaQuery.of(context).size.height / 2,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Foodega',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              buttonSection,
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'An app developed by Florian Schmidt and Daniel Wieser',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              logoSection,
              textSection,
            ],
          ),
        ),
      ),
    );
  }
}
