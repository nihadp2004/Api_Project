
import 'package:api_integration/widgets/post_card.dart';
import 'package:flutter/material.dart';




/*
this is details screen 
*/
class ScreenDetail extends StatelessWidget {
  final String title;
  final String body;
  const ScreenDetail({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: PostCard(title: title, body: body),
      ),
    );
  }
}
