import 'package:doctor_hunt/core/app_theme/app_colors.dart';
import 'package:doctor_hunt/features/presentation/controller/admin/admin_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => AdminCubit(),
      child: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          final cubit = context.read<AdminCubit>();
          return  Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.navIndex,
              onTap: cubit.changeNav,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  label: "Doctors",
                  icon: SvgPicture.asset(
                    "assets/icons/medical_icon.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.slate400,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/medical_icon.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                BottomNavigationBarItem(
                  label: "Appointments",
                  icon: SvgPicture.asset(
                    "assets/icons/appointments_icon.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.slate400,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/appointments_icon.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                BottomNavigationBarItem(
                  label: "Settings",
                  icon: SvgPicture.asset(
                    "assets/icons/settings_icon.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.slate400,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/icons/settings_icon.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              icon: const Icon(Icons.add),
              label: const Text("Add Doctor"),
            ),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, color: Color(0xFF0B6B4F)),
              ),

              title: Center(
                child: Text("Doctors", style: theme.textTheme.titleSmall),
              ),

              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_rounded),
                  color: Color(0xff475569),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12, start: 4),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 16,
                      child: Text(
                        'A',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24.0,
                              horizontal: 12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Active Doctors",
                                  style: theme.textTheme.labelSmall!.copyWith(
                                    color: Color(0xff94A3B8),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    color: Color(0xff1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24.0,
                              horizontal: 12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Total Doctors",
                                  style: theme.textTheme.labelSmall!.copyWith(
                                    color: Color(0xff94A3B8),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    color: Color(0xff1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search doctors...",
                        hintStyle: theme.inputDecorationTheme.hintStyle!.copyWith(
                          color: Color(0xff94A3B8),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/icons/Container.svg",
                            width: 90,
                            height: 90,
                          ),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                color: AppColors.primaryColor,
                                Icons.add_circle_rounded,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "No Doctors Found",
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "There are currently no doctors registered on\nDoctor Hunt. Add your first doctor to get started.",
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: AppColors.slate400,
                    ),
                  ),

                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
