import 'package:doctor_hunt/core/app_theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/Custom_btn.dart';
import 'package:doctor_hunt/features/presentation/controller/auth/auth_cubit.dart';
import 'package:doctor_hunt/features/presentation/controller/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (BuildContext context, state) {
          final cubit = context.read<AuthCubit>();

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
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Spacer(flex: 3),
                      Text(
                        "Welcome back",
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        textAlign: TextAlign.center,
                        "You can search course, apply course and find \nscholarship for abroad studies",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.labelColor,
                        ),
                      ),
                      Spacer(flex: 2),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(12),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 7.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/google.svg",
                                        width: 18,
                                        height: 18,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Google",
                                        style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          color: AppColors.labelColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(12),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 7,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/facebook_icon.svg",
                                        width: 19,
                                        height: 19,
                                        colorFilter: const ColorFilter.mode(
                                          Color(0xff3B5998),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Facebook",
                                        style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          color: AppColors.labelColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Form(
                        key: cubit.formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 1),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: cubit.emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter email";
                                  } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                  ).hasMatch(value)) {
                                    return "Please enter valid email";
                                  } else {
                                    return null;
                                  }
                                },
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0x29677294),
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0x29677294),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0x29677294),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 1),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: cubit.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter password";
                                  } else if (value.length < 6) {
                                    return "Password length must be at least 6 characters";
                                  } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                  ).hasMatch(value)) {
                                    return "password should contain at least one upper case, \n at least one lower case, at least one digit, \n at least one Special character and Must be at least 8 characters in length";
                                  } else {
                                    return null;
                                  }
                                },
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                obscureText: !cubit.isVisible,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0x29677294),
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => cubit.onChangeVisibility(),
                                    icon: cubit.isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0x29677294),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: const Color(0x29677294),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Spacer(flex: 1),
                      CustomBtn(
                        title: "Login",
                        textSize: 18,

                        onPress: () { cubit.login(context);}
                      ),

                      SizedBox(height: 19,),
                      Text("Forgot password", style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),),
                      Spacer(flex: 3),
                      Text.rich(
                        TextSpan(
                          text: "Don’t have an account? ",
                          children: [
                            TextSpan(
                              text: " Join us",
                              // style:
                              // recognizer:
                            ),
                          ],
                        ),
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
