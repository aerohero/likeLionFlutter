import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // 싱글톤 패턴을 사용해야만 하는 경우에 해당.

    setState(() {
      // setState를 호출하여 화면을 다시 그린다.
      setState(() {
        _controller.text = prefs.getString('username') ?? '';
      });
      // SharedPreferences에서 사용자 이름을 가져와 텍스트필드에 표시한다.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preference Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter your username',
              ),
              controller: _controller,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  // shared_preferences 패키지를 사용하여 SharedPreferences 인스턴스를 가져온다.
                  prefs.setString('username', _controller.text);
                },
                child: const Text('save'))
          ],
        ),
      ),
    );
  }
}
