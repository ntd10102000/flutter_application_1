import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmailCardStatus { login, reset }

class EmailCard extends StatefulWidget {
  final void Function(String email, String password) onLoginPressed;
  final void Function(String email) onResetPressed;

  const EmailCard({Key key, this.onLoginPressed, this.onResetPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  var _status = EmailCardStatus.login;

  EmailCardStatus get status => _status;
  //getter in dart
  set status(value) {
    setState(() {
      _status = value;
    });
  }

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  ///Cách khác
  // final _emailControlller

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // trạng thái dăng nhập
        Visibility(
          visible: _status == EmailCardStatus.login,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đăng nhập',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Divider(),
              TextFormField(
                key: _emailKey,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|Ư~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value ?? '');
                  if (!emailValid) return 'Email không hợp lệ';
                  return null;
                },
              ),
              TextFormField(
                key: _passwordKey,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  icon: Icon(Icons.security),
                ),
                obscureText: true,
                validator: (value) {
                  if (value.length < 6) return 'Mật khẩu không hợp lệ';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_emailKey.currentState.validate() &&
                          _passwordKey.currentState.validate()) {
                        final _email = _emailKey.currentState.value;
                        final _password = _passwordKey.currentState.value;
                        widget.onLoginPressed(_email, _password);
                      }
                    },
                    child: Text('Đăng nhập'),
                  ),
                  TextButton(
                    onPressed: () => status = EmailCardStatus.reset,
                    child: Text('Quên mật khẩu?'),
                  )
                ],
              )
            ],
          ),
        ),

        // trạng thái khôi phục
        Visibility(
          visible: _status == EmailCardStatus.reset,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Khôi phục mk',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Divider(),
              TextFormField(
                key: _emailKey,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|Ư~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value ?? '');
                  if (!emailValid) return 'Email không hợp lệ';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_emailKey.currentState.validate()) {
                        final _email = _emailKey.currentState.value;
                        widget.onResetPressed(_email);
                      }
                    },
                    child: Text('Khôi phục'),
                  ),
                  RaisedButton(
                    onPressed: () => status = EmailCardStatus.reset,
                    child: Text('Bỏ qua'),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
