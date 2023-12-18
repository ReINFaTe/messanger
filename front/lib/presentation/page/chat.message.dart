import 'package:flutter/material.dart';
import 'package:front/model/message/message.dart';

class ChatMessage extends StatelessWidget {
  final Message message;
  final bool alignEnd;

  const ChatMessage(
    this.message, {
    this.alignEnd = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 800,
        minWidth: 200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(message.username),
            Material(
              borderRadius: BorderRadius.circular(8),
              color: alignEnd ? const Color(0xFF494F55) : Colors.purple,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(message.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
