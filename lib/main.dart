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

void setupSingletons() async {
  locator.registerLazySingleton<GraphQLService>(() => GraphQLService());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return GraphQLProvider(
      client: GraphQLService.initiailizeClient(),
      child: MaterialApp.router(
        title: 'UserApp',
        theme: buildLightTheme(context),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

