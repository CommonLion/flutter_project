import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  //그냥 ㅜㄹ력만할거니 상태 비저장
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: groceryItems[index].category.color,
                ),
                trailing: Text(
                  groceryItems[index].category.toString(),
                ), //위젯으로 수량을 출력하고 인덱스로 식료품 항목에 접근하도록 한다.
              )), //목록을 출력하고 싶다. 잠재적으로 길어 질수도 있고,
      //현재 빌드되는 목록 항목의 index와, ctx값은 플터가 알아서 넘겨주고, ListTile위젯을 반한한다.
    );
  }
}
