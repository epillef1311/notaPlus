import 'package:flutter_test/flutter_test.dart';
import 'package:nota_mais/app/app.dart';
import 'package:nota_mais/login/view/login_view.dart';

void main() {
  group('App', () {
    testWidgets('renders LoginView', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
