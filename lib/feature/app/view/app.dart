import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mobx/enum/app_languages.dart';
import 'package:flutter_boilerplate_mobx/feature/app/app_store.dart';
import 'package:flutter_boilerplate_mobx/generated/l10n.dart';
import 'package:flutter_boilerplate_mobx/router/router.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_themes.dart';
import 'package:flutter_boilerplate_mobx/utils/locale_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            // Hide keyboard
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MultiProvider(
          providers: [
            Provider<AppStore>(create: (_) => AppStore()),
          ],
          child: Observer(
            builder: (BuildContext context) {
              // TODO: Get the last selected language using AppStore
              final Locale locale =
                  getAppLocale(appLanguage: AppLanguage.en);
              return MaterialApp.router(
                // TODO: Get the last selected theme using AppStore
                color: appThemes[0]?.primaryColor,
                debugShowCheckedModeBanner: false,
                theme: appThemes[0],
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
                routerDelegate: router.routerDelegate,
                routeInformationParser: router.routeInformationParser,
                routeInformationProvider: router.routeInformationProvider,
              );
            },
          ),
        ));
  }
}
