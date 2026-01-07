import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/dashboard/presentation/main_navigation.dart';
// DIQQAT: .dart.dart ems, .dart bo'lishi kerak
import '../../features/home/presentation/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// _shellNavigatorKey shart emas, chunki StatefulShellRoute o'zi boshqaradi

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigation(navigationShell: navigationShell);
        },
        branches: [
          // 1. Asosiy (Home)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // 2. Buyurtma
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/orders',
                builder: (context, state) =>
                    const Center(child: Text("Buyurtmalar sahifasi")),
              ),
            ],
          ),
          // 3. Taomnoma
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/menu',
                builder: (context, state) =>
                    const Center(child: Text("Taomnoma sahifasi")),
              ),
            ],
          ),
          // 4. Davomat
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/attendance',
                builder: (context, state) =>
                    const Center(child: Text("Davomat sahifasi")),
              ),
            ],
          ),
          // 5. Savat
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cart',
                builder: (context, state) =>
                    const Center(child: Text("Savat sahifasi")),
              ),
            ],
          ),
          // 6. Profil
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) =>
                    const Center(child: Text("Profil sahifasi")),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
