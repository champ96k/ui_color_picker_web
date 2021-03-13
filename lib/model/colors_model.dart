class ColorsModel {
  String hex;
  String name;
  String rgb;

  ColorsModel({this.hex, this.name, this.rgb});

  ColorsModel.fromJson(Map<String, dynamic> json) {
    hex = json['hex'];
    name = json['name'];
    rgb = json['rgb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hex'] = this.hex;
    data['name'] = this.name;
    data['rgb'] = this.rgb;
    return data;
  }
}