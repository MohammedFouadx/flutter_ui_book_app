import 'package:dark_mode_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final SettingsController settingsController;

  const CustomAppBar({Key? key , required this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                hintText: "Search book here...",
                //hintStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                ),
                prefixIcon:  IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.search_outlined),
                  color: Theme.of(context).colorScheme.onSurface,
                  iconSize: 30,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0)
              ),
            ),
          ),
          IconButton(
              onPressed: (){
                settingsController.updateThemeMode(
                  settingsController.themeMode == ThemeMode.light
                      ?ThemeMode.dark
                      :ThemeMode.light
                );
              },
              icon: Icon(settingsController.themeMode == ThemeMode.light
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded)
          ),
        ],

      ),
    );
  }
}
