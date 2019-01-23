import 'package:flutter/material.dart';
import 'dart:math';
import '../domain/Idle_vo.dart';
import '../pages/landing_page.dart';

class SelectName extends StatefulWidget {
  final Idle _name;
  final VoidCallback _onTap;
  final bool _last;

  SelectName(this._name, this._last, this._onTap);

  @override
  _SelectNameState createState() => _SelectNameState();
}

class _SelectNameState extends State<SelectName>
    with SingleTickerProviderStateMixin {
  Animation<double> _ani;
  AnimationController _aniC;

  @override
  void initState() {
    super.initState();

    _aniC = new AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );
    _ani = new CurvedAnimation(parent: _aniC, curve: Curves.elasticOut);
    _ani.addListener(() => this.setState(() => {}));
    _aniC.forward();
  }

  @override
  void dispose() {
    _aniC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._last == false) {
      return Material(
        color: Colors.black54,
        child: new InkWell(
          onTap: () => widget._onTap(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: new Transform.rotate(
                    angle: _aniC.value * 2 * pi,
                    child: new Icon(
                      Icons.done,
                      size: _aniC.value * 80.0,
                    ),
                  )),
              new Padding(
                padding: new EdgeInsets.only(bottom: 20.0),
              ),
              new Text(
                widget._name.name,
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return new Material(
        color: Colors.red,
        child: new Transform.scale(
          scale: _aniC.value * 1.5,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "우승",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              new Text(
                widget._name.name,
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              new IconButton(
                icon: new Icon(Icons.arrow_right),
                color: Colors.white,
                iconSize: 50.0,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LandingPage()),
                    (Route route) => route == null),
              ),
            ],
          ),
        ),
      );
    }
  }
}
