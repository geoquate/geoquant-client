import 'package:geoquate/app/app.locator.dart';
import 'package:geoquate/app/app.logger.dart';
import 'package:geoquate/app/app.router.dart';
import 'package:geoquate/services/environment_service.dart';
import 'package:geoquate/services/user_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _environmentService = locator<EnvironmentService>();

  Future<void> runStartupLogic() async {
    await _environmentService.initialise();

    await Permission.locationWhenInUse.request();
    PermissionStatus status = await Permission.locationWhenInUse.status;

    /// The user denied access to the requested feature.
    // denied,

    // /// The user granted access to the requested feature.
    // granted,

    // /// The OS denied access to the requested feature. The user cannot change
    // /// this app's status, possibly due to active restrictions such as parental
    // /// controls being in place.
    // /// *Only supported on iOS.*
    // restricted,

    // ///User has authorized this application for limited access.
    // /// *Only supported on iOS (iOS14+).*
    // limited,

    // /// Permission to the requested feature is permanently denied, the permission
    // /// dialog will not be shown when requesting this permission. The user may
    // /// still change the permission status in the settings.
    // permanentlyDenied,
    switch (status) {
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.limited:
        log.v('will neeed to do something to let user know they have denied');
        _navigationService.replaceWith(Routes.loginView);
        break;
      case PermissionStatus.granted:
      default:
        if (_userService.hasLoggedInUser) {
          log.v('We have a user session on disk. Sync the user profile ...');
          await _userService.syncUserAccount();

          final currentUser = _userService.currentUser;
          log.v('User sync complete. User profile: $currentUser');

          log.v('We have a default address. Let\'s show them products!');
          _navigationService.replaceWith(Routes.homeView);
        } else {
          log.v('No user on disk, navigate to the LoginView');
          _navigationService.replaceWith(Routes.loginView);
        }
        break;
    }

    // if (status.isDenied) {
    //   // We didn't ask for permission yet or the permission has been denied before but not permanently.
    // }

// You can can also directly ask the permission about its status.
    // if (await Permission.location.isRestricted) {
    //   // The OS restricts access, for example because of parental controls.
    // }

    // if (await Permission.location.request().isGranted) {
    //   // Either the permission was already granted before or the user just granted it.
    //   log.v("got it");
    // } else {
    //   log.v("nope");
    // }
  }
}
