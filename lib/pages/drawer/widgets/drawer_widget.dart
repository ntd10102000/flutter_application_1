import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings_view.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountName: Text('Ngọc Nghĩa'),
            accountEmail: Text('nghia1017@gmail.com'),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('App Settings'),
            trailing:
                Icon(Icons.keyboard_arrow_right), //Là phần cuối của list title
            onTap: () {
              // TODO: Điều hướng ở đây
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return SettingsView();
                },
              ));
            },
          )
        ],
      ),
    );
  }
}
