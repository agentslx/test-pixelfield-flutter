import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield_flutter/config/color_styles.dart';
import 'package:test_pixelfield_flutter/config/text_styles.dart';
import 'package:test_pixelfield_flutter/entities/project.dart';

import '../../../../generated/locale_keys.g.dart';

class ProjectListItem extends StatelessWidget {
  final ProjectEntity project;
  final DateFormat dueDateFormat = DateFormat('dd-MM-yyyy');

  ProjectListItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: Stack(
              children: [
                CircularProgressIndicator(
                  value: project.progress,
                  strokeWidth: 4,
                  // color: Colors.transparent,
                  backgroundColor: AppColors.background,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: AppTextStyles.t16(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tr(LocaleKeys.project_due,
                      args: [dueDateFormat.format(project.dueDate)]),
                  style: AppTextStyles.t16(
                      color: AppColors.lightSurface500,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
