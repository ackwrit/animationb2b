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

  //Variable
  double timeLine =0.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.music.title}"),
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child: bodyPage(),

      ),
      backgroundColor: Colors.amber,

    );
  }


  Widget bodyPage(){
    return Column(
      children: [
        SizedBox(height: 20,),

        //Image
        Container(
          height: 250,
          width: 450,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: (widget.music.image ==  null)?AssetImage("assets/images/indispo.jpg"):AssetImage(widget.music.image!),
                  fit: BoxFit.fill
              )
          ),
        ),
        SizedBox(height: 20,),

        // Titre et album,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.music.title}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            (widget.music.album == null)?Container():Text(" - ${widget.music.album}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold))
          ],
        ),



        //Chanteur
        SizedBox(height: 20,),

        Text("${widget.music.artist}",style: TextStyle(fontSize: 20)),


        SizedBox(height: 20,),

        //Icones de lecture
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.fast_rewind_rounded)
            ),

            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.play_arrow,size: 40,)
            ),

            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.fast_forward_rounded)
            ),

          ],
        ),



        //TimelIne

        Slider(
            value: timeLine,
            activeColor: Colors.black,
            inactiveColor: Colors.red,
            onChanged: (value){
              setState(() {
                timeLine = value;
              });
            }
        )


      ],
    );
  }

}