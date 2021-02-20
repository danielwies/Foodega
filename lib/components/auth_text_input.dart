import 'package:flutter/material.dart';

class AuthTextInput extends StatelessWidget {
  final TextEditingController controllerType;
  final TextInputType keyboardType;
  final String hintText;
  final FormFieldValidator<String> validator;
  final String labelText;
  final Widget suffixIcon;
  final bool obscure;

  AuthTextInput(
      {@required this.controllerType,
      @required this.keyboardType,
      @required this.hintText,
      this.validator,
      @required this.labelText,
      this.suffixIcon,
      @required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            style: TextStyle(color: Colors.white),
            controller: controllerType,
            keyboardType: keyboardType,
            obscureText: obscure,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              labelText: labelText,
              suffixIcon: suffixIcon,
              labelStyle: TextStyle(
                color: Colors.blue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
