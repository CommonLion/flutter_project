import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  //그냥 ㅜㄹ력만할거니 상태 비저장
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  //위젯이 상태비저장 위젯이므로 context를 직접 받아야한다. 그래서 해당 메서드에 context작성

  final List<GroceryItem> _groceryItems = []; //식료품 목록이다.

  void _addItem(BuildContext context) async {
    //스크린 스택에 밀어낸 그 데이터
    //이 데이터는 newItem으로 데이터를
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    //새로운 아이템 페이지로 변환
    //빌더의 기능을 취한다. 이 경로의 컨텍트를 얻는다. // 간단히 새 아이템 위젯을 반환한다.

    //새로운 아이템이면 목록에 아이템을 추가해야하낟.
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),

      body: ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(
                  _groceryItems[index].category.toString(),
                ), //위젯으로 수량을 출력하고 인덱스로 식료품 항목에 접근하도록 한다.
              )), //목록을 출력하고 싶다. 잠재적으로 길어 질수도 있고,
      //현재 빌드되는 목록 항목의 index와, ctx값은 플터가 알아서 넘겨주고, ListTile위젯을 반한한다.
    );
  }
}
