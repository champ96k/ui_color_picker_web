class GradientsModel {
  String name;
  List<String> colors;

  GradientsModel({this.name, this.colors});

  GradientsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['colors'] = this.colors;
    return data;
  }
}
