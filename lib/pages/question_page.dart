import 'package:flutter/material.dart';
import '../domain/Idle_list_vo.dart';
import '../domain/Idle_vo.dart';
import '../ui/select_button.dart';
import '../ui/select_name.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  IdleList _idleList = new IdleList();

  Idle _selectName;

  Idle _name1;
  Idle _name2;

  bool _where;

  bool overlayShouldBevisible = false;
  @override
  void initState() {
    super.initState();
    _name1 = _idleList.nextIdle;
    _name2 = _idleList.nextIdle;
  }

  void handleSelect(Idle name, bool where) {
    _selectName = name;
    _where = where;
    this.setState(() {
      overlayShouldBevisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new SelectButton(true, _name1, () => handleSelect(_name1, true)),
            new SelectButton(false, _name2, () => handleSelect(_name2, false)),
          ],
        ),
        overlayShouldBevisible == true
            ? new SelectName(_selectName, _idleList.isEnd, () {
                if (_idleList.isEnd == false) {
                  this.setState(() {
                    overlayShouldBevisible = false;
                    if (_where == true) {
                      _name1 = _selectName;
                      _name2 = _idleList.nextIdle;
                    } else {
                      _name2 = _selectName;
                      _name1 = _idleList.nextIdle;
                    }
                  });
                  return;
                }
              })
            : new Container(),
      ],
    );
  }
}
