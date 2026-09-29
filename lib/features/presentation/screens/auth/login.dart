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
import 'forget_password.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.t.auth.login;
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
                        SizedBox(height: 127),
                        Text(text.title, style: theme.textTheme.titleMedium),
                        SizedBox(height: 15),
                        Text(
                          textAlign: TextAlign.center,
                          text.subtitle,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 78),
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
                        SizedBox(height: 37),
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
                        SizedBox(height: 32),
                        CustomBtn(
                          title: text.button,
                          textSize: 18,

                          onPress: () async {
                            await cubit.login(context);
                          },
                          isLoading: cubit.isLoading,
                        ),

                        SizedBox(height: 19),
                        Text.rich(
                          TextSpan(
                            text: text.forgotPassword,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  showDragHandle: false,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: cubit,
                                      child: BlocBuilder<AuthCubit, AuthState>(
                                        builder: (context, state) {
                                          return SafeArea(
                                            child: ForgotPasswordSheet(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                          ),
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 130),
                        Text.rich(
                          TextSpan(
                            text: text.noAccount,
                            children: [
                              TextSpan(
                                text: text.joinUs,
                                // style:
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RouteName.register,
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
