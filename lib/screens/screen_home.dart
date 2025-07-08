
import 'package:api_integration/models/post.dart';
import 'package:api_integration/screens/screen_detail.dart';
import 'package:api_integration/screens/screen_post.dart';
import 'package:api_integration/services/api_service.dart';
import 'package:flutter/material.dart';



/*
this is home screen 
*/
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blueGrey),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenPost()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: FutureBuilder<List<Post>>(
        future: ApiService.fetchInfo(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Post postInfo = snapshot.data![index];
                return ListTile(
                  splashColor: Colors.amberAccent,
                  leading: Icon(Icons.person),
                  title: Text(postInfo.title, maxLines: 1),
                  subtitle: Text(postInfo.body, maxLines: 1),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenDetail(
                          title: postInfo.title,
                          body: postInfo.body,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: Text('here empty'));
          }
        },
      ),
    );
  }
}
