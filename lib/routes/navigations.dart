import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pak_endo/config/app_config.dart';
import 'package:pak_endo/constants/consts.dart';
import 'package:pak_endo/model/event_model.dart';
import 'package:pak_endo/views/pages/HomePage.dart';
import 'package:pak_endo/views/pages/agenda_detail.dart';
import 'package:pak_endo/views/pages/details_page.dart';
import 'package:pak_endo/views/pages/event_list.dart';
import 'package:pak_endo/views/pages/timeline.dart';
import 'package:pak_endo/views/pages/video_player.dart';
import 'package:pak_endo/views/widgets/feedback_form.dart';

import '../views/pages/auth_pages/forget_password.dart';
import '../views/pages/auth_pages/login.dart';
import '../views/pages/auth_pages/signup.dart';
import '../views/pages/landing.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PageRoutes {
  static const String forgetPassword = '/forgetpassword';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String login = '/';
  static const String listEvents = '/listevents';
  static const String detailPage = '/detailPage';
  static const String feedbackForm = '/feedbackform';
  static const String landing = '/landing';
  static const String youtubeVideo = '/youtubeVideo';
  static const String timeline = '/timeline';
  static const String agendaDetail = '/agendaDetail';
}

class PageNavigator extends StatelessWidget {
  const PageNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute:
            AppConfig().isSignedIn ? PageRoutes.landing : PageRoutes.login,
        onGenerateInitialRoutes: (route, initialRoute) {
          FlutterNativeSplash.remove();
          if (initialRoute == PageRoutes.login) {
            return [MaterialPageRoute(builder: (_) => Login())];
          } else {
            return [MaterialPageRoute(builder: (_) => const Landing())];
          }
        },
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case PageRoutes.landing:
              builder = (context) => const Landing();
              break;
            case PageRoutes.forgetPassword:
              builder = (context) => ForgetPassword();
              break;
            case PageRoutes.signup:
              builder = (context) => const Register();
              break;
            case PageRoutes.home:
              builder = (context) => const HomePage();
              break;
            case PageRoutes.listEvents:
              builder = (context) =>
                  ListEvents(status: settings.arguments as EventStatus);
              break;
            case PageRoutes.detailPage:
              builder = (context) =>
                  DetailPage(event: settings.arguments as EventModel);
              break;
            case PageRoutes.timeline:
              builder =
                  (context) => TimeLineBar(settings.arguments as EventModel);
              break;
            case PageRoutes.agendaDetail:
              builder = (context) => AgendaDetail(settings.arguments as Agenda);
              break;
            case PageRoutes.feedbackForm:
              builder = (context) => const FeedbackForm();
              break;
            case PageRoutes.youtubeVideo:
              builder = (context) =>
                  YouTubePlayerPage(videoUrl: settings.arguments as String);
              break;

            default:
              builder = (_) =>
                  settings.name == PageRoutes.login ? Login() : const Landing();
              break;
          }

          debugPrint('Opening Route: ${settings.name}');
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
