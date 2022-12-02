import 'package:course_app/model/sidebar.dart';
import 'package:flutter/material.dart';

class SidebarRow extends StatelessWidget {
  const SidebarRow({super.key, required this.item});
  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            gradient: item.gradient,
          ),
          child: item.icon,
        ),
        const SizedBox(width: 12.0),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF242629),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
