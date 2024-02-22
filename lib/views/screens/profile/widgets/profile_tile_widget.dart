import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:zapizza/common/app_style.dart';
import 'package:zapizza/common/reusable_text.dart';

import '../../../../constants/constants.dart';

class ProfileTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const ProfileTileWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(icon, size: 18),
      title: ReusableText(
        text: title,
        style: appStyle(15, kGray, FontWeight.normal),
      ),
      trailing: title != "Settings"
          ? const Icon(
              AntDesign.right,
              size: 20,
            )
          : SvgPicture.asset(
              'assets/icons/usa.svg',
              width: 20.w,
              height: 25.h,
            ),
    );
  }
}
