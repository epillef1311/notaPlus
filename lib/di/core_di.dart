import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:nota_mais/login/view/login_view.dart';
import 'package:nota_mais/routes/route.dart';
import 'package:nota_mais/utils/lock.dart';
import 'package:nota_mais/utils/navigation/navigations_keys.dart';

export 'package:nota_mais/routes/route.dart';
export 'package:nota_mais/routes/routes.dart';
export 'package:nota_mais/utils/navigation/navigations_keys.dart';

class Di {
  // ignore: use_late_for_private_fields_and_variables
  static final _lock = Lock();
  // ignore: use_late_for_private_fields_and_variables
  static GetIt? _getIt;

  static GetIt get getIt => _getIt!;

  static Future<void> init({
    required GetIt getIt,
    required List<ApiRoute> routes,
    required List<ApiRoute> shellRoutes,
    required Widget Function(Widget child) shellWrapper,
    required String initialLocation,
  }) async =>
      _lock.syncRunOnce(() async {
        _getIt = getIt;
        getIt
          ..registerLazySingleton<NavigationKeys>(NavigationKeys.new)
          ..registerLazySingleton<ApiRouter>(
            () => ApiRouter(
              routes: routes,
              shellRoutes: shellRoutes,
              initialLocation: initialLocation,
              shellWrapper: (child) => LoginView(),
            ),
          );
      });
}
