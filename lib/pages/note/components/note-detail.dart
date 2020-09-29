import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  final Color backgroundColor;
  final int index;

  const NoteDetail(
      {Key key, @required this.backgroundColor, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        tag: 'note-detail-$index',
        child: Material(
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
