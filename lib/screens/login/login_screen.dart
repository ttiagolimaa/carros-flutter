import 'package:carros/models/api_response.dart';
import 'package:carros/models/user.dart';
import 'package:flutter/material.dart';

import 'package:carros/screens/carro/home_screen.dart';
import 'package:carros/widgets/app_button.dart';
import 'login_api.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _tLogin = TextEditingController(text: 'user');
  final _tSenha = TextEditingController(text: '123');
  final _formKey = GlobalKey<FormState>();
  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(height: 10),
              TextFormField(
                controller: _tLogin,
                style: TextStyle(color: Colors.blue, fontSize: 25),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_focusSenha),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Digite o login';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Login',
                  hintText: 'Digite o login',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _tSenha,
                style: TextStyle(color: Colors.blue, fontSize: 25),
                keyboardType: TextInputType.number,
                focusNode: _focusSenha,
                validator: (value) {
                  if (value != null && value.isEmpty) return 'Digite o senha';

                  if (value != null && value.length < 3)
                    return 'Minimo 3 caracteres';

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Senha',
                  hintText: 'Digite a senha',
                ),
              ),
              SizedBox(height: 20),
              AppButton(
                text: 'Login',
                showProgress: _showProgress,
                onPressed: () async {
                  bool isvalid = _formKey.currentState?.validate() ?? false;

                  if (isvalid) {
                    setState(() {
                      _showProgress = true;
                    });
                    ApiResponse response =
                        await LoginApi.login(_tLogin.text, _tSenha.text);
                    setState(() {
                      _showProgress = false;
                    });
                    if (response.ok) {
                      User user = response.result;
                      print('User>>>> ${user.toJson()}');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text(response.msg ?? ''),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
