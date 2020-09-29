import 'package:flutter/material.dart';
import 'package:kip_app/utils/AppColors.dart';

class KipTemplate {
  String name;
  IconData icon;
  String route;

  KipTemplate({this.name, this.icon, this.route});

  goTo(BuildContext context) {
    return Navigator.of(context).pushNamed('/register-kip', arguments: {'type': route});
  }
}

final kipTemplateList = [
  KipTemplate(name: 'Blank', icon: Icons.add, route: 'blank'),
  KipTemplate(name: 'Password', icon: Icons.visibility_off, route: 'password'),
  KipTemplate(name: 'Date', icon: Icons.today, route: 'date'),
  KipTemplate(name: 'File', icon: Icons.insert_drive_file, route: 'file'),
];

class AddKip extends StatelessWidget {
  const AddKip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.blue1,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  children: kipTemplateList.map((t) {
                    return InkWell(
                      onTap: () => t.goTo(context),
                      child: Container(
                          height: 104,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(16.0),
                            ),
                            border: Border.all(color: Colors.white),
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                t.icon,
                                color: Colors.white,
                                size: 48.0,
                              ),
                              Text(
                                t.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    );
                  }).toList(),
                  crossAxisCount: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
