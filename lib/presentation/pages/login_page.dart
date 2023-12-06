import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_technical_test/presentation/pages/home_page.dart';
import '../../config/methods.dart';
import '../../config/theme.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/checkbox_widget.dart';
import '../widgets/forms_widget.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;
  bool submitEmail = false;
  bool submitPassword = false;
  bool isButtonActive = false;
  final email = TextEditingController();
  final password = TextEditingController();
  bool checkTC = false;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    email.addListener(() {
      setState(() => submitEmail = email.text.isNotEmpty);
    });
    password.addListener(() {
      setState(() => submitPassword = password.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    email.clear();
    password.clear();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, message: state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              buildHeader(context),
              buildForm(),
              buildFooter(context),
            ],
          );
        },
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Column(
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: mainColors,
                  ),
                );
              }
              return CustomFilledButton(
                title: "Login",
                onPressed: () {
                  if (validate(key)) {
                    if (checkTC == true) {
                      context
                          .read<AuthBloc>()
                          .add(AuthDoLogin(email.text, password.text));
                    }
                  }
                },
                icon: Icons.login_rounded,
                backgroundColor: submitEmail && submitPassword && checkTC
                    ? mainColors
                    : greyColor,
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildForm() {
    return Expanded(
      child: Form(
        key: key,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              CustomFormField(
                isShowTitle: false,
                title: "Email",
                needValidate: true,
                controller: email,
              ),
              CustomFormField(
                isShowTitle: false,
                title: "Password",
                needValidate: true,
                obscureText: isHidden,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon: Icon(isHidden ? Icons.lock_outline : Icons.lock_open),
                ),
                controller: password,
                prefixIcon: const Icon(Icons.password),
              ),
              CustomCheckbox(
                value: checkTC,
                onChanged: (value) {
                  setState(() {
                    checkTC = value!;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password".toUpperCase(),
                    style: blackTextStyle.copyWith(
                        fontSize: 12, decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
      decoration: BoxDecoration(
          color: mainColors,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(50))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          appBarHeight(context),
          Text(
            "Back to your Journey",
            style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            textAlign: TextAlign.end,
          ),
          Text(
            "Login now and continue the Adventure!",
            style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
