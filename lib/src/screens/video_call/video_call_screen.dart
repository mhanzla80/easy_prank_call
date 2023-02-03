import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/video_call/components/body.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  static const String routeName = "/videoCallScreen";
  final CallSettingsModel model;

  const VideoCallScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final path = EasyPrankCallController.of(context).videoPath;

    return Scaffold(
      body: Body(model.isVibrationOn, videoPath: path),
    );
  }
}
