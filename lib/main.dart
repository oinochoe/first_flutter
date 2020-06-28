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

  final items = List.generate(100, (i) => i).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_text + '`s world'),
      ),
      body: PageView(children: <Widget>[
        Column(children: <Widget>[
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
            color: Colors.blue,
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
          )
        ]),
        Row(
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
        Stack(children: <Widget>[
          Container(
              color: Colors.red, // 빨강
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0)),
          Container(
              color: Colors.green, // 초록
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0)),
          Container(
              color: Colors.blue, // 파랑
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0)),
        ]),
        ListView(scrollDirection: Axis.vertical, children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Event'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {})
        ]),
        SingleChildScrollView(
          child: ListBody(
            children: items.map((i) => Text('$i')).toList(),
          ),
        ),
        GridView.count(crossAxisCount: 2, // 열수
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
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0))
            ]),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        )
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
