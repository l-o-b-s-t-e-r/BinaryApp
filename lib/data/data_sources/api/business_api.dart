import 'package:binary_app/data/data_sources/api/business_api_interface.dart';
import 'package:binary_app/data/dto/businesses_body_dto.dart';
import 'package:binary_app/data/http/http_client_interface.dart';

class BusinessApi implements BusinessApiInterface {
  BusinessApi({required this.client});

  final HttpClientInterface client;

  @override
  Future<BusinessesBodyDto> getBusinesses() {
    return client.get<BusinessesBodyDto>();
  }
}
