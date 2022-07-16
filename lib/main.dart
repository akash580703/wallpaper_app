// import 'dart:html';

// import 'dart:developer';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{

 @override
 Widget build(BuildContext context){
   
   return MaterialApp(
//     home:RandomWord(),
    theme:ThemeData(primaryColor:Colors.red[200])  
   );


 }

}

class RandomWord extends StatefulWidget{




  static final imagesCollection = FirebaseFirestore.instance.collection('images');
  
  @override
  RandomWordState createState()=>RandomWordState();
}

class RandomWordState extends State<RandomWord>{

  
final _wordsList=<WordPair>[];
final Set pairs=Set();
var x;

query()async{

  await Firebase.initializeApp( 
  );
  FirebaseFirestore.instance
    .collection('images')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc["imageUrl"]);
        });
    });
}
 Future<DocumentSnapshot> getData() async {
    
    return await FirebaseFirestore.instance
        .collection("images")
        .doc("pps9iFW8irgJj8DK80Np")
        .get();
  }



Widget build(BuildContext context){
  
  
  print("//////////////////////////////////////////////////////");
  query();

  List list_pairs = pairs.toList();
  return Scaffold(
    appBar:AppBar(
      title:Text("1234"),
      actions:<Widget>[
        IconButton(icon:Icon(Icons.add_alert),
        onPressed:(){
           Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return  Scaffold(
    appBar:AppBar(title:Text("Saved")),
    body:_buildList(list_pairs) 
     );
                }));
        }),
        
      ]
    ),
    body:_buildList(_wordsList) ,

  );
}







Widget? _buildList(words){

 
  
 

  // final List<String> _wordsList = <String>['A', 'B', 'C'];
 
    
   



  return ListView.builder(
    
    

     
      itemCount: 3,
      padding: const EdgeInsets.all(2),
      itemBuilder: ( context, index) {
      _wordsList.addAll(generateWordPairs().take(1));
        return tiles(words[index]);
        
       
    
  },
      // itemCount: words.length,

    );
    
  


}


Widget tiles(WordPair _wordsList){
  final saved=pairs.contains(_wordsList);
  
  return ListTile(
       
 
      // color: Colors.green[index*100],
      title: Text(_wordsList.asPascalCase,style:TextStyle(fontSize: 20)),
      trailing: Icon(saved?Icons.favorite:Icons.favorite_border,
      color: saved?Colors.red:null),
      onTap: (){
        setState(() {
          if (saved==true){
            pairs.remove(_wordsList);
          }
          else{
            pairs.add(_wordsList);
          }
          
        });
      },
    
      
      
    );

}

// Widget buildlist(){
  
//   return Scaffold(
    
//   );

// }
}



