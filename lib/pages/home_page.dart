import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/components/signInSignUpButtons.dart';
import 'package:loginapp/components/text_field.dart';
import 'package:loginapp/components/wall_post.dart';
import 'package:loginapp/pages/register/register_page.dart';
import 'package:loginapp/pages/user/add_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  final textController = TextEditingController();
  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now()
      });
    }
    setState(() {
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Message'),
          backgroundColor: Colors.grey[100],
          actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))],
          elevation: 0,
        ),
        body: Center(
          child: Column(children: [
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User Posts')
                  .orderBy('TimeStamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      return WallPost(
                          message: post['Message'], user: post['UserEmail']);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(('Error:${snapshot.error}')),
                  );
                }
                return const Center(
                  child:
                      CircularProgressIndicator(), /* Là một chỉ báo tiến trình không xác định được phần trăm công việc đã hoàn thành và không thể xác định được thời điểm kết thúc.*/
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                        controller: textController,
                        hintText: 'Write something on the textfiled',
                        obscureText: false),
                  ),
                  IconButton(
                      onPressed: postMessage, icon: Icon(Icons.arrow_circle_up))
                ],
              ),
            ),
            Text(
              'Logged in as : ' + currentUser.email!,
              style: TextStyle(color: Colors.grey[400]),
            ),
            GestureDetector(
              onTap: () {
                MaterialPageRoute(builder: (context) => AddUsers());
              },
              child: Container(
                color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                // Change button text when light changes state.
                child: Text('Add User'),
              ),
            ),
          ]),
        ));
  }
}
