import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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

class Genre {
  final String name;
  final String imageUrl;
  final Color color;

  const Genre({this.name, this.imageUrl, this.color});
}

class MyHomePage extends StatelessWidget {
  static const _genres = <Genre>[
    Genre(
      name: 'Rock',
      imageUrl:
          'https://i.ibb.co/7Vw03W1/hector-bermudez-i-IWDt0f-Xa84-unsplash-1.jpg',
      color: Color(0xFFB71C1C),
    ),
    Genre(
      name: 'Hip Hop',
      imageUrl:
          'https://i.ibb.co/12mrYms/joel-muniz-RLH-Wmlnj2k-unsplash-2.jpg',
      color: Color(0xFF3949AB),
    ),
    Genre(
      name: 'Pop',
      imageUrl:
          'https://i.ibb.co/bN3051y/thomas-le-f-B4-Zo2j-PA3-E-unsplash-3.jpg',
      color: Color(0xFF880E4F),
    ),
    Genre(
      name: 'Dance',
      imageUrl:
          'https://i.ibb.co/6WWhjB9/sarthak-navjivan-i-TZOPe7-Bp-TM-unsplash-6.jpg',
      color: Color(0xFF004D40),
    ),
    Genre(
      name: 'Classical',
      imageUrl:
          'https://i.ibb.co/c6f1XCR/manuel-nageli-Nsgs-Qj-HA1m-M-unsplash-5.jpg',
      color: Color(0xFFFFB300),
    ),
    Genre(
      name: 'Retro',
      imageUrl:
          'https://i.ibb.co/Y2fyYSF/mink-mingle-HRyj-ETL87-Gg-unsplash-4.jpg',
      color: Colors.blue,
    ),
    Genre(
      name: 'Chill',
      imageUrl:
          'https://i.ibb.co/V3MQJMs/jorge-salvador-m4-Kj-Tcz-Stxw-unsplash-8.jpg',
      color: Color(0xFF00ACC1),
    ),
    Genre(
      name: 'Jazz',
      imageUrl:
          'https://i.ibb.co/88tss5D/chris-bair-A10y2-Eq7-OHY-unsplash-7.jpg',
      color: Color(0xFF827717),
    ),
    Genre(
      name: 'Punk',
      imageUrl:
          'https://i.ibb.co/k21LkPN/priscilla-du-preez-Ym-Xc-SCAVu-O0-unsplash-9.jpg',
      color: Colors.deepOrange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tileSize = MediaQuery.of(context).size / 3;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Wrap(
        children: [
          for (var genre in _genres)
            Tile(
              key: Key(genre.name),
              imageUrl: genre.imageUrl,
              color: genre.color,
              title: genre.name,
              size: tileSize,
            ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final Size size;
  final Color color;
  final String imageUrl;
  final String title;

  Tile({
    Key key,
    this.size,
    this.color,
    this.imageUrl,
    this.title,
  }) : super(key: key);

  Offset _getRelativeToCenterOffset(Offset offset, Size boxSize) {
    final halfWidth = boxSize.width / 2;
    final halfHeight = boxSize.height / 2;

    final centeredOffset = offset - Offset(halfWidth, halfHeight);

    final xCoef = halfWidth / centeredOffset.dx;
    final yCoef = halfHeight / centeredOffset.dy;

    final result = Offset(
      xCoef == 0.0 ? 0.0 : 100.0 / xCoef,
      yCoef == 0.0 ? 0.0 : 100.0 / yCoef,
    );

    return result / 100.0;
  }

  @override
  Widget build(BuildContext context) {
    bool isHovering = false;
    Offset pointerOffset = Offset.zero;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) {
            pointerOffset = Offset.zero;
            isHovering = false;
            setState(() {});
          },
          onHover: (event) {
            // There is a bug in the beta channel: event.localPosition
            // is a global position. So we have to calculate it manually
            final renderBox = (context.findRenderObject() as RenderBox);
            final offset = renderBox.globalToLocal(event.position);
            pointerOffset = _getRelativeToCenterOffset(offset, size);
            setState(() {});
          },
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  imageUrl,
                  alignment:
                      Alignment(pointerOffset.dx, pointerOffset.dy) * 0.2,
                  color: isHovering ? color : null,
                  colorBlendMode: BlendMode.multiply,
                  fit: BoxFit.none,
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  alignment:
                      Alignment(pointerOffset.dx, pointerOffset.dy) * 0.3,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// 여기까지는 공통 코드

// 여기서부터 수정합니다.
/* class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 */
enum Gender { MAN, WOMEN }
/*
class _MyHomePageState extends State<MyHomePage> {
  var _text = 'noel\'s ';
  var isChecked = false;
  var isCheck = false;
  Gender _gender = Gender.MAN;

  final items = List.generate(100, (i) => i).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_text + 'Checkbox / Radio / Switch'),
      ),
      body: PageView(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Radio는 라디오 영역만 터치 영역으로 인식
              ListTile(
                  title: Text('남자'),
                  leading: Radio(
                      value: Gender.MAN,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      })),
              ListTile(
                  title: Text('여자'),
                  leading: Radio(
                      value: Gender.WOMEN,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      })),
              SizedBox(height: 40),
              RadioListTile(
                title: Text('남자'),
                value: Gender.MAN,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              RadioListTile(
                title: Text('여자'),
                value: Gender.WOMEN,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              Switch(
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value;
                  });
                },
              )
            ]),
        Center(
            child: TextField(
                decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '여기에 입력하세요',
        ))),
        CircleAvatar(
          child: Icon(Icons.person),
        ),
        Icon(
          Icons.home,
          color: Colors.red,
          size: 60.0, // 기본 값 24.0
        ),
        CircularProgressIndicator(),
        LinearProgressIndicator(),
        Center(child: Image.asset("assets/lion.png")),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0, // 그림자 깊이
            child: RaisedButton(
              child: Text('Hello world2',
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
        GridView.count(crossAxisCount: 2, // 열��
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
 */
