import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  //그냥 ㅜㄹ력만할거니 상태 비저장
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  //위젯이 상태비저장 위젯이므로 context를 직접 받아야한다. 그래서 해당 메서드에 context작성

  List<GroceryItem> _groceryItems = []; //식료품 목록이다.

  //위젯이 완성되고 처음 렌더링 되는 거일뎨/ 현재의 상태를 다루고 있으니 initstate 메서드를 추가한다. 초기화 작업이 가능하게
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-prep-172ab-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    final response = await http.get(url); // 응답 형식의 객체를 받은 것을 확인
    final Map<String, dynamic> listData =
        json.decode(response.body); //  디코드 한거임.
    final List<GroceryItem> _loadItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      //firebase에 카테고리 타이틀만 보내고 로컬 인메모리 데이터와 매치하려고한다.
      //해당 항목의 범주 키와 아래 저장된 값과 같은 제목을 가진다? catItem은 이미 저장된 카테고리를 가리킨다.
      _loadItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    setState(() {
      _groceryItems = _loadItems; // 식료품들을 업데이트 하는 부분임.
    });
  }

  void _addItem() async {
    //스크린 스택에 밀어낸 그 데이터
    //이 데이터는 newItem으로 데이터를
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    //새로운 아이템 페이지로 변환
    //빌더의 기능을 취한다. 이 경로의 컨텍트를 얻는다. // 간단히 새 아이템 위젯을 반환한다
    //_loadItems();
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    //기본화면인 거임. 아이템이 추가된거 없다면 나오는 화면
    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    //만약 식표품 데이터가 비어있지 않다면 다음과 같이 실행
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        //리스트를 밀면 없어지게 하는 기능 Dismissible
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          }, //미는 방향을 정할 수 있음.
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].category.toString(),
            ), //위젯으로 수량을 출력하고 인덱스로 식료품 항목에 접근하도록 한다.
          ),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
                onPressed: () {
                  _addItem();
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: content //목록을 출력하고 싶다. 잠재적으로 길어 질수도 있고,
        //현재 빌드되는 목록 항목의 index와, ctx값은 플터가 알아서 넘겨주고, ListTile위젯을 반한한다.
        );
  }
}
