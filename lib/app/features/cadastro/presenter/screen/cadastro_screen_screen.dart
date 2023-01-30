import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/common/widgets/input_email_widget.dart';
import 'package:app_acai/app/common/widgets/input_password_widget.dart';
import 'package:app_acai/app/features/cadastro/presenter/controllers/cadastro_cubit.dart';
import 'package:app_acai/app/features/cadastro/presenter/controllers/cadastro_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final cubit = GetIt.I.get<CadastroCubit>();

  final _formKey = GlobalKey<FormState>();
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  bool isHiddenText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CadastroCubit, CadastroState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is CadastroSucesso) {
            Navigator.pushNamed(context, RoutesApp.home);
            return;
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bkg_login.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputFormEmail(
                  textController: _textControllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'user@email.com',
                  label: 'Email',
                ),
                const SizedBox(height: 15),
                InputFormPassword(
                  label: 'Senha',
                  obscureText: isHiddenText,
                  textController: _textControllerPassword,
                  keyboardType: TextInputType.visiblePassword,
                  onTap: () {
                    setState(() {
                      isHiddenText = !isHiddenText;
                    });
                  },
                  childIcon: Icon(
                    isHiddenText ? Icons.visibility : Icons.visibility_off,
                    color: ColorsApp.purpleSecondary,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        cubit.cadastro(
                          UserModel(
                            email: _textControllerEmail.text,
                            password: _textControllerPassword.text,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.green,
                    ),
                    child: const Text(
                      'CADASTRA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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
