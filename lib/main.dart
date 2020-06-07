import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '플러터 데모인가',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
// 여기까지는 공통 코드

// 여기서부터 수정합니다.
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _text = 'noel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_text + '`s world'),
      ),
      body: Row(
          mainAxisSize: MainAxisSize.max, // 가로로 꽉 채우기
          mainAxisAlignment: MainAxisAlignment.center, // 가로 방향 가운데 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 세로 방향 가운데 정렬
          children: <Widget>[
            Container(
                color: Colors.red,
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0)),
            Container(
                color: Colors.green,
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0)),
            Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0)),
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _text = 'World';
            });
          },
          child: Icon(Icons.touch_app)),
    );
  }
}
