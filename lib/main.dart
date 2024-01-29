import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:soomato/pages.dart';
import 'package:soomato/pages/bottomnav.dart';
import 'package:soomato/pages/login.dart';
import 'package:soomato/pages/onboard.dart';
import 'package:soomato/pages/order.dart';
import 'package:soomato/pages/profile.dart';
import 'package:soomato/pages/signup.dart';
import 'package:soomato/pages/wallet.dart';
import 'package:soomato/widgets/app_constant.dart';

import 'admin/add_food.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishableKey;
await Firebase.initializeApp(
  options: FirebaseOptions(
      apiKey: "AIzaSyCJ3wsFydjL5e-xh3HNgFIloCZK9jda7Jg",
      appId: "1:532486167893:android:819ef36e84ba343156e3dc",
      messagingSenderId: "532486167893",
      projectId: "soomaatoo-20b64")
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Onboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

