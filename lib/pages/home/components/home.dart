import 'package:flutter/material.dart';
import 'package:kip_app/pages/note/components/note-detail.dart';
import 'package:kip_app/utils/AppColors.dart';

const categoryList = ['Todo', 'Contraseñas', 'Anotaciones', 'Links'];

const colorList = [0xffEFAAC1, 0xffE0C8F8, 0xffB7C4E8];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _snackBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff236292),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pushNamed('/add-kip'),
      ),
      backgroundColor: AppColors.skyBlue1,
      key: _snackBarKey,
      body: CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(_width),
          _sliverCategoryList(),
          _sliverNoteList(),
        ],
      ),
    );
  }

  _sliverNoteList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        var colorListLength = colorList.length;
        var colorIndex = index % colorListLength;
        var prevColorIndex =
            colorIndex == 0 ? colorListLength - 1 : colorIndex - 1;

        return CurvedListItem(
          index: index,
          title: 'Yoga and Meditation for Beginners',
          time: 'TODAY 5:30 PM',
          color: Color(colorList[colorIndex]),
          prevColor: Color(index == 0 ? 0xffD8EEFF : colorList[prevColorIndex]),
        );
      }, childCount: 3),
    );
  }

  _sliverAppBar(double width) {
    List<Map<String, dynamic>> options = [
      {
        'value': 0,
        'text': 'Cerrar sesión',
        'function': () {
          Navigator.pushReplacementNamed(context, '/welcome');
        }
      }
    ];

    return SliverAppBar(
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          itemBuilder: (context) => options.map((o) {
            return PopupMenuItem(
              child: Text(o['text']),
              value: o['value'],
            );
          }).toList(),
          onSelected: (_) {
            var option = options.firstWhere((o) => o['value'] == _);
            option['function']();
          },
        )
      ],
      leading: Container(),
      flexibleSpace: FlexibleSpaceBar(
        background: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            color: Color(0xff236292),
          ),
        ),
      ),
      backgroundColor: AppColors.skyBlue1,
      expandedHeight: width * 0.33,
    );
  }

  _sliverCategoryList() {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                backgroundColor: AppColors.skyBlue2,
                shadowColor: Colors.black,
                label: Text(
                  '${categoryList[index]}',
                  style: TextStyle(
                      color: AppColors.blue1, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    this.index,
    this.title,
    this.time,
    this.icon,
    this.people,
    this.color,
    this.prevColor,
  });

  final int index;
  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Color color;
  final Color prevColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 0.95,
      child: Material(
        color: prevColor,
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteDetail(
                        backgroundColor: color,
                        index: index,
                      ))),
          child: Hero(
            tag: 'note-detail-$index',
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(80.0),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 32,
                top: 40.0,
                bottom: 25,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      time,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.68,
        size.width * 0.45, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.94, size.height * 0.85, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
