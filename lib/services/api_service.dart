import 'dart:convert';

import 'package:api_integration/models/post.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

/*
here api integration
*/

class ApiService {
  static Future<List<Post>> fetchInfo() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        return data.map((postInfo) {
          return Post(title: postInfo['title'], body: postInfo['body']);
        }).toList();
      } else {
        return throw 'failed to fetch data';
      }
    } catch (e) {
      return throw 'sometheing went wrong!';
    }
  }

  static void postInfo(
    context, {
    required String title,
    required String body,
  }) async {
    final url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"title": title, "body": body}),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('post success')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('error occurs')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('sometheing went wrong!')));
    }
  }
}
