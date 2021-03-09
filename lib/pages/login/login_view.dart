import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/email_card.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) => Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 2,
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              padding: EdgeInsets.only(top: 0),
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  constraints: BoxConstraints(
                    minHeight: constrains.maxHeight,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          width: 500,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: Column(
                                children: [
                                  EmailCard(
                                    onLoginPressed: (email, password) {
                                      print('$email, $password');
                                    },

                                    /// yêu cầu bổ sung onResetPressed và in ra email hợp lệ tương tự đối với onLogin
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
