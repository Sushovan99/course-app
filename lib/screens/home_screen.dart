import 'package:flutter/material.dart';

import '../components/home_screen_nav.dart';
import '../components/list/explore_course_list.dart';
import '../components/list/recent_course_list.dart';
import '../constants.dart';
import 'continue_watching_screen.dart';
import 'sidebar_screen.dart';

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
  late Animation<double> fadeAnimation;
  var sidebarHidden = true;

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

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      });
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
          const ContinueWatchingScreen(),
          IgnorePointer(
            ignoring: sidebarHidden,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      });
                      sidebarAnimationController.reverse();
                    },
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
          ),
        ],
      ),
    );
  }
}
