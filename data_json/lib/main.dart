import 'package:flutter/material.dart';
// import 'dart:convert';

// 파일없이
// import 'basic.dart';

// void main() {
//   runApp(const MyApp());
// }

// 파일로 가져오기
// import 'with_file.dart';

// json 파일로 가져오기
import 'file_json.dart';

void main() {
  runApp(MyApp());
}

// JSON 데이터 파싱 (구문 분석)

// 비동기 함수, Future, async, await
// 비동기 함수는 함수가 실행되는 동안 다른 코드가 실행될 수 있도록 하는 함수이다.

// class MyData {
//   final List<String> items = <String>[
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ];
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // final MyData data = MyData();
//   late Future<List<String>> futureData;

//   @override
//   void initState() {
//     super.initState();
//     futureData = _loadMonths();
//   }

//   Future<List<String>> _loadMonths() async {
//     String jsonString = await DefaultAssetBundle.of(
//       context,
//     ).loadString('assets/example.json');
//     // json 파싱된 결과를 List<String>으로 변환
//     return jsonDecode(jsonString).values.cast<String>().toList();
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('My Data App')),
//         body: FutureBuilder<List<String>>(
//           future: futureData,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               // 미래 데이터에 대해 값이 없는 경우 (1: 값이 안넘어온 경우, 2: 로딩 중, 3: 에러)
//               return const Center(child: CircularProgressIndicator());
//             }
//             final data = snapshot.data!;
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(title: Text(data[index]));
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
