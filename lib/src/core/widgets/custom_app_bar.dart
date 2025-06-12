import 'dart:io' show Platform;
import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    double super.elevation = 2,
    String? title,
    IconData? leadingIcon,
    IconButton? suffixIcon,
    VoidCallback? onSettingsPressed,
    PopupMenuButton? popupMenuButton,
    List<Widget>? actions,
    Widget? leadingButton,
  }) : super(
          backgroundColor: ColorsConstants.primaryColor,
          centerTitle: true,
          title: Text(
            title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading:
              leadingButton ?? (leadingIcon != null ? Icon(leadingIcon) : null),
          actions: [
            ...?_buildActions(suffixIcon, onSettingsPressed, popupMenuButton),
            ...?actions,
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        );

  static List<Widget>? _buildActions(IconButton? suffixIcon,
      VoidCallback? onSettingsPressed, PopupMenuButton? popupMenuButton) {
    List<Widget> actions = [];

    if (suffixIcon != null) {
      actions.add(suffixIcon);
    }

    if (popupMenuButton != null) {
      actions.add(popupMenuButton);
    }

    if (onSettingsPressed != null && popupMenuButton == null) {
      if (Platform.isIOS) {
        actions.add(
          GestureDetector(
            onTap: onSettingsPressed,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        );
      } else {
        actions.add(
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'settings') {
                onSettingsPressed();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'settings',
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Configurações',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ];
            },
            color: Colors.white,
            offset: const Offset(0, kToolbarHeight),
          ),
        );
      }
    }

    return actions.isNotEmpty ? actions : null;
  }
}
