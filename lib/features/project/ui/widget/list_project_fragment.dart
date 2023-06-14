import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pixelfield_flutter/config/text_styles.dart';
import 'package:test_pixelfield_flutter/features/project/bloc/project_bloc.dart';
import 'package:test_pixelfield_flutter/features/project/ui/widget/project_list_item.dart';
import 'package:test_pixelfield_flutter/generated/locale_keys.g.dart';

import '../../../../config/color_styles.dart';
import '../project_routes.dart';

class ListProjectFragment extends StatefulWidget {
  final GlobalKey<NavigatorState> subNavigatorKey;

  const ListProjectFragment({super.key, required this.subNavigatorKey});

  @override
  State<ListProjectFragment> createState() => _ListProjectFragmentState();
}

class _ListProjectFragmentState extends State<ListProjectFragment>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  late ProjectBloc bloc = BlocProvider.of<ProjectBloc>(context);

  @override
  void initState() {
    super.initState();
    tabController.addListener(() {
      setState(() {});
    });
    bloc.add(LoadProjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    tr(LocaleKeys.home_title_project),
                    style: AppTextStyles.t16(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(widget.subNavigatorKey.currentContext!)
                          .pushNamedAndRemoveUntil(
                              ProjectRoutes.create,
                              (route) =>
                                  route.settings.name == ProjectRoutes.list);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.lightSurface500,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              indicatorPadding: const EdgeInsets.only(top: 38),
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.primaryGradientRev,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.clamp,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              labelStyle: AppTextStyles.t16(),
              unselectedLabelStyle:
                  AppTextStyles.t16(color: AppColors.lightSurface500),
              tabs: [
                LocaleKeys.project_status_progress,
                LocaleKeys.project_status_completed,
              ].map((titleKey) {
                return Tab(
                  child: Text(tr(titleKey)),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: AppColors.lightSurface500,
                            hintText: tr(LocaleKeys.project_search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: AppColors.darkSurface200,
                            filled: true,
                            contentPadding: EdgeInsets.zero)),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.darkSurface200,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                      color: AppColors.lightSurface500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: state.projects.length,
                itemBuilder: (context, index) {
                  var project = state.projects[index];
                  return InkWell(
                      onTap: () {
                        Navigator.of(widget.subNavigatorKey.currentContext!)
                            .pushNamedAndRemoveUntil(
                          ProjectRoutes.view,
                          (route) => route.settings.name == ProjectRoutes.list,
                          arguments: project,
                        );
                      },
                      child: ProjectListItem(project: project));
                },
              );
            }),
          ),
        ],
      )),
    );
  }
}
