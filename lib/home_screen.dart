import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider_apicalling/providers/post_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
        ),
        body: ref.watch(postsProvider).when(
          data: (data) {
            return ListView.builder(
              itemBuilder: (_, index) {
                final singlePost = data[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading:
                        CircleAvatar(child: Text(singlePost.id.toString())),
                    title: Text(singlePost.title.toString()),
                    subtitle: Text(singlePost.body.toString()),
                    trailing: Text(singlePost.userId.toString()),
                  ),
                );
              },
              itemCount: data.length,
            );
          },
          error: (_, __) {
            return Center(
              child: Text('some error occured',
                  style: ThemeData().textTheme.bodySmall),
            );
          },
          loading: () {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: Colors.amber,
                  strokeWidth: 2,
                ),
                const SizedBox(height: 16),
                Text('Loading.....', style: ThemeData().textTheme.bodySmall)
              ],
            ));
          },
        ));
  }
}
