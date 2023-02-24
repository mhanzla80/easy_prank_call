import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:easy_prank_call/src/widgets/custom_buttons.dart';
import 'package:easy_prank_call/src/widgets/dial_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallIncomingContainer extends StatelessWidget {
  final VoidCallback onPressAccept;
  final VoidCallback onPressEnd;

  const CallIncomingContainer(
      {Key? key, required this.onPressAccept, required this.onPressEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DialButton(
              text: "Remind Me",
              press: () {},
              iconData: CupertinoIcons.alarm_fill,
              isDarkMode: isDarkMode,
            ),
            DialButton(
              text: "Message",
              press: () {},
              iconData: CupertinoIcons.chat_bubble_fill,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
        const VerticalSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              iconData: CupertinoIcons.phone_down_fill,
              press: onPressEnd,
              color: Colors.red,
              iconColor: Colors.white,
            ),
            RoundedButton(
              iconData: CupertinoIcons.phone_fill,
              press: onPressAccept,
              color: Colors.green,
              iconColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
