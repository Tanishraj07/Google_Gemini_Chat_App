import 'package:flutter/material.dart';
import 'package:gemini_chat_app/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final chatProvide = context.read<ChatProvider>();
          //prepare chat room
          await chatProvide.prepareChatRoom(
              isNewChat: true,
              chatID: '');
          chatProvide.setCurrentIndex(newIndex: 1);
          chatProvide.pageController.jumpToPage(1);
          // Handle tap to start a new chat
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No chat found, start a new chat!',
            ),
          ),
        ),
      ),
    );
  }
}
