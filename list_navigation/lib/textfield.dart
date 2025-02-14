import 'package:flutter/material.dart';

// StatelessWidget
// TextFieldDemo는 텍스트 필드 예제를 보여주는 StatelessWidget입니다.
class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldExample();
  }
}

// StatefulWidget
// TextFieldExample은 텍스트 필드와 값을 표시하는 AlertDialog를 포함하는 StatefulWidget입니다.
class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
  // createState 함수를 호출하여 _TextFieldExampleState 객체를 생성
}

// State 관리를 위한 class 선언
// _TextFieldExampleState는 TextFieldExample의 상태를 관리합니다.
class _TextFieldExampleState extends State<TextFieldExample> {
  // _controller는 텍스트 필드의 값을 제어합니다.
  final TextEditingController _controller = TextEditingController();
  // _passwordController는 비밀번호 텍스트 필드의 값을 제어합니다.
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Scaffold는 기본적인 앱 화면 구조를 제공합니다.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // TextField는 사용자로부터 텍스트 입력을 받는 위젯입니다.
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
              // obscureText 속성을 사용하여 입력한 텍스트를 숨긴다.
              obscureText: true,
            ),
            // ElevatedButton은 클릭 시 AlertDialog를 표시하는 버튼입니다.
            ElevatedButton(
              onPressed: () {
                // showDialog는 AlertDialog를 표시하는 함수입니다.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Text Field Value'),
                      content:
                          Text('The value you entered is: ${_controller.text}'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Value'),
            ),
          ],
        ),
      ),
    );
  }
}
