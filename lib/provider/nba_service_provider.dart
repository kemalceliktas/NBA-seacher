import 'package:flutter/material.dart';
import 'package:nba_flutter_app/service/nba_api_service.dart';

import '../model/nba_data_model.dart';

class NbaServiceProvider extends ChangeNotifier {
  late final NbaApiService nbaApiService;

  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  NbaServiceProvider(this.nbaApiService, String param) {
    fetch(param);
    notifyListeners();
    
  }

  void fetch(String param) async {
    List<Data> dataFirst;
    dataFirst =
        (await nbaApiService.getHttp(param.isEmpty ? "2021" : param))?.data ??
            [];

    resources = dataFirst.map((e) => e).toList();
    notifyListeners();
  }

  void mainFirst() async {
    List<Data> dataFirst;
    dataFirst = (await nbaApiService.getHttp("2021"))?.data ?? [];

    if (dataFirst.isNotEmpty) {
      resources = dataFirst.map((e) => e).toList();
    }
    notifyListeners();
  }
}
