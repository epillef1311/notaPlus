import 'package:nota_mais/login/view/login_view.dart';
import 'package:nota_mais/login/view/register_view.dart';
import 'package:nota_mais/login/view/test_view.dart';
import 'package:nota_mais/routes/route.dart';

List<ApiRoute> shellRoutes = [
  ApiRoute(
    path: TestView.route,
    builder: (state) => TestView(
      key: state.pageKey,
    ),
  ),
];

List<ApiRoute> routes = [
  ApiRoute(
    path: LoginView.route,
    builder: (state) => LoginView(),
  ),
  ApiRoute(
    path: RegisterView.route,
    builder: (state) => const RegisterView(),
  ),
];
