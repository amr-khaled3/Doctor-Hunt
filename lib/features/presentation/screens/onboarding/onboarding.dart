import 'package:doctor_hunt/core/app_theme/app_colors.dart';
import 'package:doctor_hunt/features/presentation/controller/onboarding/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/onboarding/onboarding_cubit.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (BuildContext context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: PageView.builder(
                controller: cubit.pageController,
                onPageChanged: cubit.onPageChange,
                itemCount: cubit.onboardingData.length,

                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {
                  final item = cubit.onboardingData[index];

                  return SizedBox(
                    width: size.width,
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Positioned(
                          top: -20,
                          left: index == 1 ? null : -104,
                          right: index == 1 ? -104 : null,
                          child: Container(
                            width: size.width * 0.9,
                            height: size.width * 0.9,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(360),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                          ),
                          child: Column(
                            children: [
                              const Spacer(),

                              SizedBox(height: size.height * 0.04),

                              SizedBox(
                                height: size.height * 0.43,
                                width: double.infinity,
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(height: size.height * 0.035),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.055,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.07,
                                      ),
                                    ),

                                    SizedBox(height: size.height * 0.018),

                                    Text(
                                      item.description,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                        fontSize: size.width * 0.035,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    SizedBox(height: size.height * 0.035),

                                    SizedBox(
                                      width: double.infinity,
                                      height: size.height * 0.065,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          cubit.getNextCard(context);
                                        },
                                        child: Text(
                                          "Next",
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.045,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: size.height * 0.018),

                                    GestureDetector(
                                      onTap: () {
                                        cubit.skip(context);
                                      },
                                      child: Text(
                                        "Skip",
                                        style: GoogleFonts.rubik(
                                          fontSize: size.width * 0.035,
                                          fontWeight: FontWeight.w400,
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
