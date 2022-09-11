import 'package:flutter/material.dart';

class SerachForm extends StatefulWidget {
  const SerachForm({super.key});

  @override
  State<SerachForm> createState() => _SerachFormState();
}

class _SerachFormState extends State<SerachForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: Form(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: "اكتب كلمة البحث هنا",
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
