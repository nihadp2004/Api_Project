import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;

  const PostCard({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 250,
      child: Card(
        elevation: 3,
        color: Colors.grey[200],
        shadowColor: Colors.black,

        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  body.replaceAll(RegExp(r"\s+"), ""),
                  maxLines:5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
