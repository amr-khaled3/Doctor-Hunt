import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_route_name.dart';
import '../../widgets/onboarding/onboarding_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(InitState());

  final PageController pageController = PageController();

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: "assets/Images/onboarding_image1.png",
      title: "Find Trusted Doctors",
      description:
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
    ),
    OnboardingModel(
      image: "assets/Images/onboarding_image2.png",
      title: "Choose Best Doctors",
      description:
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
    ),
    OnboardingModel(
      image: "assets/Images/onboarding_image3.png",
      title: "Easy Appointments",
      description:
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
    ),
  ];

  int pageViewIndex = 0;

  void onPageChange(int index){
    pageViewIndex = index;
    emit(OnPageChangeState());
  }

  void getNextCard(BuildContext context) async{
    if (pageViewIndex < onboardingData.length - 1) {
      await pageController.animateToPage(
        pageViewIndex + 1,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    }
    else {
      Navigator.pushReplacementNamed(context, RouteName.role);
    }
  }

  void skip(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouteName.role);
  }


  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }


}
