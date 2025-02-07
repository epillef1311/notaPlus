import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nota_mais/l10n/l10n.dart';
import 'package:nota_mais/login/view/login_view.dart';

void main() {
  group('App', () {
    testWidgets('renders LoginView', (tester) async {
      await tester.pumpWidget(
        const WrapperWidget(
          home: LoginView(),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('', (tester) async {
      await tester.pumpWidget(
        const WrapperWidget(
          home: LoginView(),
        ),
      );

      expect(find.byType(Image), findsOneWidget);

      final imageFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/NotaLogo.png',
      );

      expect(imageFinder, findsOneWidget);
    });

    testWidgets('bbbb', (tester) async {
      await tester.pumpWidget(const WrapperWidget(home: LoginView()));

      final decoratedBoxFinder = find.byKey(const Key('decoratedBox-key'));

      expect(decoratedBoxFinder, findsOneWidget);

      final decoratedBox = tester.widget<DecoratedBox>(decoratedBoxFinder);

      final decoration = decoratedBox.decoration as BoxDecoration;
      final image = decoration.image!.image as AssetImage;

      expect(image.assetName, 'assets/images/schoolbc.png');
    });
  });
}

class WrapperWidget extends StatelessWidget {
  const WrapperWidget({
    required this.home,
    super.key,
  });

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );
  }
}
