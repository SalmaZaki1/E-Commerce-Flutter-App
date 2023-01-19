import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBii9I_xUvSkYGM4Ak3fPqvaJU68UOFF0A",
      projectId: "my-e-commercial-app-b4ec7",
      appId: "1:504524709374:web:f09861dc005bcfc8eb34af",
      messagingSenderId: "504524709374",

    ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: StreamBuilder(
        builder: (ctx, snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }else{
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}

