import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/auth_controller.dart';
import 'package:project_1/services/api_service.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final _authController = Get.put(AuthController());
  final ApiService _apiService = ApiService();

  void _submitForm(Map<String, dynamic> formData) async {
    String name = formData['name'];
    String email = formData['email'];
    String password = formData['password'];

    print('Name: $name, Email: $email, Password: $password');

    try {
      // Panggil fungsi register dari AuthController
      await _authController.register(name, email, password);
      // Navigasi ke layar sukses setelah berhasil mendaftar
      // Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
    } catch (e) {
      // Tampilkan pesan kesalahan jika ada
      print('Failed to register: $e');
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Name'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_fbKey.currentState != null &&
                      _fbKey.currentState!.saveAndValidate()) {
                    _submitForm(_fbKey.currentState!.value);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
