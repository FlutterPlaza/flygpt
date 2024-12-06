import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_client/flygpt_client.dart';
import 'package:flygpt_flutter/screens/chat/chat_history_bloc/chat_history_bloc.dart';
import 'package:flygpt_flutter/screens/chat/new_chat/widgets/chat_text_input.dart';
import 'package:flygpt_flutter/screens/chat/new_chat/widgets/empty_card_placeholder.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  ChatScreen({
    super.key,
    this.history,
    this.showAppBar = true,
  });

  final bool showAppBar;

  final History? history;
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final highestId = history == null
        ? context.read<ChatHistoryBloc>().state.nextHistoryId
        : history!.id;
    return Scaffold(
      appBar: !showAppBar
          ? null
          : AppBar(
              title: Text(
                history?.desc ?? 'New Chat',
                style: Constants.texts(context).of.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
                builder: (context, state) {
                  final freshHistory = (history == null &&
                          !state.allHistories.any((h) => h.id == highestId))
                      ? null
                      : state.allHistories.firstWhere(
                          (h) => h.id == (history?.id ?? highestId),
                        );
                  return ListView.builder(
                    itemCount: freshHistory?.chats.length ?? 3,
                    itemBuilder: (context, index) {
                      if (freshHistory == null) {
                        return EmptyChatCard();
                      } else {
                        final chatEntries = freshHistory.chats.entries.toList();
                        final chatEntry = chatEntries[index];
                        final message = chatEntry.value;
                        return Column(
                          children: [
                            ListTile(
                              leading: Icon(PhosphorIcons.userCircle()),
                              title: Text(message),
                            ),
                            ListTile(
                              leading: FlutterLogo(),
                              title: Text(
                                  'Hey Man! I do want to help you, but you need to train me first.'),
                            ),
                          ],
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatInput(historyId: history?.id ?? highestId),
          ),
        ],
      ),
    );
  }
}
