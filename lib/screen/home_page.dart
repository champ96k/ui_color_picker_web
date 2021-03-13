import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:ui_color_picker_web/services/api_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: APIServices().getColors(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> _colorsModel = snapshot.data;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 1200
                      ? 4
                      : size.width > 800 && size.width < 1200
                          ? 3
                          : 2,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                  childAspectRatio: 16 / 9,
                ),
                itemCount: _colorsModel.length,
                itemBuilder: (BuildContext context, int index) {
                  String color = _colorsModel[index]['hex']
                      .toString()
                      .replaceAll("#", "0xff");
                  return InkWell(
                    onHover: (isHovering) {
                      setState(() {
                        if (isHovering) {
                          selectedIndex = index;
                        }
                      });
                    },
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: "${_colorsModel[index]['hex']}"));
                      Toast.show("${_colorsModel[index]['hex']} Color Copied!",
                          context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(selectedIndex == index ? 4 : 6),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${_colorsModel[index]['hex']}",
                          style: TextStyle(
                            color: _colorsModel[index]['name']
                                    .toString()
                                    .contains("White")
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: selectedIndex == index
                                ? Colors.yellow
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(int.parse(color)),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
