import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //const 사용을 위해 MyApp 생성자에 key를 추가
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(title: Text('Google Fonts Demo')),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World', style: TextStyle(fontSize: 24)),
              Text('Hello World',
                  style: GoogleFonts.nanumPenScript(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue)),
            ],
          ))),
    );
  }
}
