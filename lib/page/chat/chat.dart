import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> _messages = [];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  String? _selectedFilePath;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isCurrentUser = message['sender'] == 'CurrentUser';
                final messageWidget = Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: isCurrentUser ? Colors.blue.withOpacity(0.7) : Colors.green.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: isCurrentUser ? Radius.circular(12.0) : Radius.circular(0.0),
                      topRight: isCurrentUser ? Radius.circular(0.0) : Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message['text'] != null)
                        Text(
                          message['text'],
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      if (_selectedFilePath != null)
                        Text(
                          _selectedFilePath!,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      SizedBox(height: 4.0),
                      Text(
                        message['timestamp'],
                        style: TextStyle(color: Colors.white70, fontSize: 12.0),
                      ),
                    ],
                  ),
                );
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isCurrentUser)
                        CircleAvatar(
                          child: Text('S', style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.green,
                        ),
                      SizedBox(width: 8.0),
                      messageWidget,
                      if (isCurrentUser)
                        CircleAvatar(
                          child: Text('U', style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.blue,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: _attachFile,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.emoji_emotions, color: Colors.grey),
                  onPressed: () {
                    
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty || _selectedFilePath != null) {
      final now = DateTime.now();
      final formattedTime = '${now.hour}:${now.minute}';
      final newMessage = {
        'sender': 'CurrentUser',
        'text': text.isNotEmpty ? text : null,
        'filePath': _selectedFilePath,
        'timestamp': formattedTime,
      };
      setState(() {
        _messages.add(newMessage);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        _selectedFilePath = null;
      });
      _controller.clear();
    }
  }
void _attachFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      
      if (file.bytes != null) {
      
        print('Attached file size: ${file.bytes!.length} bytes');

      
        String fileName = file.name;
        String base64Data = base64Encode(file.bytes!);

       
        String uploadUrl = 'https://example.com/upload';
        Map<String, dynamic> requestBody = {
          'fileName': fileName,
          'fileData': base64Data,
        };

        http.Response response = await http.post(
          Uri.parse(uploadUrl),
          body: jsonEncode(requestBody),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          print('File uploaded successfully');

        } else {
          print('Failed to upload file: ${response.statusCode}');

        }
      } else {
        print('No file selected or file type not supported');
      }
    } else {

      print('No file selected');
    }
  } catch (e) {
    print('Error picking file: $e');

  }
}



}

