import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider_apicalling/home_screen.dart';

void main() => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'riverpod future provider',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.amber,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
