import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recap_project/core/di/di.dart';
import 'package:recap_project/faetures/home/presentation/cubit/home_cubit.dart';
import 'package:recap_project/faetures/home/presentation/cubit/home_state.dart';
import 'package:recap_project/faetures/home/presentation/widgets/home_actions_row.dart';
import 'package:recap_project/faetures/home/presentation/widgets/home_breadcrumb.dart';
import 'package:recap_project/faetures/home/presentation/widgets/home_empty_state.dart';
import 'package:recap_project/faetures/home/presentation/widgets/department_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getDepartments(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36.h),
                const HomeBreadcrumb(),
                SizedBox(height: 36.h),
                HomeActionsRow(searchController: _searchController),
                SizedBox(height: 24.h),
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomeSuccess) {
                        if (state.departments.isEmpty) {
                          return _searchController.text.isEmpty
                              ? const HomeEmptyState()
                              : Center(
                                  child: Text(
                                    "No matching departments",
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                );
                        }
                        return RefreshIndicator(
                          onRefresh: () => context.read<HomeCubit>().getDepartments(),
                          child: ListView.separated(
                            padding: EdgeInsets.only(bottom: 20.h),
                            itemCount: state.departments.length,
                            separatorBuilder: (context, index) => SizedBox(height: 16.h),
                            itemBuilder: (context, index) => DepartmentCard(dept: state.departments[index]),
                          ),
                        );
                      } else if (state is HomeError) {
                        return Center(child: Text(state.message));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
