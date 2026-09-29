import 'package:doctor_hunt/core/app_theme/app_colors.dart';
import 'package:doctor_hunt/core/router/app_route_name.dart';
import 'package:doctor_hunt/core/widgets/Custom_btn.dart';
import 'package:doctor_hunt/features/presentation/controller/auth/auth_cubit.dart';
import 'package:doctor_hunt/features/presentation/controller/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../i18n/strings.g.dart';

class Register extends StatelessWidget {
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.t.auth.signUp;
    final theme = Theme.of(context);
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 152),
                        Text(text.title, style: theme.textTheme.titleMedium),
                        SizedBox(height: 15),
                        Text(
                          textAlign: TextAlign.center,
                          text.subtitle,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 67),
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
                                  onPressed: () async {
                                    await cubit.signInWithGoogle(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 7.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/google.svg",
                                          width: 18,
                                          height: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Google",
                                          style: theme.textTheme.labelMedium,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 34),
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
                                  controller: cubit.nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return text.enterName;
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    hintText: text.name,
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
                                  controller: cubit.emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return text.enterEmail;
                                    } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                    ).hasMatch(value)) {
                                      return text.enterValidEmail;
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    hintText: text.email,
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
                                      return text.enterPassword;
                                    } else if (value.length < 6) {
                                      return text.passwordMinLength;
                                    } else if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                    ).hasMatch(value)) {
                                      return text.passwordRules;
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  obscureText: !cubit.isVisible,
                                  decoration: InputDecoration(
                                    hintText: text.password,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            RadioGroup<bool>(
                              groupValue: cubit.isAgree ? true : null,
                              onChanged: (value) {
                                cubit.onChangeAgree();
                              },
                              child: Radio<bool>(
                                toggleable: true,
                                value: true,
                                fillColor: WidgetStateProperty.fromMap(
                                  <WidgetStatesConstraint, Color>{
                                    WidgetState.selected: Colors.blue,
                                    WidgetState.disabled: Colors.grey.shade900,
                                  },
                                ),
                              ),
                            ),
                            Text(
                              text.agreeTerms,
                              style: theme.textTheme.labelSmall,
                            ),
                          ],
                        ),
                        SizedBox(height: 54),
                        CustomBtn(
                          title: text.button,
                          textSize: 18,

                          onPress: cubit.isAgree
                              ? () async {
                                  await cubit.createAccount(context);
                                }
                              : null,
                          isLoading: cubit.isLoading,
                        ),
                        SizedBox(height: 17),
                        Text.rich(
                          TextSpan(
                            text: text.haveAccount,
                            children: [
                              TextSpan(
                                text: text.logIn,
                                // style:
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RouteName.login,
                                    );
                                  },
                              ),
                            ],
                          ),
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 46),
                      ],
                    ),
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
