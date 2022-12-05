import 'package:flutter/material.dart';

import '../../model/course.dart';
import '../cards/recent_course_card.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({super.key});

  @override
  State<RecentCourseList> createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  var currentPage = 0;

  Widget updateContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map(
        (course) {
          var index = recentCourses.indexOf(course);
          return Container(
            height: 7.0,
            width: 7.0,
            margin: const EdgeInsets.symmetric(
              horizontal: 6.0,
            ),
            decoration: BoxDecoration(
              color: index == currentPage
                  ? const Color(0xFF0971FE)
                  : const Color(0xFFA6AEBD),
              shape: BoxShape.circle,
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: ((context, index) {
              return Opacity(
                opacity: currentPage == index ? 1 : 0.5,
                child: RecentCourseCard(course: recentCourses[index]),
              );
            }),
            itemCount: recentCourses.length,
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.7,
            ),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            clipBehavior: Clip.antiAlias,
          ),
        ),
        updateContainer()
      ],
    );
  }
}
