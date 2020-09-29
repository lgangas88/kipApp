import 'package:flutter/material.dart';
import 'package:kip_app/pages/shared/components/custom-text-field.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _user;
  String _password;

  onSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomTextField(
            onSaved: (String value) => this._user = value,
            placeholder: 'Usuario',
            validate: (String value) =>
                value.isEmpty ? 'Este campo es requerido' : null,
          ),
          CustomTextField(
            onSaved: (String value) => this._password = value,
            placeholder: 'Contraseña',
            isObscure: true,
            validate: (String value) =>
                value.isEmpty ? 'Este campo es requerido' : null,
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff1C3F5A),
            child: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            onPressed: () => onSubmit(),
          )
        ],
      ),
    );
  }
}
