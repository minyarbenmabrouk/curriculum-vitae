//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:benmabrouk_minyar/pages/contact_page.dart';
import 'package:benmabrouk_minyar/pages/experience_page.dart';
import 'package:benmabrouk_minyar/pages/home_page.dart';
import 'package:benmabrouk_minyar/pages/portfelio_page.dart';
import 'package:benmabrouk_minyar/pages/team_page.dart';
import 'package:benmabrouk_minyar/utils/AppColors.dart';
import 'package:benmabrouk_minyar/utils/AppIcons.dart';

import 'widgets/navigation_menu_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
          splashIconSize: 200,
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.rotationTransition,
          splash: const CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage("assets/avtar1.png"),
          ),
          nextScreen: MyHomePage(),

// we can use
          duration: 5000,
//5000= 5 Second

//control the duration of the image , we can use
          animationDuration: const Duration(seconds: 3)),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedMenuIndex = 0;
  //final databaseRef = FirebaseDatabase.instance.reference().child("Portfolio");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: backgroundLight,
        body: Container(
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      //child: Image.asset("assets/avtar1.png"),
                    ),
                    NavigationMenu(navHome,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 0, onClick: () {
                      _tabController.animateTo(0);
                    }),
                    NavigationMenu(navPortfolio,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 2, onClick: () {
                      _tabController.animateTo(2);
                    }),
                    NavigationMenu(navGroup,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 3, onClick: () {
                      _tabController.animateTo(3);
                    }),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      HomePage(),
                      ExperiencePage(),
                      PortfelioPage(),
                      TeamPage(),
                      ContactPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
