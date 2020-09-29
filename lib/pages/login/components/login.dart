import 'package:flutter/material.dart';
import 'package:kip_app/pages/login/components/login-form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Theme.of(context).primaryColor;
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: _primaryColor,
            ),
            ClipPath(
              clipper: TopLeftClipper(),
              child: Container(
                color: Color(0xff236292),
                height: _height * 0.36,
                width: _width * 0.5,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipPath(
                clipper: BottomRightClipper(),
                child: Container(
                  color: Color(0xffD8EEFF),
                  height: _height * 0.4,
                  width: _width * 0.5,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'KIP',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'PermanentMarker',
                        fontSize: 34),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  LoginForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.33, size.height * 0.75,
        size.width * 0.28, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.4,
        size.width * 0.55, size.height * 0.32);
    path.quadraticBezierTo(size.width, size.height * 0.2, size.width * 0.7, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.75,
        size.width * 0.4, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.12, size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
