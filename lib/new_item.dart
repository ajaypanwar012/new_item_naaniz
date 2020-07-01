
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NewItem extends StatefulWidget {

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {

  PickedFile _image;
  final _picker = ImagePicker();

  // ============================== Pick image from camera ===================
  Future getImageFromCam() async {
    PickedFile image =  await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  // =============================== Pick image from gallery ==================

  Future getImageFromGallery() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {

    var width = (MediaQuery.of(context).size.width - (MediaQuery.of(context).padding.left + MediaQuery.of(context).padding.right))/100.0;
    var height = (MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom))/100.0;

    return Scaffold(

      //================================= body container ===========================

      body: Container(
        width: width*100,
        padding: EdgeInsets.fromLTRB(width*5.5, height*7.0, width*5.5, height*2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // back button

              Container(
                //alignment: Alignment.centerLeft,
                //color: Colors.green,
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                      size: height *5.0,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }),
              ),
              SizedBox(height: height*5.0,),

              //================================ New Item Text =======================================

              Container(
                  //color: Colors.green,
                  //alignment: Alignment.centerLeft,
                  child: Text('New Item',
                    style: TextStyle(fontSize: width*8),)
              ),
              SizedBox(height: height*2.0,),

              //===================================== Add image card ==================================

              GestureDetector(
                onTap: (){
                  _showUploadImageCard();
                },
                child: Container(
                  width: width*100,
                  height: height*30,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 3.0),
                    color: Colors.grey,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: _image == null
                  ? AddItemCard(width: width)
                      : Image.file(File(_image.path),fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: height*3.0,),

              //========================================= Add name field ============================

              Container(
                height: height*7,
                child: TextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Add Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height*2,),

              //======================================= Add price flield =======================

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    //width: width * 100,
                    child: Container(
                      height: height*7,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Price',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width*3,),
                  Text('INR',
                  style: TextStyle(
                    fontSize: width*6,
                  ),)
                ],
              ),
              SizedBox(height: height*5,),

              //==================================== submit icon button =====================================

              Container(
                alignment: Alignment.center,
                child: Icon(MdiIcons.chevronRightCircleOutline,
                  size: height*13,
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
      ),
    );
  }


  // ========================================= Upload Image Bottom Sheet =============================================


  void _showUploadImageCard() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))
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
                    "Upload Image",
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
                          borderSide: BorderSide(width: 2.5,
                              color: Colors.pinkAccent),
                          splashColor: Colors.pinkAccent,
                          highlightColor: Colors.white,
                          highlightElevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 2)
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            getImageFromCam();
                          },
                          child: Text('Open Camera',
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
                          borderSide: BorderSide(width: 2.5,
                              color: Colors.pinkAccent),
                          splashColor: Colors.pinkAccent,
                          highlightColor: Colors.white,
                          highlightElevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 2)
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            getImageFromGallery();
                          },
                          child: Text('From Gallery',
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
                Container(
                  child: OutlineButton(
                    borderSide: BorderSide(width: 2.5,
                        color: Colors.pinkAccent),
                    splashColor: Colors.pinkAccent,
                    highlightColor: Colors.white,
                    highlightElevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 2)
                    ),
                    onPressed: () {},
                    child: Text('Use from Naaniz Gallery',
                      style: TextStyle(
                        fontSize: width * 5.5,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });

    // =============== Add image card fun ======================


  }
}

class AddItemCard extends StatelessWidget {
  const AddItemCard({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('+',
          style: TextStyle(
            fontSize: width*35,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),

        ),
        Text('Add Image',
          style: TextStyle(
            fontSize: width*4,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
