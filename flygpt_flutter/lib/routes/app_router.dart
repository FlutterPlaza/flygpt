import 'package:auto_route/auto_route.dart';
import 'package:flygpt_flutter/main.dart';
import 'package:flygpt_flutter/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  final AuthGuard authGuard = AuthGuard();

  @override
  RouteType get defaultRouteType =>
      RouteType.material(); //.cupertino, .adaptive

  @override
  List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
        AutoRoute(
          page: SignInRoute.page,
          path: '/sign-in',
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: '/dashboard',
          initial: true,
          guards: [authGuard],
        ),
        AutoRoute(
          page: ChatRoute.page,
          path: '/chat',
          guards: [authGuard],
        ),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (podClient.sessionManager.isSignedIn) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(
        SignInRoute(),
      );
    }
  }
}
