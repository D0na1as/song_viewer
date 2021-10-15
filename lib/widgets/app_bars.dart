import 'package:flutter/material.dart';
import 'package:song_viewer/constants/app_colors.dart';

class AppBars {
  AppBars._();

  static Widget mainAppBar({
    required BuildContext context,
    required String title,
  }) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floating: true,
      snap: true,
      pinned: true,
      expandedHeight: 100,
      flexibleSpace: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
          title,
          style: const TextStyle(fontSize: 35, color: AppColors.accentColor, fontWeight: FontWeight.w600),
    ),
        ),
      ),
    );
  }

  static Widget secondaryAppBar({
    required BuildContext context,
    required String title,
    pinned = false,
  }) {
    return SliverAppBar(
      iconTheme: const IconThemeData(
        color: AppColors.backgroundColor,
      ),
      pinned: pinned,
      backgroundColor: AppColors.secondaryColor,
      title:  Text(
        title,
        style: const TextStyle(fontSize: 25, color: AppColors.backgroundColor),
      ),
    );
  }
}
