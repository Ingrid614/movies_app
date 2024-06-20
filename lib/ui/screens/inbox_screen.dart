import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ludokin_agent/ui/widgets/chat_bubble.dart';

import '../widgets/gap.dart';

class InboxScreen extends StatefulWidget{
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InboxScreenState();

}

class InboxScreenState  extends State<InboxScreen> {

  TextEditingController messageController= TextEditingController();

  Future<void> configureFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      File file = File(result.files.single.path??'');
      PlatformFile  file1 = result.files.first;
      messageController.text=result.files.first.name ;
      setState(() {});
    }else{

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INBOX"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: (){
            Navigator.pop(context);
            },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                  ChatBubble(message: "HELLO! I have some problems concerning your app", isCurrentUser: true),
                  ChatBubble(message: "Ok we are listening to you", isCurrentUser: false),
                  ChatBubble(message: "I can't take proof of transaction using your camera. I must leave your app and take photo outside before sending photo", isCurrentUser: true),
                  ChatBubble(message: ("Okay wait a few minutes, we will answer you"), isCurrentUser: false),
                  ChatBubble(message: "Try to restart your app", isCurrentUser: false),
                  ChatBubble(message: "after doing it, restart the transaction", isCurrentUser: false),
                  ChatBubble(message: "if you find any problem , we are at your disposal", isCurrentUser: false),
                  ChatBubble(message: "okay thank you", isCurrentUser: true),
                  ChatBubble(message: "Hello! I have a new problem", isCurrentUser: true),

                ])
            ),
            Gap(),
            Scrollbar(
              child: TextField(

              controller: messageController,
              textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: IconButton(
                    onPressed: (){
                      configureFilePicker();
                    },
                      icon:Icon(Icons.attach_file_sharp,color: Colors.deepPurple)),
                  suffixIcon: IconButton(
                      icon:Icon(Icons.send,color: Colors.deepPurple,),
                      onPressed: (){},),
                  hintText: "Message"
                ),

              ),
    )




          ],
        ),
      ),
    );
  }
  
}

