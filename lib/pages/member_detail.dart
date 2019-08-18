import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../test/counter.dart';

class MemberDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<Counter>(
        builder: (context, child, val) {
          String title = val.memberTitle;
          print('title:$title');
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    print("返回上一页");
                    Navigator.pop(context);
                  }
              ),
              title: Text(title),
            ),
            body: Center(
              child: Text(title),
            ),
          );
        }
    );

  }
}
