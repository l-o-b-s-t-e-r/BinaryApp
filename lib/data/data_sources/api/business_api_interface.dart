import 'package:binary_app/data/dto/businesses_body_dto.dart';

abstract interface class BusinessApiInterface {
  Future<BusinessesBodyDto> getBusinesses();
}
