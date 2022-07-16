import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crash/image_list.dart';
import 'package:crash/utils.dart';

class NewestPage extends StatelessWidget {
  final imagesCollection = FirebaseFirestore.instance.collection('images');
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Theme.of(context).backgroundColor,
      child: StaggeredImageList(
        imagesCollection
            .orderBy('uploadedTime', descending: true)
            .limit(15)
            .snapshots()
            .map(mapper),
      ),
    );
  }
}
