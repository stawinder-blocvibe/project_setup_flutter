
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorText;

  const CustomFormInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1D3B1D),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: focusNode.hasFocus
                  ? Colors.yellow
                  : errorText != null
                  ? Colors.red
                  : Colors.yellow.shade700,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  readOnly: readOnly,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  onTap: onTap,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
            ],
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 12),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.redAccent, fontSize: 13),
              textAlign: TextAlign.left,
            ),
          ),
      ],
    );
  }
}


