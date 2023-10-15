import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopLayout;
  final Widget tabletLayout;
  final Widget mobileLayout;
  final Widget? watchLayout;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const ResponsiveWidget(
      {super.key,
      required this.desktopLayout,
      required this.tabletLayout,
      required this.mobileLayout,
      this.watchLayout,
      this.backgroundColor = AppColors.transparent,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: ResponsiveBuilder(builder: (builderContext, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return desktopLayout;
          case DeviceScreenType.tablet:
            return tabletLayout;
          case DeviceScreenType.mobile:
            return mobileLayout;
          case DeviceScreenType.watch:
            return watchLayout ?? mobileLayout;
          default:
            return desktopLayout;
        }
      }),
    );
  }
}
