// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'ui/HomeScreen.dart';
// import 'ui/LoginScreen.dart';
// import 'ui/PostJob.dart';
// import 'ui/payment.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Set system overlay style for status bar
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//       ),
//     );

//     return MaterialApp(
//       title: 'Service Marketplace',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         scaffoldBackgroundColor: const Color(0xFF1A1A1A),
//         fontFamily: 'Arial',
//       ),
//       home: const LoginScreen(),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gighire/Services/Auth/auth_gate.dart';
import 'package:gighire/Theme/theme_provider.dart';
import 'package:gighire/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      // home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
