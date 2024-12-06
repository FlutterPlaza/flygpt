
import 'package:flutter/material.dart';
import 'package:flygpt_flutter/shared/constants.dart';
import 'package:gap/gap.dart';

class EmptyChatCard extends StatelessWidget {
  const EmptyChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constants.sizes(context).of;
    final textStyle =
    Constants.texts(context).of.titleLarge.copyWith(fontSize: 30);

    final dot = [
      Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
      Gap(size.xSmall),
    ];

    return Padding(
      padding: Constants.gap.fromLTRB(size.hpadding * 2, size.vpadding * 2,
          size.hpadding * 2, size.vpadding),
      child: Container(
        padding: Constants.gap.fromLTRB(size.hpadding * 2, size.vpadding * 2,
            size.hpadding * 2, size.vpadding),
        decoration: BoxDecoration(
          color: Constants.colors(context).of.cardColor,
          borderRadius: Constants.borderRadius(context).circular,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Examples',
                style: Constants.texts(context)
                    .of
                    .titleMedium
                    .copyWith(fontWeight: FontWeight.bold)),
            Gap(size.vpadding),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...dot,
                Expanded(
                    child: Text(
                        'Remembers what user said earlier in the conversation')),
              ],
            ),
            Gap(size.xSmall),
            Row(
              children: [
                ...dot,
                Expanded(
                    child: Text(
                        'Remembers what user said earlier in the conversation')),
              ],
            ),
            Gap(size.xSmall),
            Row(
              children: [
                ...dot,
                Expanded(
                    child: Text(
                        'Remembers what user said earlier in the conversation')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
