import 'package:flutter/material.dart';

class ThemeRaisedButton extends StatelessWidget {
  final String text;

  final VoidCallback callback;

  const ThemeRaisedButton(
      {Key key, @required this.text, @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Theme.of(context).primaryColor;

    return RaisedButton(
      onPressed: () => this.callback(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: _primaryColor,
      splashColor: Colors.white,
      child: Text(this.text, style: TextStyle(color: Colors.white)),
    );
  }
}
