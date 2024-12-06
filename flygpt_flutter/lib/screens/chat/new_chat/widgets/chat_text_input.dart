import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_flutter/screens/chat/chat_history_bloc/chat_history_bloc.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key, this.historyId});

  final int? historyId;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool isFocused = false;

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = Constants.sizes(context).of;
    final bloc = context.read<ChatHistoryBloc>();
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && _textController.text.isNotEmpty) {
          return;
        }
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Constants.borderRadius(context).circular,
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textController,
              maxLines: 10,
              minLines: 1,
              decoration: InputDecoration(
                hintText: isFocused ? 'Tell me more' : 'Send a message...',
                border: InputBorder.none,
                hintStyle: isFocused
                    ? null
                    : Constants.texts(context).of.bodyLarge.copyWith(
                          color: Constants.colors(context).of.accentColor,
                          fontWeight: FontWeight.w600,
                        ),
              ),
            ),
            if (isFocused)
              Row(
                children: [
                  IconButton(
                    icon: Icon(PhosphorIcons.microphone()),
                    color: Constants.colors(context).of.accentColor,
                    onPressed: () {
                      // Handle microphone action
                    },
                  ),
                  IconButton(
                    color: Constants.colors(context).of.accentColor,
                    icon: Icon(PhosphorIcons.paperclip()),
                    onPressed: () {
                      // Handle attachment action
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      print('Send text: ${_textController.text}');
                      bloc.add(
                        ChatHistoryEvent.sendTextPrompt(
                          _textController.text,
                          historyId: widget.historyId,
                        ),
                      );
                      _textController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Gap(size.xSmall),
                        Text('Send',
                            style:
                                Constants.texts(context).of.bodyMedium.copyWith(
                                      color: Colors.white,
                                    )),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
