
import 'package:api_integration/services/api_service.dart';
import 'package:flutter/material.dart';


/*
this is post screen 
*/
class ScreenPost extends StatelessWidget {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController bodyCtrl = TextEditingController();

  ScreenPost({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(
                hintText: 'Enter title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bodyCtrl,
              decoration: InputDecoration(
                hintText: 'Enter body',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
              ),

              onPressed: () {
                final String title = titleCtrl.text;
                final String body = bodyCtrl.text;
                ApiService.postInfo(context, title: title, body: body);

                titleCtrl.clear();
                bodyCtrl.clear();
              },
              child: Text(
                'Submit Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
