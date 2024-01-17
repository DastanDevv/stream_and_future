import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stream_future_exemple/stream_page.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  Future<int> future(int max) async {
    var sum = 0;
    for (int i = 0; i <= max; i++) {
      log('future value:$i');
      await Future.delayed(const Duration(seconds: 1));
      sum += i;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
      ),
      body: Center(
          child: FutureBuilder<int>(
        future: future(10),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('Sum: ${snapshot.data}');
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const StreamPage(),
            ),
          );
        },
      ),
    );
  }
}
