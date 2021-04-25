import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:needzaio_test/routes/router.gr.dart';
import 'package:needzaio_test/service/graphql_service.dart';
import 'package:needzaio_test/theme.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

void main() {
  setupSingletons();
  runApp(MyApp());
}
/// Configuration of the global services ussed by the app
void setupSingletons() async {
  locator.registerLazySingleton<GraphQLService>(() => GraphQLService());
}


class MyApp extends StatelessWidget {
  /// Custom router generated bu auto-route
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    //All the app is inside the GraphQL provider for optimization purposes.
    return GraphQLProvider(
      client: GraphQLService.initiailizeClient(),
      child: MaterialApp.router(
        title: 'UserApp',
        // Using the custom theme defined in theme.dart
        theme: buildLightTheme(context),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

