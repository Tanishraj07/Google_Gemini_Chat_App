import 'package:flutter/material.dart';

import '../models/message.dart';
import '../provider/chat_provider.dart';
import 'assistance_message_widget.dart';
import 'my_message_widget.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.scrollController,
    required this.chatProvider,
  });

  final ScrollController scrollController;
  final ChatProvider chatProvider;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: chatProvider.inChatMessages.length,
        itemBuilder: (context,index){
          // compare with time sent
          final message =
          chatProvider.inChatMessages[index];
          return message.role == Role.user
              ? MyMessageWidget(message: message)
              : AssistanceMessageWidget(
              message:message.message.toString() );
        });
  }
}