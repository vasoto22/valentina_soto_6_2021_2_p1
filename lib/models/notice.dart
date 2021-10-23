import 'package:valentina_soto_6_2021_2_p1/models/data_model.dart';


class notice {
  String category='';
  List<data_model> data=[];
  bool success=false;

  notice({
    required this.category,
    required this.data,
    required this.success
    });

  notice.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
      data.add(new data_model.fromJson(v));
     });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> body = new Map<String, dynamic>();
    body['category'] = this.category;
    body['data'] = this.data.map((v) => v.toJson()).toList();
    body['success'] = this.success;
    return body;
  }
}