import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer/home_drawer.dart';
import 'auth_method.dart';
import '../main/home_view.dart';
import 'widgets/email_card.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //Fake 1 hàm bất đồng bộ

  Future<dynamic> fakeProcess({
    exception,
    duration,
  }) async {
    final _duration = duration ?? Duration(seconds: 3);

    await Future.delayed(_duration);
    if (exception != null) return exception;
    return null;
  }

  bool _isBusy = false;
  set isBusy(value) {
    setState(() {
      _isBusy = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Positioned.fill(
              child: Container(color: Colors.blue),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 2,
              child: Container(color: Colors.white),
            ),
            ListView(
              padding: EdgeInsets.only(top: 0),
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 500,
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(32),
                            child: Column(
                              children: [
                                Visibility(
                                  visible: _isBusy,
                                  child: CircularProgressIndicator(),
                                ),
                                Visibility(
                                  visible: !_isBusy,
                                  child: EmailCard(
                                    onLoginPressed: (email, password) async {
                                      //Báo cho view biết trạng thái bật
                                      isBusy = true;
                                      AuthMethod()
                                          .signInWithEmail(email, password)
                                          .then((value) {
                                        isBusy = false;
                                        if (value == null)
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeView()));
                                        else {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: Text('$value'),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop<String>(
                                                                'Close');
                                                      },
                                                      child: Text('Close'),
                                                    )
                                                  ],
                                                );
                                              });
                                        }
                                      });
                                    },
                                    onResetPressed: (email) async {
                                      isBusy = true;

                                      final results = await fakeProcess();
                                      isBusy = false;
                                      if (results == null)
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (_) {
                                            return HomeDrawer();
                                          }),
                                        );
                                      else
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return AlertDialog(
                                                title: Text(results.message),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop<String>('Close');
                                                    },
                                                    child: Text('Close'),
                                                  )
                                                ],
                                              );
                                            }).then((value) {
                                          if (value != null) print(value);
                                        });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AuthMethod().signWithInAnonymously().then((value) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeView()));
                          });
                        },
                        child: Text('sign in with guest'),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
