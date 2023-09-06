import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDEoperation extends StatefulWidget {
  const CRUDEoperation({super.key});

  @override
  State<CRUDEoperation> createState() => _CRUDEoperation();
}

class _CRUDEoperation extends State<CRUDEoperation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _snController = TextEditingController();
  final CollectionReference _items =
      FirebaseFirestore.instance.collection('items');
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Column(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Create your item',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name', hintText: 'e.g. Nguyen Van A'),
                  ),
                  TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                        labelText: 'Number', hintText: 'e.g. 123456'),
                  ),
                  TextField(
                    controller: _snController,
                    decoration: const InputDecoration(
                        labelText: 'SN', hintText: 'e.g. 1'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final String name = _nameController.text;
                        final int? sn = int.tryParse(_snController.text);
                        final int? number =
                            int.tryParse(_numberController.text);
                        if (number != null) {
                          await _items
                              .add({"name": name, "number": number, "sn": sn});
                          _nameController.text = '';
                          _numberController.text = '';
                          _snController.text = '';
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Create'))
                ],
              )
            ]),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'].toString();
      _snController.text = documentSnapshot['sn'].toString();
      _numberController.text = documentSnapshot['number'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Column(children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Create your item',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name', hintText: 'e.g. Nguyen Van A'),
                  ),
                  TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                        labelText: 'Number', hintText: 'e.g. 123456'),
                  ),
                  TextField(
                    controller: _snController,
                    decoration: const InputDecoration(
                        labelText: 'SN', hintText: 'e.g. 1'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final String name = _nameController.text;
                        final int? sn = int.tryParse(_snController.text);
                        final int? number =
                            int.tryParse(_numberController.text);
                        if (number != null) {
                          await _items.doc(documentSnapshot!.id).update(
                              {"name": name, "number": number, "sn": sn});
                          _nameController.text = '';
                          _numberController.text = '';
                          _snController.text = '';
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Update'))
                ],
              )
            ]),
          );
        });
  }

  Future<void> _detele(String productID) async {
    await _items.doc(productID).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUDE Operation')),
      body: StreamBuilder(
          stream: _items.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Card(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            documentSnapshot['sn'].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          radius: 17,
                          backgroundColor: Colors.amber,
                        ),
                        title: Text(documentSnapshot['name']),
                        subtitle: Text(
                          documentSnapshot['number'].toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => _update(documentSnapshot),
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () =>
                                      _detele(documentSnapshot!.id),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
