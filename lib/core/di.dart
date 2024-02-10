import 'package:binary_app/core/enviroment.dart';
import 'package:binary_app/data/business_repository.dart';
import 'package:binary_app/data/data_sources/api/business_api.dart';
import 'package:binary_app/data/http/dio_builder.dart';
import 'package:binary_app/data/http/dio_factory_interface.dart';
import 'package:binary_app/domain/repositories/business_repository_interface.dart';
import 'package:binary_app/domain/use_cases/get_businesses_by_location_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BaseProvider extends MultiProvider {
  BaseProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          providers: [
            Provider<DioFactoryInterface>.value(value: DioFactory()),
            Provider<Environment>.value(value: Environment()),
          ],
          child: DataSourcesProvider(child: child),
        );
}

class DataSourcesProvider extends MultiProvider {
  DataSourcesProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          providers: [
            Provider<BusinessApi>(
              create: (context) => BusinessApi(
                context.read<DioFactoryInterface>().create(),
                baseUrl: context.read<Environment>().baseUrl,
              ),
            ),
          ],
          child: RepositoriesProvider(child: child),
        );
}

class RepositoriesProvider extends MultiProvider {
  RepositoriesProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          providers: [
            Provider<BusinessRepositoryInterface>(
              create: (context) => BusinessRepository(
                api: context.read<BusinessApi>(),
              ),
            ),
          ],
          child: UseCasesProvider(child: child),
        );
}

class UseCasesProvider extends MultiProvider {
  UseCasesProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          providers: [
            Provider<GetBusinessByLocationUseCase>(
              create: (context) => GetBusinessByLocationUseCase(
                repository: context.read<BusinessRepositoryInterface>(),
              ),
            ),
          ],
          child: child,
        );
}
