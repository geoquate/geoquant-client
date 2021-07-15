import 'package:geoquate/api/firestore_api.dart';
import 'package:geoquate/services/environment_service.dart';
import 'package:geoquate/services/event_service.dart';
import 'package:geoquate/services/user_service.dart';
import 'package:geoquate/ui/create_account/create_account_view.dart';
import 'package:geoquate/ui/home/home_view.dart';
import 'package:geoquate/ui/login/login_view.dart';
import 'package:geoquate/ui/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: GeoQuateService),
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: EnvironmentService),
    Singleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
