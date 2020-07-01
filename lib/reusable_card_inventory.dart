import 'package:flutter/material.dart';
class ReusableCardInventory extends StatelessWidget{

  final String url;
  final String item;
  final double price;
  //final String img;
  //ReusableWidget({this.item,this.img});
  ReusableCardInventory({this.url,this.item, this.price});

  @override
  Widget build(BuildContext context) {

    var width = (MediaQuery.of(context).size.width - (MediaQuery.of(context).padding.left + MediaQuery.of(context).padding.right))/100.0;
    var height = (MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom))/100.0;

    return Stack(
      children: <Widget>[
        Container(
          height: height*21,
          width: width*41,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(width*5)),
          ),
            child: Image.network('https://rahulsweets.com/wp-content/uploads/2018/05/Burger-HD.jpg',fit: BoxFit.cover,),
        ),
        Container(
          height: height*8.1,
          width: width*41,
          margin: EdgeInsets.fromLTRB(0, height*13, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(width*5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),

          child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(width*3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*5),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: height*2.3,
                    ),
                  ),
                  Text(
                    '₹$price/pc',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: height*2,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

}