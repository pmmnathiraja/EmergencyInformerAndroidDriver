

import 'package:driver/map/map_load.dart';
import 'package:driver/map/signal_detect.dart';
import 'package:driver/model/user.dart';
import 'package:driver/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/auth_notifier.dart';


class LoginInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Emergency Informer',
         theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
       ),
             home: Consumer<AuthNotifier>(
                builder: (context, notifier, child) {
                 return notifier.user != null ? SignalLocationPage() : Login();
          },
        ),
     ),
    );
  }
}


