import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/components/measure_untits_field.dart';
import 'package:foodegaapp/components/numberpicker.dart';
import 'package:foodegaapp/components/rounded_forward_button.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreSetter.dart';
import 'package:foodegaapp/services/UserBloc.dart';

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
            child: InfoText(
              text:
                  'To gather some data about you please \n answer the following question.',
              textsize: 15,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Enter your age',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );

    Widget midScreenComponents = Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 5.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.height / 15,
              child: NumberPicker(
                range: 111,
                initialValue: BlocProvider.of<UserBloc>(context).getAge(),
                onValueChanged: (int newVal) =>
                    BlocProvider.of<UserBloc>(context).setAge(newVal),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 35,
              width: MediaQuery.of(context).size.height / 15,
              child: MeasureUnits(
                unit: 'years',
              ),
            ),
          ],
        ),
      ),
    );

    Widget buttonSection = Container(
      height: MediaQuery.of(context).size.height / 3,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 15),
        child: RoundedForwardButton(
          onPressed: () {
            setAge(context);
            Navigator.pushNamed(context, 'weightscreen');
          },
        ),
      ),
    );

    return CupertinoApp(
      home: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        child: Column(
          children: [
            textSection,
            midScreenComponents,
            buttonSection,
          ],
        ),
      ),
    );
  }
}
