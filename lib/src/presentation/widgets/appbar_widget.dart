import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final Widget title;
  final Color? backgroundColor;
  final double? elevation;
  final bool? centerTitle;

  const AppBarWidget({
    Key? key,
    this.backgroundColor = Colors.white,
    this.leading,
    required this.title,
    this.elevation = 0.0,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
          child: AppBar(
            centerTitle: centerTitle,
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
            elevation: elevation,
            leading: leading,
            title: title,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size(double.infinity, AppBar().preferredSize.height);
}