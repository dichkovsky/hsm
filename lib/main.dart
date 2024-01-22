import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/app_bootstrap.dart';
import 'package:hsm/src/app_bootstrap_appwrite.dart';
import 'package:hsm/src/app_bootstrap_fakes.dart';
import 'package:hsm/src/app_bootstrap_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // turn off the # in the URLs on the web
  usePathUrlStrategy();

  // ensure URL changes in the address bar when using push / pushNamed
  // more info here: https://docs.google.com/document/d/1VCuB85D5kYxPR3qYOjVmw8boAGKb7k62heFyfFHTOvw/edit
  GoRouter.optionURLReflectsImperativeAPIs = true;
  
  final appBootstrap = getBootstrap(BootstrapType.firebase);

  // create a container configured with all the AppWrite repositories
  final container = await appBootstrap.initContainer();
  
  // use the container above to create the root widget
  final root = appBootstrap.createRootWidget(container: container);

  // start the app
  runApp(root);

  Animate.restartOnHotReload = true;
}

enum BootstrapType {
  appwrite,
  firebase,
  fake
}

AppBootstrap getBootstrap(BootstrapType type) {
  switch (type) {
    case BootstrapType.appwrite:
      return AppBootstrapAppwrite();
    case BootstrapType.firebase:
      return AppBootstrapFirebase();
    default:
      return AppBootstrapFakes();
  }
}
