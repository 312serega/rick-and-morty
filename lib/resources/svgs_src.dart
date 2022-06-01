import 'package:flutter_svg/svg.dart';

import 'app_colors.dart';

class SvgsSrc {
  static const search = 'assets/svgs/search.svg';
  static const filter = 'assets/svgs/filter.svg';
  static const filterClear = 'assets/svgs/filter_clear.svg';
  static const grid = 'assets/svgs/grid.svg';
  static const list = 'assets/svgs/list.svg';
  static const palette = 'assets/svgs/palette.svg';

  static final SvgPicture character =
      SvgPicture.asset('assets/svgs/character.svg');
  static final SvgPicture characterActive = SvgPicture.asset(
      'assets/svgs/character.svg',
      color: AppColors.colorSuccess);
  static final SvgPicture location =
      SvgPicture.asset('assets/svgs/location.svg');
  static final SvgPicture locationActive = SvgPicture.asset(
      'assets/svgs/location.svg',
      color: AppColors.colorSuccess);
  static final SvgPicture episode = SvgPicture.asset('assets/svgs/episode.svg');
  static final SvgPicture episodeActive = SvgPicture.asset(
      'assets/svgs/episode.svg',
      color: AppColors.colorSuccess);
  static final SvgPicture settings =
      SvgPicture.asset('assets/svgs/Settings.svg');
  static final SvgPicture settingsActive = SvgPicture.asset(
      'assets/svgs/Settings.svg',
      color: AppColors.colorSuccess);
}
