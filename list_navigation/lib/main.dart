import 'package:flutter/material.dart';
// import 'mylistview.dart';
// 같은 폴더 안에 파일이 위치하더라도 import '파일명.파일종류' 필요

// import 'sliverlistview.dart';
// import 'textfield.dart';
// import 'shared_preference.dart';
// import 'navigator.dart';
// import 'drawer.dart';
// import 'tab.dart';
// import 'tab_cupertino.dart';
import 'navigator2_demo.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//             // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,

//             // themeData의 tabBarTheme 속성을 사용해 탭바의 색상을 변경
//             tabBarTheme: const TabBarTheme(
//               labelColor: Colors.green,
//               indicatorColor: Colors.green,
//             )
//             // primaryColor: Colors.blue,
//             ),
//         // home: const MyListView(),
//         // home: const MySliverList(),
//         // home: const TextFieldDemo(),
//         // home: SharedPreferenceDemo(),
//         // home: NavigatorDemo(),
//         // home: DrawerDemo(),
//         // home: TabDemo(),

//         // 홈 대신 initialRoute 속성을 사용하여 초기 경로르 지정
//         initialRoute: '/',
//         routes: <String, WidgetBuilder>{
//           '/': (BuildContext context) => const HomePage(),
//           '/signup': (BuildContext context) => const SignUpPage(),
//         });
//   }
// }

class Routes {
  static const String home = '/';
  static const String signUp = '/signup';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        // 홈 대신 initialRoute 속성을 사용하여 초기 경로를 지정
        initialRoute: Routes.home,
        // onGenerateRoute 속성을 사용하여 경로를 생성
        onGenerateRoute: Routes.generateRoute);
  }
}
