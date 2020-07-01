import 'package:flutter/material.dart';
import 'package:new_item/reusable_card_inventory.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Item from Inventory',
        style: TextStyle(
          color: Colors.black,
        ),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black,),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index){
            return Center(

              // Reusing custom widget
              child: ReusableCardInventory(
                item: 'Burger',
                price: 20,
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
