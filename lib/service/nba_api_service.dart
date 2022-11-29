import 'package:dio/dio.dart';
import 'package:nba_flutter_app/model/nba_data_model.dart';

class NbaApiService {
  List<Data> lastData = [];
  Future<Nba?> getHttp(String time) async {
    var response = await Dio()
        .get('https://www.balldontlie.io/api/v1/games/?seasons[]=$time');
    final jsonBody = response.data;

    if (jsonBody is Map<String, dynamic>) {
      return Nba.fromJson(jsonBody);
    }
    return jsonBody;
  }
}
