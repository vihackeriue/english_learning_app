import 'package:english_learning_app/constrants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatAiScreen extends StatefulWidget {
  @override
  _ChatAiScreenState createState() => _ChatAiScreenState();
}

class _ChatAiScreenState extends State<ChatAiScreen> {
  final List<ChatMessage> _messages = [];
  final ChatUser _user = ChatUser(id: 'user', firstName: 'User');
  final ChatUser _bot = ChatUser(id: 'bot', firstName: 'AI');
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String message) async {
    final ChatMessage userMessage = ChatMessage(
      text: message,
      user: _user,
      createdAt: DateTime.now(),
    );

    setState(() {
      _messages.insert(0, userMessage);
    });

    try {
      final response = await Gemini.instance.prompt(parts: [
        Part.text(message),
      ]);

      final ChatMessage botMessage = ChatMessage(
        text: response?.output ?? 'No response',
        user: _bot,
        createdAt: DateTime.now(),
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    } catch (e) {
      final ChatMessage errorMessage = ChatMessage(
        text: 'Error: Unable to process your request.',
        user: _bot,
        createdAt: DateTime.now(),
      );

      setState(() {
        _messages.insert(0, errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat AI', style: TextStyle(color: AppColors.lightGray.withOpacity(0.8)),),
        backgroundColor: AppColors.darkBlueBlack,
        iconTheme: IconThemeData(color: AppColors.lightGray),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: DashChat(
              messages: _messages,
              currentUser: _user,
              onSend: (ChatMessage message) {
                _controller.clear();
                _sendMessage(message.text);
              },
            ),
          ),

        ],
      ),
    );
  }
}
