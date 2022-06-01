import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/screens/user_screen/user_screen.dart';

import '../../../resources/app_colors.dart';

// ignore: must_be_immutable
class UserItem extends StatelessWidget {
  UserItem({
    Key? key,
    required this.id,
    required this.status,
    required this.name,
    required this.speciesGender,
    required this.image,
    required this.type,
  }) : super(key: key);

  int id;
  String status;
  String name;
  String speciesGender;
  String image;
  bool type;

  cropName() {
    if (name.length > 16) return name.substring(0, 16) + '...';
    return name;
  }

  cropSpeciesGender() {
    if (speciesGender.length > 20) {
      return speciesGender.substring(0, 20) + '...';
    }
    return speciesGender;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(id: id),
          ),
        );
      },
      child: type
          ? ListItem(
              image: image,
              status: status,
              name: cropName(),
              speciesGender: cropSpeciesGender(),
            )
          : GridItem(
              image: image,
              status: status,
              name: cropName(),
              speciesGender: cropSpeciesGender(),
            ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.image,
    required this.status,
    required this.name,
    required this.speciesGender,
  }) : super(key: key);

  final String image;
  final String status;
  final String name;
  final String speciesGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: image,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              imageUrl: image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, prgoress) =>
                  CircularProgressIndicator(value: prgoress.progress),
              height: 74,
              width: 74,
            ),
          ),
        ),
        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status.toUpperCase(),
              style: TextStyle(
                color: status == 'Alive' ? AppColors.colorSuccess : Colors.red,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            Text(
              speciesGender,
              style: const TextStyle(
                color: AppColors.colorSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
    required this.image,
    required this.status,
    required this.name,
    required this.speciesGender,
  }) : super(key: key);

  final String image;
  final String status;
  final String name;
  final String speciesGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: image,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, prgoress) =>
                  CircularProgressIndicator(value: prgoress.progress),
              height: 120,
              width: 120,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 18),
            Text(
              status,
              style: TextStyle(
                color: status == 'Alive' ? AppColors.colorSuccess : Colors.red,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              speciesGender,
              style: const TextStyle(
                color: AppColors.colorSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
