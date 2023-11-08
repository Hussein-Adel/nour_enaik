import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class GeometricalAvatar extends StatelessWidget {
  const GeometricalAvatar({
    Key? key,
    this.child,
    this.radius,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.onTap,
    this.path,
    this.url,
    this.fit,
    this.haveBorder = true,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);
  final double? radius;
  final double? borderWidth;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final String? path;
  final String? url;
  final BoxFit? fit;
  final bool haveBorder;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        height: height ?? radius,
        width: width ?? radius,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 35.sp)),
          border: haveBorder
              ? Border.all(
                  color: borderColor ?? AppColors.cyan,
                  width: borderWidth ?? 1,
                )
              : null,
          color: backgroundColor ?? AppColors.gray.withOpacity(0.72),
          image: path != null
              ? DecorationImage(
                  image: Image.asset(path!).image, fit: BoxFit.fill)
              : url != null
                  ? DecorationImage(
                      image: url!.split('.').last == 'svg'
                          ? Svg(
                              url!,
                              source: SvgSource.network,
                            ) as ImageProvider
                          : CachedNetworkImageProvider(url!),
                      fit: fit ?? BoxFit.cover,
                    )
                  : null,
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
