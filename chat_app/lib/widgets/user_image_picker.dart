import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//업로드 전에 이미지를 고르고 미리 보기를 보여주는 위젯. 상태 관리 해야함.
class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
//갤러리도 되고 카메라도됨.
//ImagePicker가 제공하는 기능임. 이게
    if (pickedImage == null) {
      //이미지 선택이null과 같다면
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    //이미지를 고를 수 있고 그걸 보여주는 위젯을 반환
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ), //이 원을 렌더링 한다
        TextButton.icon(
          onPressed: _pickImage, //image_picker의 도움으로 카메라를 열거다.
          icon: Icon(Icons.image),
          label: Text(
            'Add Image',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
