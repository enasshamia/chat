


import 'package:chat_app/models/register_requset.dart';
import 'package:chat_app/provider/chatProvider.dart';
import 'package:chat_app/provider/providerauth.dart';
import 'package:chat_app/provider/routehelper.dart';
import 'package:chat_app/ui/edit_user.dart';
import 'package:chat_app/ui/homepage.dart';
import 'package:chat_app/ui/loginpage.dart';
import 'package:chat_app/ui/register.dart';
import 'package:chat_app/ui/splash.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider<ChatProvider>(create: (context) => ChatProvider())
    ],
    child: GetMaterialApp(
 theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor:  Color.fromRGBO(245, 90, 0, 1))),
      navigatorKey: RouteHelper.routeHelper.navigationKey,
        routes: {
        HomePage.routeName: (context) => HomePage(),
       EditProfile.routename: (context) => EditProfile(),
       RegisterPage.routename :(context) =>RegisterPage(),
       LogINPage.routename: (context)=>LogINPage()
      },
      home: App())));
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
body: Center(child:Text("error")),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return SplashScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
body: Center(child:Text("Loasding")),
          );
      },
    );
  }
}