import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/models/ScreenToShow.dart';
import 'package:foodegaapp/screens/diary_screen.dart';
import 'package:foodegaapp/screens/login_screen.dart';
import 'package:foodegaapp/services/AuthenticationService.dart';
import 'package:foodegaapp/services/CloudFirestoreGetter.dart';

class ProfileSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget backbutton = Container(
      height: MediaQuery.of(context).size.height / 8,
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
        child: Row(
          children: [
            BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiaryScreen(
                      screenToShow: TabScreens.Me,
                    ),
                  ),
                );
              },
            ),
            InfoText(
              text: "Back",
            )
          ],
        ),
      ),
    );

    Widget header = Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: InfoText(
        text: 'Your Profile Summary:',
        textsize: 25,
      ),
    );
    Widget dataSection = FutureBuilder(
      future: Future.wait([
        getUserEmail(),
        getUserGender(),
        getUserAge(),
        getUserHeight(),
        getUserWeight(),
        getUserGoal()
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.blue),
              child: DataTable(
                columns: [
                  DataColumn(
                    label: InfoText(
                      text: ' Info',
                      textsize: 18,
                    ),
                  ),
                  DataColumn(
                    label: InfoText(
                      text: '             Data',
                      textsize: 18,
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        InfoText(text: "e-Mail"),
                      ),
                      DataCell(
                        InfoText(text: snapshot.data[0]),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        InfoText(text: "Gender"),
                      ),
                      DataCell(
                        InfoText(text: snapshot.data[1]),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        InfoText(text: "Age"),
                      ),
                      DataCell(
                        InfoText(text: snapshot.data[2].toString()),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        InfoText(text: "Height"),
                      ),
                      DataCell(
                        InfoText(text: snapshot.data[3].toString()),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        InfoText(text: "Weight"),
                      ),
                      DataCell(
                        InfoText(text: snapshot.data[4].toString()),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        InfoText(text: "Goal"),
                      ),
                      DataCell(
                        InfoText(text: snapshot.data[5]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return InfoText(text: 'No Data to display');
      },
    );

    Widget logoutButton = Container(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Logout',
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
        onPressed: () {
          AuthenticationService.logout();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            backbutton,
            header,
            dataSection,
            logoutButton
          ],
        ),
      ),
    );
  }
}
