import 'package:project_1/models/response_user.dart';

import '../api/main.dart';

class ActivityService {
  static ActivityService? _instance;
  factory ActivityService() => _instance ??= ActivityService._();
  ActivityService._();

  Future<ResponseUser> leave(Map<String, dynamic> data) async {
    final response = await Api().dio.post("/users", data: data);
    final clockIn = ResponseUser.fromJson(response.data);
    return clockIn;
  }
}
