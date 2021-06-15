import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            TextFormField(
              controller: _tLogin,
              style: TextStyle(color: Colors.blue, fontSize: 25),
              decoration: InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                  hintText: 'Digite o login',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
            TextFormField(
              controller: _tSenha,
              style: TextStyle(color: Colors.blue, fontSize: 25),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
                hintText: 'Digite a senha',
                hintStyle: TextStyle(fontSize: 16),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Container(
              height: 46,
              child: ElevatedButton(
                  onPressed: () {
                    print(_tLogin.text);
                    print(_tSenha.text);
                    _tLogin.text = 'Flutter';
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 22),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
