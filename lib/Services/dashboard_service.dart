import 'dart:convert';
import 'package:aks_dashboard/Models/dashboard_model.dart';
import 'package:aks_dashboard/Services/api_collection.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  Future<DashboardModel> getDashboard() async {
    final header = {
      'auth_key': 'AKSHAYAKALPA_APP_KEY',
    };
    final body = {
      'user_id': '198314',
      'vendor_id': '7',
      'region_id': '1',
    };

    final response = await http.post(
        Uri.parse(ApiUrl.baseurl + ApiUrl.endPoint),
        headers: header,
        body: body);
    if (response.statusCode == 200) {
      String data = response.body;
      return DashboardModel.fromJson(json.decode(data));
    } else {
      throw Exception('Failed to get dashboard data');
    }
  }
}
