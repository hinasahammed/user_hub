import 'package:user_hub/data/network/network_api_service.dart';
import 'package:user_hub/res/appUrl/app_url.dart';

class HomeRepository {
  final api = NetworkApiService();
  Future fetchUser() async {
    final response = await api.getApi(AppUrl.fetchUser);
    return response;
  }
}
