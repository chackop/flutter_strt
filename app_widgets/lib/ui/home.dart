import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: Alignment.center,
      color: Colors.blueAccent,
      padding: EdgeInsets.only(top: 30.0, left: 10.0),
      child: 
      Column(children: <Widget>[
                Row(children: <Widget>[
                Expanded(child: 
                Text("Seafood", 
                textDirection: TextDirection.ltr, 
                style: TextStyle(
                  fontSize: 30.0, 
                  decoration: TextDecoration.none, 
                  fontFamily: 'Roboto', 
                  fontWeight: FontWeight.normal
                )
                ),
                ),
                Expanded(child: 
                Text("Kappa, Meen", 
                textDirection: TextDirection.ltr, 
                style: TextStyle(
                  fontSize: 20.0, 
                  decoration: TextDecoration.none, 
                  fontFamily: 'Roboto', 
                  fontWeight: FontWeight.normal
                )
                ),
                )
                
              ],
              ),
              Row(children: <Widget>[
                Expanded(child: 
                Text("Meat", 
                textDirection: TextDirection.ltr, 
                style: TextStyle(
                  fontSize: 30.0, 
                  decoration: TextDecoration.none, 
                  fontFamily: 'Roboto', 
                  fontWeight: FontWeight.normal
                )
                ),
                ),
                Expanded(child: 
                Text("Porrotta, Chicken", 
                textDirection: TextDirection.ltr, 
                style: TextStyle(
                  fontSize: 20.0, 
                  decoration: TextDecoration.none, 
                  fontFamily: 'Roboto', 
                  fontWeight: FontWeight.normal
                )
                ),
                )
                
              ],
              ), 
              IndianDishWidget(),  
              OrderButton() 

      ],)
      
      
      
    )
    );
  }
  
}

class IndianDishWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage indishAsset = AssetImage('images/indian-dish.png');
    Image image = Image(image: indishAsset, width: 400.0, height: 400.0,);
    return Container(child: image);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        child: Text("Order your Dish"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          order(context);
        },
      )
    );
    return button;
  }
}
          
void order(BuildContext context) {
  var alert = AlertDialog(
    title: Text("Order Completed"),
    content: Text("Thanks for your order"),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) => alert
  );
}