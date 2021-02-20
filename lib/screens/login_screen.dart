import 'package:flutter/material.dart';
import 'package:foodegaapp/components/auth_text_input.dart';
import 'package:foodegaapp/screens/diary_screen.dart';
import 'package:foodegaapp/screens/register_screen.dart';
import 'package:foodegaapp/services/AuthenticationService.dart';

class LoginScreen extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool shouldContinue = true;

  @override
  Widget build(BuildContext context) {
    Widget logoSection = Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2,
      child: Image(
        image: AssetImage('assets/images/foodegalogo.png'),
      ),
    );

    Widget inputSection = Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthTextInput(
                controllerType: _emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter eMail',
                validator: (password) {
                  return !shouldContinue
                      ? "E-Mail or Password are incorrect"
                      : null;
                },
                labelText: 'E-Mail',
                suffixIcon: Icon(Icons.mail),
                obscure: false,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              AuthTextInput(
                controllerType: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Enter Password',
                validator: (password) {
                  return !shouldContinue
                      ? "E-Mail or Password are incorrect"
                      : null;
                },
                labelText: 'Password',
                suffixIcon: Icon(Icons.lock),
                obscure: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ));

    Widget buttonSection = Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          MaterialButton(
            onPressed: () async {
              shouldContinue = await AuthenticationService.login(
                  _emailController.text, _passwordController.text);
              if (_formKey.currentState.validate() && shouldContinue) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiaryScreen(),
                  ),
                );
              }
            },
            minWidth: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.blue),
            ),
          ),
        ],
      ),
    );

    Widget bottom = Container(
      height: MediaQuery.of(context).size.height / 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Don't have an account yet?",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.white,
                ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: Text(
              'Register',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                logoSection,
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                inputSection,
                buttonSection,
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                bottom,
              ],
            ),
          ),
        ),
      ),
    );
  }

  validation() {
    if (shouldContinue == false) {
      return true;
    } else {
      return false;
    }
  }
}
