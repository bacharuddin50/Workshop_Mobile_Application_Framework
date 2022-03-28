import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar = [
    "flamebringer.jpg",
    "gnosis.jpg",
    "hellagur.jpg",
    "lee.jpg",
    "mountain.jpg",
    "passenger.jpg",
    "phantom.jpg",
    "silverash.jpg"
  ];

  static const Map<String, Color> colors = {
    'flamebringer': Color(0xFF2DB569),
    'gnosis': Color(0xFFF386B8),
    'hellagur': Color(0xFF45CAF5),
    'lee': Color(0xFFB19ECB),
    'mountain': Color(0xFFF58E4C),
    'passenger': Color(0xFF46C1BE),
    'phantom': Color(0xFFFFEA0E),
    'silverash': Color(0xFFDBE4E9),
  };

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              Colors.white,
              Colors.purpleAccent,
              Colors.deepPurple
            ])),
        child: new PageView.builder(
            controller: new PageController(viewportFraction: 0.8),
            itemCount: gambar.length,
            itemBuilder: (BuildContext context, int i) {
              return new Padding(
                  padding:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
                  child: new Material(
                    elevation: 8.0,
                    child: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        new Hero(
                          tag: gambar[i],
                          child: new Material(
                            child: new InkWell(
                              child: new Flexible(
                                flex: 1,
                                child: Container(
                                  color: colors.values.elementAt(i),
                                  child: new Image.asset(
                                    "img/${gambar[i]}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Halamandua(
                                            gambar: gambar[i],
                                            colors: colors.values.elementAt(i),
                                          ))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}

class Halamandua extends StatelessWidget {
  Halamandua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BT21"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              gradient: new RadialGradient(
                  center: Alignment.center,
                  colors: [Colors.purple, Colors.white, Colors.deepPurple]),
            ),
          ),
          new Center(
            child: new Hero(
                tag: gambar,
                child: new ClipOval(
                    child: new SizedBox(
                        width: 200.0,
                        height: 200.0,
                        child: new Material(
                          child: new InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: new Flexible(
                              flex: 1,
                              child: Container(
                                color: colors,
                                child: new Image.asset(
                                  "img/$gambar",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )))),
          )
        ],
      ),
    );
  }
}
