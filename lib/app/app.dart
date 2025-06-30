import 'package:personal_portfolio/ui/views/home/home_view.dart';
import 'package:personal_portfolio/ui/views/projects/projects_view.dart';
import 'package:personal_portfolio/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    CustomRoute(page: HomeView, initial: true, path: Routes.home),
    CustomRoute(page: ProjectsView, path: Routes.projectsView),
    CustomRoute(page: UnknownView, path: Routes.unknownView),
    RedirectRoute(path: '*', redirectTo: Routes.unknownView),
  ],
  dependencies: [
    LazySingleton(classType: RouterService),
    LazySingleton(classType: NavigationService),
  ],
)
class App {}

class Routes {
  static const String home = '/';
  static const String unknownView = '/404';
  static const String projectsView = '/projects';
}
