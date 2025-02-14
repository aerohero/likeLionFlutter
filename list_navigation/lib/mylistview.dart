import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'detail.dart';

class ListDataItems {
  final List<String> monthItems = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ListDataItems item = ListDataItems(); // DK swift에서의 클래스 인스턴스 생성?

    return Scaffold(
      appBar: AppBar(
        title: const Text('Months List View'),
      ),

      // 첫번째, 두번째 실습
      // body: ListView.builder(

      // 첫번째 실습
      // itemCount: item.monthItems.length,
      // itemBuilder: (context, index) {
      //   return ListTile(
      //     title: Text(item.monthItems[index]),
      //   );
      // })

      // 두번째 실습
      // itemCount: item.monthItems.length,
      // itemBuilder: (context, index) {
      //   return ListTile(
      //       title: Text(item.monthItems[index]),
      //       trailing: const Icon(Icons.arrow_forward_ios),
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) =>
      //                     MyDetails(item.monthItems[index])));
      //       });
      // },
      // itemExtent: 50,
      //   ),
      // );
      // }

      // 세번째 실습
      // ListView.separated를 사용하여 리스트 뷰를 생성합니다.
      // 첫번째, 두번째 실습에서는 ListView.builder()를 사용한 것과 비교
      body: ListView.separated(
        itemCount: item.monthItems.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(item.monthItems[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:
                            (/*BuildContext 생략. 왜? 파라미터 1개라서 명확하므로*/ context) =>
                                MyDetails(item.monthItems[index])));
              });
        },
        // Divider 위젯을 사용하여 리스트 간의 구분선을 생성합니다.
        // color, thickness, height, indent 속성을 사용하여 색상, 두께, 높이, 들여쓰기를 설정합니다.
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
            indent: 16,
            endIndent: 4,
          );
        },
      ),
    );
  } // Widget ~ {} 끝에는 세미콜론을 붙이지 않는다.
} // class ~ {} 끝에는 세미콜론을 붙이지 않는다.
