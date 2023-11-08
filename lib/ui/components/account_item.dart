import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'components.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.icon,
    required this.title,
    required this.screen,
    this.onTap,
    this.isLogin,
  });
  final String icon;
  final String title;
  final Widget screen;
  final bool? isLogin;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isLogin == false
          ? () {
              // Util.unLoginedBottomSheet(context);
            }
          : () {
              // PersistentNavBarNavigator.pushNewScreen(
              //   context,
              //   screen: screen,
              //   withNavBar: false,
              // );
              // if (onTap != null) {
              //   onTap!();
              // }
            },
      leading: getDefaultIcon(image: icon, height: 5.5, width: 5.5),
      title: TextBuilder(
        text: title,
        verticalPadding: 0,
        color: AppColors.white,
        size: AppFontSizes.kS4,
        // alignment: AlignmentDirectional.centerStart,
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          size: AppFontSizes.kS4, color: AppColors.cyan),
    );
  }
}
