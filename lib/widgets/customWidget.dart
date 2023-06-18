// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banao_flutter_tasks/screens/programsViewAllScreen.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  const CustomWidget({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 160,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFF598BED),
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(iconPath),
            Text(
              "  $title",
              style: TextStyle(
                  color: Color(0xFF598BED),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
