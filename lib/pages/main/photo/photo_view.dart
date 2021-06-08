import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatefulWidget {
  @override
  // TODO: implement createState
  State<StatefulWidget> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  final _keywordKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhoTo'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Photo searching'),
                    content: TextField(
                      controller: _keywordKey,
                      decoration: InputDecoration(hintText: 'Photo'),
                        ///sinh viên tự hoàn thiện phần nhập liệu
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          ///sinh viên lấy giá trị trả về key
                          Navigator.of(context).pop('keyword');
                        },
                        child: Text('Search'),
                      )
                    ],
                  );
                },
              ).then((value) {
                /// Sinh viên thực hiện được lấy đk từ khóa tìm kiếm
                print(value);
              });
            },
          )
        ],
      ),
    );
  }
}
