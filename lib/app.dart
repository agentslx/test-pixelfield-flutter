import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pixelfield_flutter/bloc_manager.dart';
import 'package:test_pixelfield_flutter/routes.dart';

import 'config/color_styles.dart';
import 'config/text_styles.dart';
import 'flavors.dart';
import 'generated/locale_keys.g.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        useOnlyLangCode: true,
        saveLocale: true,
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: Builder(builder: (context) {
          return BlocManager(
            child: MaterialApp.router(
              title: LocaleKeys.app_title,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: AppColors.colorSchemeDark,
                textTheme: AppTextStyles.textTheme,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: AppColors.colorSchemeDark,
                textTheme: AppTextStyles.textTheme,
              ),
              themeMode: ThemeMode.dark,
              // TODO Load config light/dark mode
              routerConfig: Routes.router,
            ),
          );
        }));
  }
}
