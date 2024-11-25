import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;


  SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16,
              color: Colors.white, fontWeight: FontWeight.bold),),
          Icon(Icons.more_outlined, color: Colors.white)
        ],
      ),
    );
  }
}