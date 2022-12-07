import 'package:course_app/components/list/recent_course_list.dart';
import 'package:course_app/constants.dart';
import 'package:course_app/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'components/home_screen_nav.dart';
import 'components/list/explore_course_list.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late AnimationController sidebarAnimationController;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
    sidebarAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: kBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeScreenNavbar(
                    triggerAnimation: () {
                      sidebarAnimationController.forward();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Recents',
                          style: kLargeTitleStyle,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '23 courses, more coming',
                          style: kSubtitleStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  const RecentCourseList(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      left: 20.0,
                      right: 20.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      'Explore',
                      style: kTitle1Style,
                    ),
                  ),
                  const ExploreCourseList(),
                ],
              ),
            ),
          ),
          SlideTransition(
            position: sidebarAnimation,
            child: const SafeArea(
              bottom: false,
              child: SidebarScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
