part of "main.dart";

final _router = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: "account",
          builder: (context, state) => const AccountPage(),
        ),
        GoRoute(
          path: "calender",
          builder: (context, state) => const CalenderPage(),
        ),
      ],
    ),
    GoRoute(
      path: "/registration",
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: "password",
          builder: (context, state) => const LoginPagePassword(),
        ),
      ],
    ),
  ],
);
