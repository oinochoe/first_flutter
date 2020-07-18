import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        /* home: DefaultTabController(
        // scaffold감싸고
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('타이틀이다'),
            bottom: TabBar(
              // Scaffold의 bottom 프로퍼티에 TabBar 지정
              tabs: <Widget>[
                // tabs 프로퍼티에 Tab의 리스트 지정
                Tab(icon: Icon(Icons.tag_faces), text: '메뉴1'),
                Tab(icon: Icon(Icons.home), text: '메뉴2'),
                Tab(icon: Icon(Icons.info), text: '메뉴3'),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
            )
          ]),
          body: TabBarView(
              // Scaffold의 body 프로퍼티에는 TabBarView 배치
              children: <Widget>[
                // children 프로퍼티에 표시할 화면 배치
                Container(color: Colors.green),
                Container(color: Colors.blue),
                Container(color: Colors.yellow)
              ]),
        ),
      ),
     */
        home: MyHomePage());
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
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0, // 그림자 깊이
            child: RaisedButton(
              child: Text(
                'Hello world',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    letterSpacing: 4.0)),
                color: Colors.orange, // 색상
                onPressed: () {
                  // 실행될 코드 작성
                },
              ),
            ),
          ),
        ),
        Center(
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.red, // 아이콘 색상
            iconSize: 100.0, // 기본값 24.0
            onPressed: () {},
          ),
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
        SizedBox(
            width: 100,
            height: 100,
            child: FlatButton(
              child: Text('FlatButton'),
              onPressed: () {},
            )),
        Column(children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.blue,
          ))
        ]),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.red,
              width: 300,
              height: 350,
            )),
        Center(child: Container(color: Colors.red, width: 100, height: 100)),
        Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Container(color: Colors.red, width: 100, height: 100)),
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
