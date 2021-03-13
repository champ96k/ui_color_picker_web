import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui_color_picker_web/constants/constants.dart';

class APIServices {
  Future<dynamic> getGradients() async {
    try {
      final response = await http.get(Constants.gradientsColors);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getColors() async {
    try {
      final response = await http.get(Constants.colors);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> simpleColor() async {
    try {
      final response = await http.get(
        Constants.colors,
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
