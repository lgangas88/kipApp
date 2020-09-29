import 'package:flutter/material.dart';

class ThemeFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const ThemeFlatButton({Key key, @required this.text, @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Theme.of(context).primaryColor;

    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: _primaryColor)),
      onPressed: () => this.callback(),
      splashColor: _primaryColor,
      child: Text(
        this.text,
        style: TextStyle(color: _primaryColor),
      ),
    );
  }
}
