import 'package:flutter/material.dart';

// 메인 함수
void main() {
  runApp(const MyApp()); // runApp 함수를 호출하여 MyApp 위젯을 실행
}

class MyApp extends StatelessWidget {
// MyApp 위젯: 상태관리가 필요하지 않은 위젯
// StatelessWidget 키워드로 선언한다.
// 앱의 메인 위젯이다.
// 위젯은 swift의 view와 같다.
// 상태관리가 필요하지 않다는 것은, 화면에 한번 그리면 다시 그리지 않는다는 의미이다.
// 그러므로 상태변수를 모니터링하지 않아도 한번 그리면 다시 그리지 않아도 되고, 계속 같은 것을 사용한다는 의미다.

  const MyApp({super.key}); // MyApp 위젯의 생성자. key는 위젯의 식별에 사용

  // This widget is the root of your application.
  // 위젯의 UI를 빌드하는 메서드. BuildContext는 위젯 트리의 현재 위치를 나타낸다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp은 Flutter 앱의 기본 구조를 제공한다.

      title: 'Flutter Demo',
      // 앱의 제목을 정의

      theme: ThemeData(
        // 테마 설정

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // 색상 스키마 설정

        useMaterial3: true,
        // 머터리얼 3.0 테마 설정
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // 홈페이지 설정
      // 타이틀 파라미터 전달
    );
  }
}

// MyHomePage 위젯: 상태관리가 필요한 위젯
// StatefulWidget 키워드로 선언한다.
// 상태변수가 변하면 화면(뷰, 위젯)을 다시 그려야 한다.
class MyHomePage extends StatefulWidget {
  // 생성자
  const MyHomePage({super.key, required this.title}); // this = swift의 self

  final String title;
  // title 변수: 홈페이지의 타이틀을 저장하는 런타임 상수

  // createState 함수를 호출하여 MyHomePageState 객체를 생성
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  // _언더바 = swift의 private
}

// MyHomePageState 클래스: MyHomePage 위젯의 상태를 관리하는 클래스
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState 함수를 호출하여 상태를 변경
    setState(() {
      _counter++;
    });
  }

  // build 함수: 위젯을 생성하는 함수
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 위젯: material 디자인의 기본 레이아웃 구조를 제공
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        // title 속성에 Text 위젯을 사용하여 앱바에 표시할 텍스트를 설정
        // widget 프로퍼티는 statefulwidget을 가리킨다.
      ),

      body: Center(
        // body 속성에 Center 위젯을 사용하여 화면 중앙에 컨텐츠를 배치

        child: Column(
          // Column 위젯: 세로로 위젯을 배치하는 위젯 = VStack
          // child: 대부분의 위젯에는 child 속성이 있어 하나의 위젯을 배치할 수 있음

          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment 속성을 사용하여 세로 정렬 옵션 설정

          crossAxisAlignment: CrossAxisAlignment.center,

          // children 속성에 위젯을 배열로 설정하여 여러 위젯을 배치
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Text 위젯: 텍스트를 표시하는 위젯, counter 변수의 값을 표시, 상태가 변경될 때마다 변경된 값으로 업데이트
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
