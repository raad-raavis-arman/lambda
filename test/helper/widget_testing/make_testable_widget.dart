import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landa/l10n/l10n.dart';

class MakeTestableWidget extends StatelessWidget {
  const MakeTestableWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('fa'), Locale('en')],
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'title',
      home: Scaffold(
        body: child,
      ),
    );
  }
}
