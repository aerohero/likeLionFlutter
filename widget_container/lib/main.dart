import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Fonts Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyLarge:
                GoogleFonts.aBeeZee(fontSize: 30, color: Colors.deepOrange),
            bodyMedium:
                GoogleFonts.aBeeZee(fontSize: 18, color: Colors.grey[700]),
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // bulid 함수: 위젯을 생성하는 함수
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
            width: 300,
            height: 380,
            color: Colors.white,

            // 재활용성 위해 별도 위젯 구성 실습
            // child: Column(
            //   children: [
            //     _buildRow(),
            //     SizedBox(height: 10),
            //     _buildRow(),
            //     SizedBox(height: 10),
            //     _buildRow(),
            //     SizedBox(height: 10),
            //   ],
            // ),

            // ListView.builder 사용 실습
            // child: ListView.builder(
            //     itemCount: 30,
            //     itemBuilder: (context, index) {
            //       return _buildListItem();
            //     }),

            child: Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Hello',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: ' '),
                  TextSpan(
                      text: 'Flutter',
                      style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(text: ' '),
                ]),
              ),
            )),
      ),
    );
  }

  // Widget _buildRow() {
  //   return Row(children: [
  //     Image.network('https://picsum.photos/120/60'),
  //     SizedBox(
  //       height: 10,
  //     ),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text('Hello World',
  //             style: TextStyle(fontSize: 20, color: Colors.indigo)),
  //         Text('Dart & Flutter',
  //             style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
  //       ],
  //     ),
  //   ]);
  // }

  // Widget _buildListItem() {
  //   return ListTile(
  //     // title: Text('Hello World',
  //     //     style: TextStyle(fontSize: 20, color: Colors.indigo)),
  //     // subtitle: Text('Dart & Flutter',
  //     //     style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
  //     // leading: Image.network('https://picsum.photos/120/60'),

  //     title: Text('Hello World'),
  //     subtitle: Text('Dart & Flutter'),
  //     titleTextStyle: Theme.of(context).textTheme.bodyLarge,
  //     subtitleTextStyle: Theme.of(context).textTheme.bodyLarge,
  //   );
  // }
}
