import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkSampleRoute extends StatelessWidget {
  static final String networkSampleRoute = '网络获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(networkSampleRoute),
      ),
      body: Center(
        child: FutureBuilder(
          future:_fetchPost(),
          builder: _futureBuilder,
        ),
      ),
    );
  }

  Future<Post> _fetchPost() async{
    final response = await http.get(
        'https://jsonplaceholder.typicode.com/posts/1',
        headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
    final responseJson = json.decode(response.body);
    return Post.fromJson(responseJson);
  }

  Widget _futureBuilder<T>(BuildContext context, AsyncSnapshot<T> snapshot){
      if(snapshot.hasData){
        Post postData = snapshot.data as Post;
        return Text(postData.title);
      }else if(snapshot.hasError){
        return Text("${snapshot.error}");
      }

      return CircularProgressIndicator();
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

