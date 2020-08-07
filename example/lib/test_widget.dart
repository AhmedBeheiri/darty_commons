import 'package:darty_commons/dart_commons.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<int> intList = [10, 11, 16, 20];
    print(intList);
    intList.replace(9, 3);
    print(intList);
    intList.addOrReplace(16);
    print(intList);
    intList.addOrReplace(20);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test app'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          300.delay(
              onCompleted: () {
                'test snack'.showSnackBar(context);
              },
              milliseconds: true);

          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                  ),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () => _controller.text.dial(),
                    child: Text('Call Number'),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                  ),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () =>
                        _emailController.text.email('ahmedbeheirii.com', subject: 'Hello'),
                    child: Text('Send an Email'),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: RaisedButton(
                    onPressed: () => _emailController.text.sendWhatsAppMessage(),
                    child: Text('Send a What App Message'),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: RaisedButton(
                    onPressed: () => _emailController.text.share(subject: 'look guys'),
                    child: Text('Share Text'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
