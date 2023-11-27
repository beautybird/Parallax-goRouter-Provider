import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myandroidapp/src/lang/locale_provider.dart';
import 'package:myandroidapp/src/parallax/card_provider.dart';
import 'package:myandroidapp/src/products/products_search_provider.dart';
import 'package:myandroidapp/src/providers/customs/search_result_provider.dart';
import 'package:myandroidapp/src/routing_conf/routings.dart';
import 'package:myandroidapp/src/security/verify_user.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'settings/settings_controller.dart';


/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    this.settingsController,
  });

  final SettingsController? settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController!,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<LocaleProvider>(
              create: (context) => LocaleProvider(),
            ),
            ChangeNotifierProvider<SearchResultProvider>(
              create: (context) => SearchResultProvider(),
            ),
            ChangeNotifierProvider<VerifyUserProvider>(
              create: (context) => VerifyUserProvider(),
            ),
            ChangeNotifierProvider<CardProvider>(
              create:(context)=> CardProvider(),
            ),
            ChangeNotifierProvider<ProductsSearchProvider>(
              create:(context)=> ProductsSearchProvider(),
            ),
          ],
          /*builder: (context,child){

          },*/
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // Wrapping the app with a builder method makes breakpoints
            // accessible throughout the widget tree.
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            /*onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,*/

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(useMaterial3: true),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController!.themeMode,
            //Using GoRouter
            //routeInformationParser: AppRouting().routes.routeInformationParser,
            //routerDelegate: AppRouting().routes.routerDelegate,
            //routeInformationProvider: AppRouting().routes.routeInformationProvider,
            routerConfig: goRouter,
          ),
        );
      },
    );
  }
}
