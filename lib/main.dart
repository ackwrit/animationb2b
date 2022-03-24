import 'package:flutter/material.dart';
import 'package:untitled1/custom.dart';
import 'package:untitled1/detail.dart';
import 'package:untitled1/model/Musique.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Variable
  List<Musique> allMorceau = [
    Musique(path: "https://firebasestorage.googleapis.com/v0/b/firstapplicationb2b.appspot.com/o/09.AbuSimbel.mp3?alt=media&token=0be92b61-6412-4578-89e6-0178d1f6e550", title: "Bonjour", artist: "Melanié",image:"assets/images/1d84dc7609a129e377cc38afdf38b9d064183853.jpg"),
    Musique(path: "https://firebasestorage.googleapis.com/v0/b/firstapplicationb2b.appspot.com/o/14.Alibi.mp3?alt=media&token=e0b8709b-080c-457a-abe6-42fbf605b1f5", title: "Big Boss", artist: "Djino",genre: ["rap"]),
    Musique(path: "https://firebasestorage.googleapis.com/v0/b/firstapplicationb2b.appspot.com/o/16.Inheritance.mp3?alt=media&token=0503ff59-a149-405d-9182-4b5504da8277", title: "Love tender", artist: "Dune",image: "assets/images/07.jpg"),
    Musique(path: "https://firebasestorage.googleapis.com/v0/b/firstapplicationb2b.appspot.com/o/21.%20IWasn'tThinking.mp3?alt=media&token=5fed8689-7351-4f1e-8569-f5006be3b720", title: "Hymn", artist: "Léa",image: "assets/images/36morning_banana_oatmeal.jpg"),

  ];


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            //fond(),
            bodyPage(),
          ],
        ) ,

      ),
      backgroundColor: Colors.amber,

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget fond(){
    return ClipPath(
      clipper: custom(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
      ),

    );
  }

  Widget bodyPage(){
    return GridView.builder(
      itemCount: allMorceau.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing:20),
      itemBuilder: (context,index){
          return InkWell(
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: (allMorceau[index].image ==  null)?AssetImage("assets/images/indispo.jpg"):AssetImage(allMorceau[index].image!),
                      fit: BoxFit.fill
                  )
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return detail(music: allMorceau[index],);
                  }
              ));
            },
          );

      },
    );
  }
}
