import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/screens/user_settings/user_edit_data.dart';

import '../../resources/app_colors.dart';

class UserEdit extends StatelessWidget {
  const UserEdit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGray,
      appBar: AppBar(
        backgroundColor: AppColors.colorGray,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text('Редактировать профиль'),
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  // image = await _picker.pickImage(source: ImageSource.gallery);
                },
                child: const Text(
                  'Изменить фото',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: AppColors.colorBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'профиль'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    height: 1.6,
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorSecondary,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Изменить ФИО',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  subtitle: const Text(
                    'Oleg Belotserkovsky',
                    style: TextStyle(
                        color: AppColors.colorSecondary, fontSize: 14),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserEditData(),
                      ),
                    );
                  },
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Логин',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  subtitle: Text(
                    'Rick',
                    style: TextStyle(
                        color: AppColors.colorSecondary, fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
