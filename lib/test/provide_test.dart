import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'counter.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  providers
    ..provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestProviderView(),
    );
  }
}

class TestProviderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton()
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Provide<Counter>(
        builder: (context, child, counter){
          return Container(
            child: Column(
              children: <Widget>[
                // 两种取值方法
                Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${Provide.value<Counter>(context).value}',
                  style: Theme.of(context).textTheme.display1,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增'),
      ),
    );
  }
}




