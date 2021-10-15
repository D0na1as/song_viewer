import 'package:flutter/material.dart';
import 'package:song_viewer/constants/app_colors.dart';

class StorageStateImages {
  StorageStateImages._();

  static Widget toSave() {
    return const Icon(
      Icons.save_rounded,
      color: AppColors.secondaryColor,
    );
  }

  static Widget saved() {
    return const Icon(
      Icons.check_rounded,
      color: AppColors.accentColor,
    );
  }

}
