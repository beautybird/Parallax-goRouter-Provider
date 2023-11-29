import 'package:myandroidapp/src/parallax/cards.dart';
import 'package:myandroidapp/src/products/makeup_page.dart';
import 'package:myandroidapp/src/products/skincare_page.dart';
import 'package:myandroidapp/src/products/supplement_page.dart';
import 'package:myandroidapp/src/routes/contactus.dart';
import 'package:myandroidapp/src/routes/forgot_password.dart';
import 'package:myandroidapp/src/routes/login.dart';
import 'package:myandroidapp/src/routes/noproducts_page.dart';
import 'package:myandroidapp/src/routes/shareapp.dart';
import 'package:myandroidapp/src/routes/signup.dart';
import 'package:myandroidapp/src/routes/splash.dart';
import 'package:myandroidapp/src/routing_conf/nestedNAvigator.dart';
import 'package:myandroidapp/src/settings/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorLoginKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorRegisterKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorContactKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellE');

final goRouter = GoRouter(
  initialLocation: '/',
  //errorBuilder: (BuildContext context, GoRouterState state) => Home(),
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => NoTransitionPage(
        child: SplashPage(label: 'splash', detailsPath: '/cardsRoute'),
      ),
      routes: [
        GoRoute(
          path: 'cardsRoute',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const Cards(label: 'cards'),
        ),
      ],
    ),
    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
                path: '/a',
                pageBuilder: (context, state) => NoTransitionPage(
                      child: Cards(),
                    ),
                routes: [
                  GoRoute(
                    path: 'firstRoute',
                    parentNavigatorKey: _shellNavigatorHomeKey,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: SupplementScreen(
                          label: 'first',
                          detailsPath: '/a/firstRoute'),
                    ),
                    routes: [
                      GoRoute(
                        path: 'firstRoute',
                        parentNavigatorKey: _shellNavigatorHomeKey,
                        builder: (context, state) =>
                            const SupplementPage(label: 'first'),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'secondRoute',
                    parentNavigatorKey: _shellNavigatorHomeKey,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: SkincareScreen(
                        label: 'second',
                        detailsPath: '/a/secondRoute',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'secondRoute',
                        parentNavigatorKey: _shellNavigatorHomeKey,
                        builder: (context, state) =>
                            const SkincarePage(label: 'second'),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'makeupRoute',
                    parentNavigatorKey: _shellNavigatorHomeKey,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: MakeupScreen(
                          label: 'makeupRoute', detailsPath: '/a/makeupRoute'),
                    ),
                    routes: [
                      GoRoute(
                        path: 'makeupRoute',
                        parentNavigatorKey: _shellNavigatorHomeKey,
                        builder: (context, state) =>
                            const MakeupPage(label: 'makeup'),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'noProductsRoute',
                    parentNavigatorKey: _shellNavigatorHomeKey,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: NoProductsScreen(
                          label: 'noProducts',
                          detailsPath: '/a/noProductsRoute'),
                    ),
                    routes: [
                      GoRoute(
                        path: 'noProductsRoute',
                        parentNavigatorKey: _shellNavigatorHomeKey,
                        builder: (context, state) =>
                            const NoProductsPage(label: 'noProducts'),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorLoginKey,
          routes: [
            //
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LoginRootScreen(
                    label: 'B', detailsPath: '/b/forgotPasswordPage'),
              ),
              routes: [
                GoRoute(
                  path: 'forgotPasswordPage',
                  builder: (context, state) => ForgotPasswordPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRegisterKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RegisterRootScreen(
                    label: 'C', detailsPath: '/c/signupRoute'),
              ),
              routes: [
                GoRoute(
                  path: 'signupRoute',
                  builder: (context, state) => SignUpPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorContactKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/d',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ContactsRootScreen(
                    label: 'D', detailsPath: '/d/contactusRoute'),
              ),
              routes: [
                GoRoute(
                  path: 'contactusRoute',
                  builder: (context, state) => Contactus(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/e',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsRootScreen(
                    label: 'E', detailsPath: '/e/shareappPage'),
              ),
              routes: [
                GoRoute(
                  path: 'shareappPage',
                  builder: (context, state) => ShareApp(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Login', icon: Icon(Icons.login)),
          NavigationDestination(
              label: 'Register', icon: Icon(Icons.app_registration)),
          NavigationDestination(label: 'Contact', icon: Icon(Icons.contacts)),
          NavigationDestination(label: 'Settings', icon: Icon(Icons.settings)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  label: Text('Home'), icon: Icon(Icons.home)),
              NavigationRailDestination(
                label: Text('Login'),
                icon: Icon(Icons.login),
              ),
              NavigationRailDestination(
                label: Text('Register'),
                icon: Icon(Icons.app_registration),
              ),
              NavigationRailDestination(
                label: Text('Contact'),
                icon: Icon(Icons.contacts),
              ),
              NavigationRailDestination(
                label: Text('Settings'),
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class LoginRootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const LoginRootScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Login(),
          ),
          Positioned(
            left: width * 0.3,
            width: width * 0.4,
            top: height * 0.7,
            height: height * 0.1,
            child: TextButton(
              child: Text(
                'generalUse-forgotPassword'.tr().toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.right,
              ),
              onPressed: () => context.go(detailsPath!),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class RegisterRootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RegisterRootScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SignUpPage(),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class ContactsRootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const ContactsRootScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Contactus(),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class SettingsRootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const SettingsRootScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SettingsView(),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.4,
            width: 80.0,
            top: MediaQuery.of(context).size.height * 0.5,
            height: 70.0,
            child: //Share App
                Container(
              constraints: BoxConstraints(
                minWidth: 80.0,
                maxWidth: 80.0,
                minHeight: 70.0,
                maxHeight: 70.0,
              ),
              child: Card(
                color: Colors.green.shade300,
                shadowColor: Colors.grey,
                surfaceTintColor: Colors.blue,
                elevation: 15.0,
                shape: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10.0),
                    left: Radius.circular(10.0),
                  ),
                ),
                borderOnForeground: true,
                margin: const EdgeInsets.only(
                  left: 10.0,
                ),
                clipBehavior: Clip.hardEdge,
                semanticContainer: true,
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  iconSize: 25.0,
                  onPressed: () => context.go(detailsPath!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class SupplementScreen extends StatelessWidget {
  /// Creates a RootScreen
  const SupplementScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SupplementPage(),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class SkincareScreen extends StatelessWidget {
  /// Creates a RootScreen
  const SkincareScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SkincarePage(),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class MakeupScreen extends StatelessWidget {
  /// Creates a RootScreen
  const MakeupScreen({required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: MakeupPage(),
          ),
        ],
      ),
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class NoProductsScreen extends StatelessWidget {
  /// Creates a RootScreen
  const NoProductsScreen(
      {required this.label, required this.detailsPath, Key? key})
      : super(key: key);

  /// The label
  final String? label;

  /// The path to the detail page
  final String? detailsPath;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.sizeOf(context).width;
    double? height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: NoProductsPage(),
          ),
        ],
      ),
    );
  }
}
