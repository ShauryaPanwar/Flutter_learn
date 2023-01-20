import 'dart:convert';
import '../models/image_from.dart';
import 'package:http/http.dart' as http;

class Imagerepo{
  Future<List<Pixelfrom>> getnetimg() async {
    var endpint = Uri.parse('http://pixelford.com/api2/imges');
    final response = await http.get(endpint);

    if (response.statusCode == 200) {
      final List<dynamic> decodedlist = jsonDecode(response.body) as List;
      final List<Pixelfrom> _imagelist = decodedlist.map((listitem) {
        return Pixelfrom.fromJson(listitem);
      }).toList();

      print(_imagelist[0].urlFullSize);
      return _imagelist;
    } else {
      throw Exception('API not successful');
    }
  }

}