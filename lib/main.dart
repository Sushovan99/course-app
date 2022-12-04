import 'package:course_app/components/cards/recent_course_card.dart';
import 'package:course_app/constants.dart';
import 'package:course_app/model/course.dart';
import 'package:flutter/material.dart';

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
                const RecentCourseList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({super.key});

  @override
  State<RecentCourseList> createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  var currentPage = 0;

  Widget UpdateContainer() {
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
              viewportFraction: 0.68,
            ),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            clipBehavior: Clip.antiAlias,
          ),
        ),
        UpdateContainer()
      ],
    );
  }
}

class HomeScreenNavbar extends StatelessWidget {
  const HomeScreenNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SidebarButton(),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
            size: 18.0,
          ),
          SizedBox(width: 16.0),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 20.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: const [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: TextField(
              style: kSearchTextStyle,
              cursorColor: kPrimaryLabelColor,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: "Search for courses",
              ),
              onChanged: (inputText) {
                print(inputText);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('Sidebar button pressed');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
                color: kShadowColor, offset: Offset(0, 12.0), blurRadius: 16.0),
          ],
        ),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
