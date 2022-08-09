import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multivendor_app/view/auth/landing_customer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    print('Completed');
  });
  runApp(const MultivendorApp());
}

class MultivendorApp extends StatelessWidget {
  const MultivendorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan, fontFamily: "Barlow"),
      debugShowCheckedModeBanner: false,
      home: LandingCustomerScreen(),
    );
  }
}
