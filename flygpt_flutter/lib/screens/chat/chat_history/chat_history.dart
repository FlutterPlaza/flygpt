import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_client/flygpt_client.dart';
import 'package:flygpt_flutter/routes/app_router.gr.dart';
import 'package:flygpt_flutter/screens/chat/chat_history_bloc/chat_history_bloc.dart';
import 'package:flygpt_flutter/shared/adaptive_display.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:flygpt_flutter/shared/icons_mapper.dart';
import 'package:gap/gap.dart';

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.sectionedHistories.length,
          itemBuilder: (context, index) {
            final entry = state.sectionedHistories.entries.elementAt(index);
            return HistorySection(
              date: entry.key,
              histories: entry.value,
            );
          },
        );
      },
    );
  }
}

class HistorySection extends StatelessWidget {
  const HistorySection(
      {super.key, required this.date, required this.histories});

  final String date;
  final List<History> histories;

  @override
  Widget build(BuildContext context) {
    final size = Constants.sizes(context).of;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.colors(context).of.cardColor,
          borderRadius: Constants.borderRadius(context).circular,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: histories.length,
          itemBuilder: (context, index) {
            final history = histories[index];
            return Column(
              children: [
                if (index == 0)
                  Padding(
                    padding:
                        Constants.gap.symmetric(vertical: size.vpadding + 4),
                    child: Row(
                      children: [
                        Gap(size.small),
                        Text(
                          date,
                          style: Constants.texts(context).of.titleSmall,
                        ),
                      ],
                    ),
                  ),
                HistoryTile(
                  icon: history.iconData.toRandomPhosphorIconData,
                  title: history.desc,
                  onTap: () {
                    if (Display.isSmallest) {
                      context.router.push(ChatRoute(
                        history: history,
                      ));
                    } else {
                      // context
                      //     .read<ChatHistoryBloc>()
                      //     .add(ChatHistoryEvent.setSelectedHistory(history));
                    }
                  },
                ),
                Container(
                  padding: Constants.gap.only(left: size.xLarge * 2),
                  child: Divider(
                    color: Constants.colors(context).of.dividerColor,
                    thickness: 0.5,
                  ),
                ),
                if (index == histories.length - 1) Gap(size.small),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = Constants.sizes(context).of;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Gap(size.small),
              Icon(icon),
              Gap(size.small),
              Flexible(
                child: Text(
                  title,
                  style: Constants.texts(context).of.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
