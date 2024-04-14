import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  void _submitForm(Map<String, dynamic> formData) {
    // Handle submit logic here, for example:
    String name = formData['name'];
    String email = formData['email'];
    String password = formData['password'];

    // Here you can perform further actions, like sending data to a server, etc.
    print('Name: $name, Email: $email, Password: $password');

    // After successful submission, you might want to navigate to another screen
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(labelText: 'Name'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              FormBuilderTextField(
                name: 'password',
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // if (_fbKey.currentState != null &&
                  //     _fbKey.currentState!.saveAndValidate()) {
                  // }
                  _submitForm(_fbKey.currentState!.value);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
