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

class EditProjectFragment extends StatefulWidget {
  const EditProjectFragment({super.key});

  @override
  State<EditProjectFragment> createState() => _EditProjectFragmentState();
}

class _EditProjectFragmentState extends State<EditProjectFragment> {
  late final TextEditingController _titleController = TextEditingController();
  late final TextEditingController _dueDateController = TextEditingController();
  late final TextEditingController _stepController = TextEditingController();
  final DateFormat dueDateFormat = DateFormat('dd-MM-yyyy');

  DateTime? selectedDueDate;
  ProjectRoutine? selectedRoutine;
  List<String> steps = [];

  bool get saveEnabled =>
      _titleController.text.isNotEmpty &&
      selectedDueDate != null &&
      steps.isNotEmpty &&
      steps.isNotEmpty &&
      selectedRoutine != null;

  @override
  Widget build(BuildContext context) {
    var isMobile = DeviceUtils.isMobile(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  color: AppColors.darkSurface100,
                  child: Container(
                      height: isMobile ? 322 : 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.darkSurface200)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.iconScenes,
                              height: isMobile ? 56 : 70),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.darkSurface200),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(tr(LocaleKeys.project_add_scene),
                                style: AppTextStyles.t12()),
                          )
                        ],
                      )),
                ),
              ),
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
                            child: InkWell(
                          onTap: _selectDueDate,
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
                                    padding: const EdgeInsets.only(right: 8.0),
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
                              )),
                        )),
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
                              onChanged: (value) {
                                setState(() {
                                  selectedRoutine = value;
                                });
                              },
                              onSaved: (value) {
                                selectedRoutine = value;
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
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 48,
                      child: TextField(
                        controller: _stepController,
                        decoration: InputDecoration(
                            prefixIconColor: AppColors.lightSurface500,
                            hintText: tr(LocaleKeys.project_step_add_hint),
                            hintStyle: AppTextStyles.t16(
                                color: AppColors.lightSurface500,
                                fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: _stepController.text.isEmpty
                                  ? BorderSide.none
                                  : const BorderSide(
                                      color: Colors.white, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: _stepController.text.isEmpty
                                  ? BorderSide.none
                                  : const BorderSide(
                                      color: Colors.white, width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: _stepController.text.isEmpty
                                  ? BorderSide.none
                                  : const BorderSide(
                                      color: Colors.white, width: 0.5),
                            ),
                            fillColor: AppColors.darkSurface200,
                            filled: true,
                            isDense: false,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            suffixIcon: _stepController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Colors.white),
                                    onPressed: () {
                                      if (_stepController.text.isNotEmpty) {
                                        setState(() {
                                          steps.add(_stepController.text);
                                          _stepController.clear();
                                        });
                                      }
                                    },
                                  )),
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: AppTextStyles.t16(color: Colors.white),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      tr(LocaleKeys.project_steps).toUpperCase(),
                      style: AppTextStyles.t14(
                          color: Colors.white.withOpacity(0.5)),
                    ),
                    const SizedBox(height: 8),
                    if (steps.isEmpty)
                      Text(
                        tr(LocaleKeys.project_no_steps),
                        style: AppTextStyles.t16(
                            color: Colors.white.withOpacity(0.5)),
                      ),
                    if (steps.isNotEmpty)
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: steps.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            var item = steps[index];
                            return InkWell(
                              onTap: () {},
                              child: ListTile(
                                title: Text(
                                  item,
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
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            color: AppColors.darkSurface100,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.darkSurface100,
                      border: Border.all(
                          color: AppColors.darkSurface200, width: 0.5),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.darkSurface100),
                        foregroundColor:
                            MaterialStateProperty.all(AppColors.darkSurface100),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        tr(LocaleKeys.project_cancel),
                        style: AppTextStyles.t16(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.lightSurface400,
                      border: Border.all(
                          color: AppColors.darkSurface200, width: 0.5),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (saveEnabled) {
                          BlocProvider.of<ProjectBloc>(context).add(AddProjects(
                              title: _titleController.text,
                              dueDate: selectedDueDate!,
                              routine: selectedRoutine!,
                              steps: steps
                                  .map((e) => ProjectStep(
                                      content: e, isFinished: false))
                                  .toList(),
                              scene: null)); // TODO select scene
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.lightSurface400),
                        overlayColor: MaterialStateProperty.all(
                            AppColors.lightSurface400),
                      ),
                      child: Text(
                        tr(LocaleKeys.project_save),
                        style: AppTextStyles.t16(
                            color: saveEnabled
                                ? Colors.black
                                : AppColors.lightSurface600,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _selectDueDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((value) {
      if (value != null) {
        setState(() {
          selectedDueDate = value;
          _dueDateController.text = dueDateFormat.format(selectedDueDate!);
        });
      }
    });
  }
}
