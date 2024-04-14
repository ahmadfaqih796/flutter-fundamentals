import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:project_1/src/components/forms/form_input.dart';
import 'package:project_1/src/widgets/navbar/base_appbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _register() {
    // Mendapatkan nilai dari FormBuilderState
    final formState = _formKey.currentState;

    // Mengecek apakah formulir valid sebelum mengakses nilainya
    if (formState != null && formState.validate()) {
      // Mendapatkan nilai email dari formulir
      final emailValue = formState.value['email'] as String?;

      // Melakukan penanganan nilai email sesuai kebutuhan
      if (emailValue != null) {
        print('Email: $emailValue');
        // Lakukan apa pun yang perlu Anda lakukan dengan nilai email
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarV1(title: "Register"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register'),
            const SizedBox(height: 16),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: const [
                    FormInput(
                      attribute: 'email',
                      label: 'Email',
                      hintText: 'Enter your email',
                      icon: Icons.email,
                      // onChanged:(value) => _handleEmailChange,
                    ),
                    SizedBox(height: 32),
                    FormInput(
                      attribute: 'password',
                      label: 'Password',
                      hintText: 'Enter your password',
                      icon: Icons.lock,
                      // onChanged:(value) => _handlePasswordChange,
                    ),
                    SizedBox(height: 32),
                  ],
                )),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
