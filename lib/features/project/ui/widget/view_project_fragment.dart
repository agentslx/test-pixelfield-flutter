import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pixelfield_flutter/config/app_assets.dart';
import 'package:test_pixelfield_flutter/config/color_styles.dart';
import 'package:test_pixelfield_flutter/config/text_styles.dart';
import 'package:test_pixelfield_flutter/entities/project.dart';
import 'package:test_pixelfield_flutter/features/project/bloc/project_bloc.dart';
import 'package:test_pixelfield_flutter/generated/locale_keys.g.dart';

import '../../../../utils/device_utils.dart';

class ViewProjectFragment extends StatefulWidget {
  final ProjectEntity project;

  const ViewProjectFragment({super.key, required this.project});

  @override
  State<ViewProjectFragment> createState() => _ViewProjectFragmentState();
}

class _ViewProjectFragmentState extends State<ViewProjectFragment> {
  late final TextEditingController _titleController = TextEditingController();
  late final TextEditingController _dueDateController = TextEditingController();
  final DateFormat dueDateFormat = DateFormat('dd-MM-yyyy');

  DateTime? selectedDueDate;
  ProjectRoutine? selectedRoutine;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.project.title;
    _dueDateController.text = dueDateFormat.format(widget.project.dueDate);
    selectedRoutine = widget.project.routine;
    selectedDueDate = widget.project.dueDate;
  }

  @override
  Widget build(BuildContext context) {
    var isMobile = DeviceUtils.isMobile(context);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
        SliverAppBar(
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: isMobile ? 322 : 400,
          collapsedHeight: 0,
          toolbarHeight: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://s3-alpha-sig.figma.com/img/3408/2974/d12e41f974a6f43b10459e2ac1029e60?Expires=1687737600&Signature=RakvSnFSyOwbEoOF6NT~4O9IcpDuwuTkXYoOT7UvJplhhS1zA7VlCPbu5yRfk2wdJ~GjzX-K-QHtmIc0M~Mgd6HaMCpqQ6AReJHyFGectcrfjbHk6XqrASZmERjTBWqAae9BvpiQejxRXc6VlBixi4volJ8VikPtgBeKSJMq991q6mBcMzMgthNjLOmgOlGBRrfW6OgS2GwK3sahasIofAE4PpLWdgx3M33Ykwz8lyMDecRM-uJYUa0SmwFAUBWG43KuATYch9geldBE7ieIc9OzIIKlocniTlWW-db1LWHyZ2GNSeybJb82vjear26ip3O3cjA~Goy0dbZD-5KYCQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
              fit: BoxFit.cover,
            ),
          ),
        ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: tr(LocaleKeys.project_title_hint),
                          hintStyle:
                              AppTextStyles.t32(color: AppColors.darkSurface400),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        style: AppTextStyles.t32(),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.darkSurface200,
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 8, bottom: 2, top: 4, right: 8),
                                  child: TextFormField(
                                    controller: _dueDateController,
                                    enabled: false,
                                    style: AppTextStyles.t16(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SvgPicture.asset(
                                          AppAssets.iconCalendar,
                                          height: 24,
                                          width: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      prefixIconConstraints: const BoxConstraints(
                                        maxHeight: 24,
                                        maxWidth: 40,
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 16, right: 16, bottom: 8),
                                      hintText: tr(LocaleKeys.project_due_date),
                                      hintStyle: AppTextStyles.t16(
                                          color: AppColors.lightSurface500,
                                          fontWeight: FontWeight.w300),
                                      label: Text(
                                        tr(LocaleKeys.project_due_date),
                                      ),
                                      labelStyle: AppTextStyles.t16(
                                          color: AppColors.lightSurface500,
                                          fontWeight: FontWeight.w300),
                                      floatingLabelStyle: AppTextStyles.t10(
                                          color: AppColors.lightSurface500,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ))),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.darkSurface200,
                              ),
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: DropdownButtonFormField2<ProjectRoutine>(
                                value: selectedRoutine,
                                decoration: InputDecoration(
                                  //Add isDense true and zero Padding.
                                  //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(
                                      left: 0, right: 0, bottom: 0, top: 4),
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: SvgPicture.asset(
                                      AppAssets.iconRoutine,
                                      height: 24,
                                      width: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                    maxHeight: 48,
                                    maxWidth: 40,
                                  ),
                                  label: Text(
                                    tr(LocaleKeys.project_routine),
                                  ),
                                  labelStyle: AppTextStyles.t16(
                                      color: AppColors.lightSurface500,
                                      fontWeight: FontWeight.w300),
                                  floatingLabelStyle: AppTextStyles.t10(
                                      color: AppColors.lightSurface500,
                                      fontWeight: FontWeight.w300),
                                ),
                                isExpanded: true,
                                items: ProjectRoutine.values
                                    .map((item) =>
                                        DropdownMenuItem<ProjectRoutine>(
                                          value: item,
                                          child: Text(
                                            tr("${LocaleKeys.project_routines}.${item.name}"),
                                            style: AppTextStyles.t16(
                                                color: Colors.white),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select routine!'; // TODO use locale
                                  }
                                  return null;
                                },
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 24,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.darkSurface200),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        tr(LocaleKeys.project_steps).toUpperCase(),
                        style: AppTextStyles.t14(
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      const SizedBox(height: 8),
                      if (widget.project.steps.isEmpty)
                        Text(
                          tr(LocaleKeys.project_no_steps),
                          style: AppTextStyles.t16(
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      if (widget.project.steps.isNotEmpty)
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.project.steps.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              var item = widget.project.steps[index];
                              return InkWell(
                                onTap: () {},
                                child: ListTile(
                                  title: Text(
                                    item.content,
                                    style: AppTextStyles.t16(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  leading: Radio(
                                    value: item,
                                    onChanged: (value) {},
                                    groupValue: 'items',
                                  ),
                                ),
                              );
                            })
                    ],
                  ),
                ),
              ],
            ),
          ),
    ],

    ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 287,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Container(
                    height: 56,
                    width: 287,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.primaryGradientRev,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(56),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.iconRocketLaunch),
                          const SizedBox(width: 8),
                          Text(tr(LocaleKeys.project_launch),
                              style: AppTextStyles.t16(
                                  color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
