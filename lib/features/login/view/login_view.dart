import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:managementexample/features/login/cubit/login_cubit.dart';
import 'package:managementexample/features/login/service/login_service.dart';
import 'package:managementexample/product/widgets/button/custom_elevated_button.dart';
import 'package:managementexample/product/widgets/input/custom_form_input_password.dart';
import 'package:managementexample/product/widgets/input/login_custom_form_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passWord = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userName.dispose();
    _passWord.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginService()),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.lightBlueAccent,
            ],
          )),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: FittedBox(
                          child: Text(
                        "Management App",
                        style: Theme.of(context).textTheme.displayLarge,
                      )),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginInputFormField(
                    controller: _userName,
                    title: "Kullanıcı Adı",
                    onSaved: (value) {
                      _userName.text = value ?? 'enesduru';
                    },
                    validator: FormBuilderValidators.required(
                        errorText: "Bu alan zorunludur."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginPasswordCustomField(
                    controller: _passWord,
                    title: "Şifre",
                    onSaved: (value) {
                      _passWord.text = value ?? 'Test.1234';
                    },
                    validator: FormBuilderValidators.required(
                        errorText: "Bu alan zorunludur."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(builder: (context) {
                    final loginCubit = BlocProvider.of<LoginCubit>(context);
                    return CustomElevationButton(
                        isCircle: true,
                        onPressed: () async {
                          if (_globalKey.currentState != null &&
                              _globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            await loginCubit.postLogin(
                                userName: _userName.text,
                                password: _passWord.text);
                          }
                        },
                        title: Text("Giriş Yap"));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
