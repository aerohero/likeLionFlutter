import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';

class EvenOddDisplay extends StatelessWidget {
  const EvenOddDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CounterModel, bool>(
        // 셀렉터의 값이 변경될 때만 EvenOddDisplay 위젯이 리빌드된다.
        selector: (context, model) => model.counter % 4 == 0,
        builder: (context, isEven, child) {
          return Text(
            isEven ? '4의 배수' : '나머지',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        });
  }
}
