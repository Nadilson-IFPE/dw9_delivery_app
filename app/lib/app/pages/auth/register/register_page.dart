import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  bool _tffPassword = false;

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  void _showPassword() {
    setState(() {
      _tffPassword = !_tffPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            register: showLoader,
            error: () {
              hideLoader();
              showError('Erro ao registrar usuário!');
            },
            success: () {
              hideLoader();
              showSuccess('Cadastro realizado com sucesso!');
              Navigator.pop(context);
            });
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Nome')),
                    controller: _nameEC,
                    validator: Validatorless.required(
                        'O campo Nome é de preenchimento obrigatório!'),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(label: Text('E-mail')),
                    controller: _emailEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                            'O campo E-mail é de preenchimento obrigatório!'),
                        Validatorless.email('E-mail inválido!'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Senha'),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _showPassword();
                        },
                        child: Icon(
                          _tffPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    obscureText: !_tffPassword,
                    controller: _passwordEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                            'O campo Senha é de preenchimento obrigatório!'),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caracteres!'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Confirmar Senha'),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _showPassword();
                        },
                        child: Icon(
                          _tffPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    obscureText: !_tffPassword,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                            'A confirmação de Senha é de preenchimento obrigatório!'),
                        Validatorless.compare(
                            _passwordEC, 'Senhas não conferem!'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: DeliveryButton(
                      label: 'Cadastrar',
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                              _nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
