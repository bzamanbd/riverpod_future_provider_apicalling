import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:riverpod_future_provider_apicalling/models/post_model.dart';
import 'package:http/http.dart' as http;

class HttpGetService {
  static const _baseUrl = "https://jsonplaceholder.typicode.com";
  static const _endPoint = "/posts";
  Future<List<PostModel>> getAllPost() async {
    List<PostModel> allPosts = [];
    try {
      Uri url = Uri.parse("$_baseUrl$_endPoint");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        for (var e in result) {
          PostModel post = PostModel.fromMap(e);
          allPosts.add(post);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return allPosts;
    }
    return allPosts;
  }
}
