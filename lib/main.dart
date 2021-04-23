import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:furniture_app/service/product_service.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/localization/localization_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/app_provider.dart';
import 'core/init/theme/light_theme.dart';
import 'view/main/app_main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ProductDatabaseProvider.instance?.initDb();
  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance!.dependItems,
      ],
      child: EasyLocalization(
          supportedLocales: LocalizationManager.instance!.supportedLocales,
          path: ApplicationConstants.LANGUAGES_ASSET_PATH,
          fallbackLocale: Locale('en', 'US'),
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      theme: LightTheme.instance.themeData,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: AppMainView(),
    );
  }
}
