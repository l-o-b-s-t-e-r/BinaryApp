import 'package:binary_app/core/enviroment.dart';
import 'package:binary_app/core/http/http_client_factory.dart';
import 'package:binary_app/core/http/http_client_factory_interface.dart';
import 'package:binary_app/features/business/data/data_sources/api/business_api.dart';
import 'package:binary_app/features/business/data/repositories/business_repository.dart';
import 'package:binary_app/features/business/domain/repositories/business_repository_interface.dart';
import 'package:binary_app/features/business/domain/use_cases/get_businesses_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BaseProvider extends MultiProvider {
  BaseProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          providers: [
            Provider<HttpClientFactoryInterface>.value(
                value: HttpClientFactory()),
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
                context.read<HttpClientFactoryInterface>().create(),
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
            Provider<GetBusinessUseCase>(
              create: (context) => GetBusinessUseCase(
                repository: context.read<BusinessRepositoryInterface>(),
              ),
            ),
          ],
          child: child,
        );
}
