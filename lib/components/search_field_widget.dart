import 'package:flutter/material.dart';

import '../constants.dart';

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
