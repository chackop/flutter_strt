import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Travel cost app Demo',
      home: new TravelForm(),
    );
  }
}

class TravelForm extends StatefulWidget {
  @override
  createState() => _TravelState();
}

class _TravelState extends State<TravelForm> {
  String result = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds', 'Rupees'];
  final double _formPadding = 5.0;
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: _formPadding, bottom: _formPadding),
                  child: TextField(
                    controller: distanceController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "e.g. 124",
                        labelText: "Distance",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: _formPadding, top: _formPadding),
                  child: TextField(
                    controller: avgController,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "e.g. 17",
                        labelText: "Distance per Unit",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: _formPadding, top: _formPadding),
                  child: Row(children: [
                    Expanded(
                        child: TextField(
                      controller: priceController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "e.g. 1.60",
                          labelText: "Fuel Cost",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                    Container(width: _formPadding * 5),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currency,
                        style: textStyle,
                        onChanged: (value) {
                          _onDropdownChanged(value);
                        },
                      ),
                    )
                  ])),
              Container(
                height: _formPadding,
              ),
              Row(children: [
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    setState(() {
                      result = _calculate();
                    });
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  ),
                )),
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    _reset();
                  },
                  child: Text(
                    'Reset',
                    textScaleFactor: 1.5,
                  ),
                )),
              ]),
              Container(
                  margin: EdgeInsets.only(top: _formPadding * 2),
                  child: Text(
                    result,
                    style: textStyle,
                  )),
            ],
          ),
        ));
  }

  _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void _reset() {
    distanceController.text = '';
    priceController.text = '';
    avgController.text = '';
    setState(() {
      result = '';
    });
  }
}

class HelloUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloUser> {
  String name = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds', 'Rupees'];
  var _currency = 'Dollars';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Please input text'),
                onChanged: (String string) {
                  setState(() {
                    name = string;
                  });
                },
              ),
              DropdownButton<String>(
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _currency,
                onChanged: (String value) {
                  _onDropdownChanged(value);
                },
              ),
              Text('Hello ' + name + ' !')
            ],
          ),
        ));
  }

  _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
