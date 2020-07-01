import 'package:flutter/material.dart';
import 'package:new_item/inventory.dart';
import 'package:new_item/new_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'New Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var width = (MediaQuery.of(context).size.width - (MediaQuery.of(context).padding.left + MediaQuery.of(context).padding.right))/100.0;
    var height = (MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom))/100.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                _showAddItemCard();
              },
            ),
          ),
        ],
      ),
    );
  }


// ============================= ADD ITEM BOTTOM SHEET ============================================


  void _showAddItemCard() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
        ),
        builder: (builder) {
          var width = (MediaQuery.of(context).size.width - (MediaQuery.of(context).padding.left + MediaQuery.of(context).padding.right)) / 100.0;
          var height = (MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom)) / 100.0;

          return Container(
            height: height * 28,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, height * 4.5, 0, 0),
                  child: Text(
                    "Add Item",
                    style: TextStyle(
                      fontSize: height * 4,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
                    child: Row(
                      children: <Widget>[
                        OutlineButton(
                          borderSide: BorderSide(
                              width: 2.5, color: Colors.pinkAccent),
                          splashColor: Colors.pinkAccent,
                          highlightColor: Colors.white,
                          highlightElevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 2)
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewItem()));
                          },
                          child: Text('+  New Item',
                            style: TextStyle(
                              fontSize: width * 5.5,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),

                        OutlineButton(
                          borderSide: BorderSide(
                              width: 2.5, color: Colors.pinkAccent),
                          splashColor: Colors.pinkAccent,
                          highlightColor: Colors.white,
                          highlightElevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 2)
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Inventory()));
                          },
                          child: Text('From Inventory',
                            style: TextStyle(
                              fontSize: width * 5.5,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
