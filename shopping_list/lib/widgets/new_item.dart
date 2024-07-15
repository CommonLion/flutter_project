//사용자의 입력 관리. 위젯

import 'dart:convert';

import 'package:flutter/material.dart';

//해당 패키지에 해한 모든 내용이 http로 들어가야됨.
import 'package:http/http.dart' as http;

import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>(); // 전역 키 생성자 함수를 사용해 새 전역 키를 생성한다.
  //Form위젯이 우리에게 주는 것이 FormState이라서 이걸 받는 거임.
  var _enterdName = '';
  var _enteredQuantity = 1; //초기 입력값은 1로 정의
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() async {
    //현재 상태에 대한 유효성검사
    //폼위젯과 폼 전역키를 결합해 자동으로 유효성 검사 함수를 트리거할수 있다.

    if (_formKey.currentState!.validate()) {
      //유효성 검사가 통과해야 상태를 저장한다.
      _formKey.currentState!.save(); //현재 상태 저장
      //새 식료품 아이템이 생성

      //
      /**
       * 1. 파이어 베이스 DB 경로 
       * 2. 추가하고 싶은 경로 
      */
      final url = Uri.https(
        'flutter-prep-172ab-default-rtdb.firebaseio.com',
        'shopping-list.json',
      );
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        //ID는 보낼필요 없음 firebase에서 고유 ID를 만들어 주니까.
        body: json.encode(
          {
            'name': _enterdName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory
                .title, //나중에 실제 캎테고리 객체에 매핑하기 위해 이 title을 사용할 수 있다.
          },
        ),
      );

      final Map<String, dynamic> resData = json.decode(response.body);

      //context가 마운트됐는지 안됐는지를 확인할 수 있음.
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop(
        GroceryItem(
          id: resData['name'],
          name: _enterdName,
          quantity: _enteredQuantity,
          category: _selectedCategory,
        ),
      );
    }
  }

  //글러벌키와 valueKey는 연결된 기본 위젯에 쉽게 접근할 수 있게 해주낟.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  //유효성 검사, 덥변의 길이가 1인인지
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  //저장이 실행되는 시점에서의
                  _enterdName = value!;
                },
              ), //instead of TextField()
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    //텍스트 양식 필드를 확장된 위젯으로 래핑한다.
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        //유효성 검사, 덥변의 길이가 1인인지
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  //카테고리 선택하는 버튼/ 또한 버튼 약식 필드 위젯을 중심으로 확장한다.
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory, //initvalue를 지원하지 않으니까 value사용
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(category.value.title),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            // init이 아닌 보이는 value의 값이여서 그래서 현재 선택 한값이 화면에 반영이 되돍 상태를 설정해야한다.
                            _selectedCategory = value!;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),

              /*초기화 버튼이랑 아이템 추가 버튼*/
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Add Item'),
                  ),
                ],
              )
            ],
          ),
        ),
      ), //Form이 화면 유효성 검사도 해준다.
    );
  }
}
