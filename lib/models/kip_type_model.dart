import 'package:flutter/material.dart';

class KipType {
  final int id;
  final String name;
  final String icon;

  KipType({this.id, this.name, this.icon});

  getIcon() {
    switch (icon) {
      case 'add':
        return Icons.add;
      case 'password':
        return Icons.visibility_off;
      case 'date':
        return Icons.today;
      case 'file':
        return Icons.insert_drive_file;
    }
  }
}
