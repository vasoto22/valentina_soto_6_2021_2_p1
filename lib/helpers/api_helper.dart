import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:valentina_soto_6_2021_2_p1/Helpers/constans.dart';
import 'package:valentina_soto_6_2021_2_p1/models/data_model.dart';
import 'package:valentina_soto_6_2021_2_p1/models/response.dart';


class api_helper{

    static Future<Response> getCategory(String category) async {
  
    var url = Uri.parse('${constans.apiUrl}${category}');
    var response = await http.get(
      url,
      headers: {
        'content-type' : 'application/json',
        'accept' : 'application/json',
        'Access-Control-Allow-Origin' : '*'
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    List<data_model> list = [];

    var decodedJson = jsonDecode(body);

    if (decodedJson != null) {
      for (var item in decodedJson['data']) {
        list.add(data_model.fromJson(item));
      }
    }

    return Response(isSuccess: true, result: list);
  }
}