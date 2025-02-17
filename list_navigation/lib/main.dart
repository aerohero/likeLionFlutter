import 'package:flutter/material.dart';
// import 'mylistview.dart';
// 같은 폴더 안에 파일이 위치하더라도 import '파일명.파일종류' 필요

// import 'sliverlistview.dart';
// import 'textfield.dart';
// import 'shared_preference.dart';
// import 'navigator.dart';
// import 'drawer.dart';
import 'tab.dart';

void main() {
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
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,

          // themeData의 tabBarTheme 속성을 사용해 탭바의 색상을 변경
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.green,
            indicatorColor: Colors.green,
          )
          // primaryColor: Colors.blue,
          ),
      // home: const MyListView(),
      // home: const MySliverList(),
      // home: const TextFieldDemo(),
      // home: SharedPreferenceDemo(),
      // home: NavigatorDemo(),
      // home: DrawerDemo(),
      home: TabDemo(),
    );
  }
}
