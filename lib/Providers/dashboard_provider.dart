import 'package:aks_dashboard/Models/dashboard_model.dart';
import 'package:flutter/material.dart';

import '../Services/dashboard_service.dart';

class DashboardProvider extends ChangeNotifier {
  final _service = DashboardService();
  bool isLoading = false;
  DashboardModel? _dashboardModel;
  DashboardModel? get dashboardData => _dashboardModel;

  Future<DashboardModel> getDashboardDetails() async {
    // isLoading = true;
    // notifyListeners();

    final response = await _service.getDashboard();
return response;
    // _dashboardModel = response;
    // isLoading = false;
    // notifyListeners();
  }
}
