import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../auth_method.dart';

enum EmailCardStatus { login, reset }

class EmailCard extends StatefulWidget {
  final void Function(String email) onResetPressed;
  final void Function(
    String email,
    String password,
  ) onLoginPressed;

  EmailCard({
    Key? key,
    required this.onResetPressed,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  var _status = EmailCardStatus.login;
  set status(value) {
    setState(() {
      _status = value;
    });
  }

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Trang thai dang nhap
        Visibility(
          visible: _status == EmailCardStatus.login,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đăng nhập hệ thống',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.left,
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
                  if (!value!.contains("@")) return 'Email không hợp lệ';
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
                  if (value!.length < 6) return 'Mật khẩu không hợp lệ';
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_emailKey.currentState!.validate() &&
                          _passwordKey.currentState!.validate()) {
                        final _email = _emailKey.currentState!.value;
                        final _password = _passwordKey.currentState!.value;
                        widget.onLoginPressed(_email, _password);
                      }
                    },
                    child: Text('Đăng nhập'),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_emailKey.currentState!.validate() &&
                            _passwordKey.currentState!.validate()) {
                          final _email = _emailKey.currentState!.value;
                          final _password = _passwordKey.currentState!.value;
                          AuthMethod().signUpWithEmail(_email, _password);
                        }
                      },
                      child: Text('Đăng kí')),
                ],
              ),
            ],
          ),
        ),

        Visibility(
          visible: _status == EmailCardStatus.reset,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lấy lại mật khẩu',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
              TextFormField(
                key: _emailKey,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_emailKey.currentState!.validate()) {
                        final _email = _emailKey.currentState!.value;
                        widget.onResetPressed(_email);
                      }
                    },
                    child: Text('Khôi phục'),
                  ),
                  TextButton(
                      onPressed: () => status = EmailCardStatus.login,
                      child: Text('Bỏ qua')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
