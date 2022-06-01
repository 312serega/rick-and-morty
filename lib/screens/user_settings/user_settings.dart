import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty/resources/svgs_src.dart';
import 'package:flutter_rick_and_morty/screens/user_settings/user_edit.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';
import '../../widgets/popup.dart';
import '../main_screen/widget/main_vm.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGray,
      appBar: AppBar(
        backgroundColor: AppColors.colorGray,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
        title: const Text('Настройки'),
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: const [
          UserSettingHead(),
          SizedBox(height: 20),
          Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF18374E),
          ),
          SizedBox(height: 36),
          UserDetails(),
        ],
      ),
    );
  }
}

class UserSettingHead extends StatelessWidget {
  const UserSettingHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              width: 74,
              height: 74,
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
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Oleg Belotserkovsky',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Rick',
                  style: TextStyle(
                    color: AppColors.colorSecondary,
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const UserEdit()),
                ),
              );
            },
            child: const Text(
              'Редактировать',
              style: TextStyle(
                color: AppColors.colorBlue,
                fontSize: 16,
                height: 1.42,
                fontWeight: FontWeight.w400,
              ),
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: AppColors.colorBlue,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MainVm>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Внешний вид'.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            height: 1.6,
            fontWeight: FontWeight.w500,
            color: AppColors.colorSecondary,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(SvgsSrc.palette),
          title: const Text(
            'Темная тема',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          subtitle: Text(
            vm.themeTitle,
            style:
                const TextStyle(color: AppColors.colorSecondary, fontSize: 14),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 14,
          ),
          onTap: () {
            showModal(context);
          },
        ),
        const SizedBox(height: 36),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFF18374E),
        ),
        const SizedBox(height: 36),
        Text(
          'О приложении'.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            height: 1.6,
            fontWeight: FontWeight.w500,
            color: AppColors.colorSecondary,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
            letterSpacing: 0.5,
            height: 1.53,
          ),
        ),
        const SizedBox(height: 36),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFF18374E),
        ),
        const SizedBox(height: 36),
        Text(
          'Версия приложения'.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            height: 1.6,
            fontWeight: FontWeight.w500,
            color: AppColors.colorSecondary,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Rick & Morty  v1.0.0',
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
            letterSpacing: 0.5,
            height: 1.53,
          ),
        ),
      ],
    );
  }
}
