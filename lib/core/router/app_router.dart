import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentations/screens/login_screen.dart';
import '../../features/auth/presentations/screens/signup_screen.dart';
import '../../features/auth/presentations/screens/avatar_picker_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/pyq/presentation/screens/pyq_screen.dart';
import '../../features/pyq/presentation/screens/question_detail_screen.dart';
import '../../features/spotting/presentation/screens/spotting_grid_screen.dart';
import '../../features/premium/presentation/screens/premium_screen.dart';
import '../../features/bookmarks/presentation/screens/bookmarks_screen.dart';
import '../../features/premium/presentation/screens/settings_screen.dart';

part 'app_router.g.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  // TODO: Implement auth state listener when auth provider is ready
  // final authState = ref.watch(authProviders);
  
  return GoRouter(
    initialLocation: '/onboarding',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // TODO: Add authentication checks
      // If user is not logged in, redirect to login
      // If user has not completed onboarding, redirect to onboarding
      return null;
    },
    routes: $appRoutes,
  );
});

@TypedGoRoute<OnboardingRoute>(
  path: '/onboarding',
)
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: OnboardingScreen());
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return LoginScreen
    return const MaterialPage(child: LoginScreen
}

@TypedGoRoute<SignupRoute>(
  path: '/signup',
)
class SignupRoute extends GoRouteData {
  const SignupRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return SignupScreen
    return const MaterialPage(child: SignupScreen
}

@TypedGoRoute<AvatarPickerRoute>(
  path: '/avatar-picker',
)
class AvatarPickerRoute extends GoRouteData {
  const AvatarPickerRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return AvatarPickerScreen
    return const MaterialPage(child: SizedBox.shrink());
  }return const MaterialPage(child: AvatarPickerScreen

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return HomeScreen
    return const MaterialPage(child: SizedBox.shrink());
  }return const MaterialPage(child: HomeScreen

@TypedGoRoute<PYQRoute>(
  path: '/pyq/:subjectId',
)
class PYQRoute extends GoRouteData {
  final String subjectId;

  const PYQRoute({required this.subjectId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return PyqScreen
    return const MaterialPage(child: SizedBox.shrink());
  }
}return MaterialPage(child: PYQScreen(subjectId: subjectId
@TypedGoRoute<QuestionDetailRoute>(
  path: '/question/:questionId',
)
class QuestionDetailRoute extends GoRouteData {
  final String questionId;

  const QuestionDetailRoute({required this.questionId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return QuestionDetailScreen
    return const MaterialPage(child: SizedBox.shrink());
  }
}return MaterialPage(child: QuestionDetailScreen(questionId: questionId
@TypedGoRoute<SpottingRoute>(
  path: '/spotting/:subjectId',
)
class SpottingRoute extends GoRouteData {
  final String subjectId;

  const SpottingRoute({required this.subjectId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return SpottingGridScreen
    return const MaterialPage(child: SizedBox.shrink());
  }
}
return MaterialPage(child: SpottingGridScreen(subjectId: subjectId
  path: '/premium',
)
class PremiumRoute extends GoRouteData {
  const PremiumRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return PremiumScreen
    return const MaterialPage(child: SizedBox.shrink());
  }
}
return const MaterialPage(child: PremiumScreen
  path: '/bookmarks',
)
class BookmarksRoute extends GoRouteData {
  const BookmarksRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return BookmarksScreen
    return const MaterialPage(child: SizedBox.shrink());
  }
}

@Typreturn const MaterialPage(child: BookmarksScreen
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    // TODO: Import and return SettingsScreen
    return const MaterialPage(child: SizedBox.shrink());
  }
}

extereturn const MaterialPage(child: SettingsScreenter.of(this).push<T>(route.location);
  void pushReplacement<T extends GoRouteData>(T route) =>
      GoRouter.of(this).pushReplacement<T>(route.location);
  void go<T extends GoRouteData>(T route) => GoRouter.of(this).go<T>(route.location);
}
