import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:ui_color_picker_web/services/api_services.dart';

class GradientsPage extends StatefulWidget {
  @override
  _GradientsPageState createState() => _GradientsPageState();
}

class _GradientsPageState extends State<GradientsPage> {
  Future<void> _showMyDialog(colorsList) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Close"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Click to copy color'),
              ],
            ),
          ),
          actions: <Widget>[
            for (var i = 0; i < colorsList.length; i++)
              TextButton(
                child: Text(colorsList[i].toString()),
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: colorsList[i].toString()));
                  Toast.show(
                      "${colorsList[i].toString()} Color Copied!", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                },
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: APIServices().getGradients(),
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
                  List<Color> _list = [];
                  for (int i = 0;
                      i < _colorsModel[index]['colors'].length;
                      i++) {
                    _list.add(
                      Color(
                        int.parse(
                          _colorsModel[index]['colors'][i].toString(),
                        ),
                      ),
                    );
                    //_list[] = _colorsModel[index]['colors'][i];
                  }
                  return InkWell(
                    onHover: (isHovering) {
                      setState(() {
                        if (isHovering) {
                          selectedIndex = index;
                        }
                      });
                    },
                    onTap: () {
                      _showMyDialog(_list);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(selectedIndex == index ? 4 : 6),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${_colorsModel[index]['name']}",
                          style: TextStyle(
                            color: _colorsModel[index]['name']
                                    .toString()
                                    .contains("White")
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 2.0,
                            color: selectedIndex == index
                                ? Colors.yellow
                                : Colors.transparent,
                          ),
                          gradient: LinearGradient(
                            colors: _list,
                          ),
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
