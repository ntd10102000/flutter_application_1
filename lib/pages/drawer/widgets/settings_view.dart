import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class SettingsViewState extends State<SettingsView> {
  var _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              title: Text('Value'),
            )
          ],
        ),
      ),
    );
  }
}
