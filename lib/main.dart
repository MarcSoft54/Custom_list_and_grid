import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'list flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {


  List<mesPublication> mesActivites = [
    mesPublication("setting", Icons.settings),
    mesPublication("1K Sucribe", Icons.one_k_plus),
    mesPublication("Opacity", Icons.offline_bolt_outlined),
    mesPublication("fulls Oils", Icons.opacity),
    mesPublication("Log Out", Icons.trending_down),
    mesPublication("okays", Icons.error),
    mesPublication("NetWork Connection", Icons.track_changes),
    mesPublication("Camera Front", Icons.camera_front),
    mesPublication("SnapChat", Icons.snapchat),
  ];


  @override
  Widget build(BuildContext context) {
  Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (orientation == Orientation.portrait)? list() : grill(),
      ),
    );
  }

  Widget grill(){
    return GridView.builder(
        itemCount: mesActivites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, i){
          return Container(
            margin: EdgeInsets.all(3),
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Operation ", style: TextStyle(color: Colors.green, fontSize: 20)),
                  Icon(mesActivites[i].icone, size: 45,color: Colors.green,),
                  Text("${mesActivites[i].name}", textScaleFactor: 1.2,style: TextStyle(color: Colors.green[300]),)
                ],
              ),
            ),
          );
        }
    );
  }


  Widget list(){
    return ListView.builder(
      itemCount: mesActivites.length,
      itemBuilder: (context, i){
        mesPublication Activiter = mesActivites[i];
        String? value = Activiter.name;
        return Dismissible(
            key: Key(value!),
            background: Container(
              // color: Colors.redAccent,
              padding: EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("suprimer"),
                  Icon(Icons.delete),
                ],
              ),
            ),
            onDismissed:(direction){
              setState(() {
                mesActivites.removeAt(i);
              });
            },
            child: InkWell(
              onTap: (() => log("taper")),
              child: Container(
                height: 128,
                padding: EdgeInsets.all(9),
                child: Card(
                  elevation: 10,
                  // color: Colors.green,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Activiter.icone, size: 65,color: Colors.green,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Operation", textScaleFactor: 1.5,style: TextStyle(color: Colors.green[200]),),
                            Text("${Activiter.name}", textScaleFactor: 2.2,style: TextStyle(color: Colors.green[300]),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )

        );
      },
    );
  }


}


class mesPublication{
  String? name;
  IconData? icone;
  mesPublication(this.name,this.icone);
}