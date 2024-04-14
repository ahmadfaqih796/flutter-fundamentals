import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormInput extends StatelessWidget {
  final String attribute;
  final String label;
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final List<FormFieldValidator>? validators;
  final ValueTransformer? valueTransformer;
  final void Function(dynamic)? onChanged;

  const FormInput({
    Key? key,
    required this.attribute,
    required this.label,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.validators,
    this.valueTransformer,
    this.onChanged,
  }) : super(key: key);

  void _defaultOnChanged(dynamic value) {
    // Lakukan sesuatu dengan nilai input (contoh: cetak ke konsol)
    print('Value changed: $value');
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: attribute,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        icon: icon != null ? Icon(icon) : null,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.greenAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      valueTransformer: valueTransformer,
      onChanged: onChanged ?? _defaultOnChanged,
    );
  }
}
