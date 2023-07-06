import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider_apicalling/api_services/http_get_service.dart';
import 'package:riverpod_future_provider_apicalling/models/post_model.dart';

final postsProvider =
    FutureProvider<List<PostModel>>((ref) => HttpGetService().getAllPost());
