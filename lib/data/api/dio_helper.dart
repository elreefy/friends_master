// import 'package:dio/dio.dart';
//
// class DioHelper {
//   static late Dio dio;
//   static init() {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       connectTimeout: 20 * 1000,
//       receiveTimeout: 20 * 1000,
//       receiveDataWhenStatusError: true,
//     );
//     dio = Dio(options);
//   }
//
//   static Future<List<dynamic>> getData(
//       {required Map<String, dynamic> query}) async {
//     try {
//       Response response =
//           await dio.get('v2/top-headlines', queryParameters: query);
//       return response.data['articles'];
//     } catch (e) {
//       print(e.toString());
//       return [];
//     }
//   }
// }
