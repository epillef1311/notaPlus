import 'package:nota_mais/login/view/login_view.dart';
import 'package:nota_mais/routes/route.dart';

List<ApiRoute> shellRoutes = [];

List<ApiRoute> routes = [
  ApiRoute(
    path: LoginView.route,
    builder: (state) => LoginView(
      key: state.pageKey,
    ),
  ),
];
