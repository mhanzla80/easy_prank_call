import 'package:easy_prank_call/src/easy_prank_call_controller.dart';
import 'package:easy_prank_call/src/models/call_settings_model.dart';
import 'package:easy_prank_call/src/screens/audio_call/audio_call_screen.dart';
import 'package:easy_prank_call/src/screens/call_settings/call_settings_screen.dart';
import 'package:easy_prank_call/src/screens/video_call/video_call_screen.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

class EasyWallpaperApp extends StatelessWidget {
  /// This [leadingTitle] will be added before main [title]
  final String? leadingTitle;

  /// This is the main title text
  final String title;

  /// This will be added as a background image with blur effect
  final String? bgImage;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  /// [onSetOrDownloadWallpaper] will be call when user set or download wallpaper
  final Future<bool> Function(BuildContext)? onSetOrDownloadWallpaper;

  const EasyWallpaperApp({
    Key? key,
    required this.title,
    this.leadingTitle,
    this.bgImage,
    this.onTapEvent,
    this.onSetOrDownloadWallpaper,
    this.placementBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return EasyWallpaperController(
      leadingTitle: leadingTitle,
      title: title,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      context: context,
      bgImage: bgImage,

      /// Package has its own navigation
      child: Navigator(
        initialRoute: CallSettingsScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case CallSettingsScreen.routeName:
              return _generatePage(const CallSettingsScreen());
            case AudioCallScreen.routeName:
              return _generatePage(AudioCallScreen(
                  model: settings.arguments as CallSettingsModel));
            case VideoCallScreen.routeName:
              return _generatePage(VideoCallScreen(
                  model: settings.arguments as CallSettingsModel));
          }
          return null;
        },
      ),
    );
  }

  Route _generatePage(child) => MaterialPageRoute(builder: (_) => child);

  static void launchApp(
    BuildContext context, {
    /// This [leadingTitle] will be added before main [title]
    final String? leadingTitle,

    /// This is the main title text
    required final String title,

    /// This will be added as a background image with blur effect
    final String? bgImage,

    /// [placementBuilder] is used to build your custom widget at specific places
    final PlacementBuilder? placementBuilder,

    /// [onTapEvent] will be call on every event preformed by the user
    final EventActionCallback? onTapEvent,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => Scaffold(
            body: EasyWallpaperApp(
              leadingTitle: leadingTitle,
              title: title,
              bgImage: bgImage,
              placementBuilder: placementBuilder,
              onTapEvent: onTapEvent,
            ),
          ),
        ),
      );
}
