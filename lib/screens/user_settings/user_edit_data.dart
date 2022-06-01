import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/widgets/custom_text_field.dart';

import '../../resources/app_colors.dart';

class UserEditData extends StatelessWidget {
  UserEditData({Key? key}) : super(key: key);
  final name = TextEditingController(text: 'Oleg');
  final surname = TextEditingController(text: 'Belotserkovsky');
  final middleName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        elevation: 0,
        title: const Text('Изменить ФИО'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Имя', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            CustomTextField(
              controller: name,
              hint: 'Имя',
            ),
            const SizedBox(height: 10),
            const Text('Фамилия', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            CustomTextField(
              controller: surname,
              hint: 'Фамилия',
            ),
            const SizedBox(height: 10),
            const Text('Отчество', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            CustomTextField(
              controller: middleName,
              hint: 'Отчество',
            ),
          ],
        ),
      ),
    );
  }
}
