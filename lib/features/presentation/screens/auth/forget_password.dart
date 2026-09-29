import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/widgets/Custom_btn.dart';
import '../../../../i18n/strings.g.dart';
import '../../controller/auth/auth_cubit.dart';
import '../../controller/auth/auth_state.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.t.auth.forgotPassword;
    final loginText = context.t.auth.login;
    final cubit = context.read<AuthCubit>();
    final theme = Theme.of(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 130,
                height: 5,
                margin: const EdgeInsets.only(top: 10, bottom: 24),
                decoration: BoxDecoration(
                  color: const Color(0xffC4C4C4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(
                text.title,
                style: theme.textTheme.titleMedium!.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                text.description,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: cubit.emailController,
                keyboardType: TextInputType.emailAddress,
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(hintText: loginText.email),
              ),
              const SizedBox(height: 24),
              CustomBtn(
                title: loginText.kContinue,
                textSize: 18,
                onPress: () {
                },
                isLoading: cubit.isLoading,
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}