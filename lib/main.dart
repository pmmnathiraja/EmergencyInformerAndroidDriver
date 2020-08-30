import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:driver/app.dart';
import 'package:driver/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryDark
  ));
  runApp(App());
}



//import 'package:driver/utils/colors.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';
//
//Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: primaryDark
//  ));
//  runApp(MyApp());
//}
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  Map map = Map<dynamic, dynamic>();
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: StreamBuilder(
//          stream: FirebaseFirestore.instance.collection('222222222222222').snapshots(),
//          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//            if (snapshot.hasError) {
//              return Text('Something went wrong');
//            }
//
//            if (snapshot.connectionState == ConnectionState.waiting) {
//              return Text("Loading");
//            }
//            if(snapshot.data.docs != null) {
//              FirebaseDatabase.instance.reference().child("EmergencyLocation").once().then((DataSnapshot snapshot){
//                if(snapshot.value != null){
//                Map<dynamic, dynamic> valuesGet = snapshot.value;
//                valuesGet.forEach((key,values) {
//                      double _doubleLatitude = double.parse(values['Latitude']);
//                      double _doubleLongitude = double.parse(values['Longitude']);
//                  FirebaseFirestore.instance
//                      .collection("RequestPool")
//                      .doc(key)
//                      .set({
//                    'User_Location': GeoPoint(_doubleLatitude, _doubleLongitude)
//                  }).then((_) {
//                    FirebaseDatabase.instance.reference().child("EmergencyLocation").child(key).remove();
//                  });
//                });
//              }});
//              return Container();
//            }
//            else{
//                  FirebaseDatabase.instance.reference().child("EmergencyLocation").once().then((DataSnapshot snapshot){
//                        Map<dynamic, dynamic> valuesGet = snapshot.value;
//                           valuesGet.forEach((key,values) {
//                             print('...........................................................................');
//                             print(key);
//                             print(values);
//                    });
//                });
//              return Container();
//            }
//          }
//    ),
//    );
//  }
//}
