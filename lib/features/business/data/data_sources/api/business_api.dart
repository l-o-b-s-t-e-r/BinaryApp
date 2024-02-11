import 'package:binary_app/features/business/data/dtos/businesses_body_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'business_api.g.dart';

@RestApi()
abstract class BusinessApi {
  factory BusinessApi(Dio dio, {String baseUrl}) = _BusinessApi;

  @GET('/v1/businesses')
  Future<BusinessesBodyDto> getBusinesses(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('includes') String includes,
    @Query('filters') String filters,
  );
}
