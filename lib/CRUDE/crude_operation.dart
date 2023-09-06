import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDEoperation extends StatefulWidget {
  const CRUDEoperation({super.key});

  @override
  State<CRUDEoperation> createState() => _CRUDEoperation();
}

class _CRUDEoperation extends State<CRUDEoperation> {
  final CollectionReference _items =
      FirebaseFirestore.instance.collection('items');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUDE Operation')),
      body: StreamBuilder(
        stream: _items.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if(streamSnapshot.hasData){
              return ListView.builder(itemCount: streamSnapshot.data!.docs.length,itemBuilder: (context,index){

              }
            }
        return Center();
      }),
    );
  }
}
