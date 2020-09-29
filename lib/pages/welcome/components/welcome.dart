import 'package:flutter/material.dart';
import 'package:kip_app/pages/shared/components/theme-flat-button.dart';
import 'package:kip_app/pages/shared/components/theme-raised-button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset('assets/images/paper-notes.png'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Apunta lo que quieras ;)', style: TextStyle(color: Color(0xff19527D)),),
              ),
              SizedBox(
                width: double.infinity,
                child: ThemeRaisedButton(
                  text: 'Iniciar Sesión',
                  callback: () => Navigator.pushNamed(context, '/login'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ThemeFlatButton(
                    text: 'Regístrate',
                    callback: () => {print('adios manito')}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
