import 'dart:ui';

import 'package:course_app/components/list/recent_course_list.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'components/home_screen_nav.dart';
import 'model/course.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: kBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeScreenNavbar(),
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
      ),
    );
  }
}

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: ExploreCourseCard(course: exploreCourses[index]),
          );
        },
      ),
    );
  }
}

class ExploreCourseCard extends StatelessWidget {
  const ExploreCourseCard({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(
            gradient: course.background,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        course.courseSubtitle,
                        style: kCardSubtitleStyle,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        course.courseTitle,
                        style: kCardTitleStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${course.illustration}',
                      fit: BoxFit.cover,
                      height: 100.0,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
