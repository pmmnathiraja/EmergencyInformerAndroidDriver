import 'package:driver/utils/colors.dart';
import 'package:driver/loginInit.dart';
import 'package:driver/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class ReachHospitalPage extends StatefulWidget {
  ReachHospitalPage(this.userPersonalData) : super();
  final String userPersonalData;
  @override
  _ReachHospitalPageState createState() => _ReachHospitalPageState();
}

class _ReachHospitalPageState extends State<ReachHospitalPage> {
  dynamic firebaseData;
  DateTime birthDate;
  String _userName;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    return Scaffold(
      appBar: AppBar(
        // backgroundColor:Colors.purpleAccent,
        title: Container(
          alignment: Alignment.center,
          child: Text("Patient's Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              )),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.userPersonalData)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.data != null) {
            return Container(
              child: Stack(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Table(
//                        columnWidths: {-2: FractionColumnWidth(.3)},
                              columnWidths: {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(4),
                              },
                              children: [
                                TableRow(children: [
                                  Text("    NAME",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(":   ${snapshot.data.data()['Name']}",
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                                TableRow(children: [
                                  Text("    EMAIL",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      ":   ${snapshot.data.data()['Email Address']}",
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                                TableRow(children: [
                                  Text("    NIC NUMBER",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      ":   ${snapshot.data.data()['NIC Number']}",
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                                TableRow(children: [
                                  Text("    BLOOD TYPE",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      ":   ${snapshot.data.data()['Blood Type']}",
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                                TableRow(children: [
                                  Text("    PHONE NO.",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      ":   ${snapshot.data.data()['Phone Number']}",
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                                TableRow(children: [
                                  Text("    GENDER",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(":   ${snapshot.data.data()['Gender']}",
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                              ],
                            )),
                      SizedBox(height: 40,),
                        Container(
                          height: 60.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                          ),
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () =>
                                Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(builder: (BuildContext context) {
                                      return LoginInit();
                                    })),
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Text(
                              'REACHED TO THE HOSPITAL',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                Positioned(
                  bottom: 30,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AvailableImages.homePage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
