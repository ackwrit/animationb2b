import 'package:flutter/material.dart';
import 'package:untitled1/model/Musique.dart';

class detail extends StatefulWidget{
  Musique music;
  detail({required this.music});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailState();
  }

}


class detailState extends State<detail>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.music.title}"),
      ),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return Text("Mon lecteur");
  }

}