import 'package:flutter/material.dart';
import 'package:responsi2mobile_paket3_h1d023035/helpers/user_info.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/login_page.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();
  
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const BukuPage();
      });
    } else {
      setState(() {
        page = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi 2 Mobile Paket 3 (H1D023035)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: Colors.brown,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ).copyWith(
          secondary: Colors.brown.shade300,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: page,
    );
  }
}
