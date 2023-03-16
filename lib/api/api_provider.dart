import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testapi/models/open_bookings.dart';

class ApiProvider {
  String openBook = 'https://demo.techbizafrica.com/auto_wash/backend/apis.php';
  String token =
      '3b6abd55988090c857afcd08354fcc4c86ffadb6f0c480b12a9c692637a982e4';
  Dio dio = Dio();
  Future<List<OpenBookings>> openBookings() async {
    List<OpenBookings> openBookings = [];
    final response = await dio.get(openBook,
        queryParameters: {'searchPlateNumber': true, 'token': token});
    print('the res is ${response.data}');
    final List bookings = json.decode(response.data);
    openBookings = bookings.map((json) => OpenBookings.fromJson(json)).toList();
    return openBookings;
  }
}
