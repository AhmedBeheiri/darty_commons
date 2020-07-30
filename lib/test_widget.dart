import 'package:flutter/material.dart';

import 'dart_commons.dart';

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test app'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          300.delay(
              onCompleted: () {
                'test snack'.ShowSnackBar(context);
              },
              milliseconds: true);

          return Container();
        },
      ),
    );
  }
}
