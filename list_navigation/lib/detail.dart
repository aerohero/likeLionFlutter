import 'package:flutter/material.dart';

class MyDetails extends StatelessWidget {
  const MyDetails(this.month, {super.key});

  final String month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(month),
      ),
      body: Center(
        child: Text('This is the details page for $month'),
      ),
    );
  }
}
