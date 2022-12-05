import 'package:course_app/components/search_field_widget.dart';
import 'package:course_app/components/searchbar_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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
