import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'photo_browser_view.dart';

import 'photo.dart';

class PhotoDetailView extends StatefulWidget {
  final String id;
  final String url;
  const PhotoDetailView({
    Key? key,
    required this.id,
    required this.url,
  }) : super(key: key);
  @override
  _PhotoDetailViewState createState() => _PhotoDetailViewState();
}

class _PhotoDetailViewState extends State<PhotoDetailView> {
  List<String> tags = [];
  Future getInfo() async {
    final url = Uri.https(
      'www.flickr.com',
      'services/rest',
      {
        'api_key': '8233e94dde4a12a99a008313c8759407',
        'photo_id': widget.id,
        'method': 'flickr.photos.getInfo',
        'format': 'json',
        'nojsoncallback': '1',
      },
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      final result = jsonResponse['photo'];
      final _tags = result['tags'];
      final _tag = _tags['tag'];
      setState(() {
        tags = List<String>.from(_tag.map((e) => e['_content']));
      });
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            child: Image.network(
              widget.url,
              fit: BoxFit.cover,
            ),
          ),
          Wrap(
            children: tags.map((e) {
              return TextButton(
                  child: Text(e),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PhotoBrowserView(
                              tag: e,
                            )));
                  });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
