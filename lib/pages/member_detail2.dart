import 'package:flutter/material.dart';
import 'dart:convert';


class MemberDetail2 extends StatelessWidget {
  final String title;
  MemberDetail2(this.title);

  @override
  Widget build(BuildContext context) {
    var list = List<int>();
    jsonDecode(title).forEach(list.add);
    print('list---:$list');
    final String value = Utf8Decoder().convert(list);

    return Scaffold(
      appBar: AppBar(
        title: Text('我的订单'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
