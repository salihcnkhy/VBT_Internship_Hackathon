import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:vbt_hackathon/core/extensions/build_context_extension.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool notificationsEnabled = true;
  bool notificationsValue = true;
  bool changePasswordValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScaffoldBody,
    );
  }

  SettingsList get buildScaffoldBody {
    return SettingsList(
      backgroundColor: context.colorScheme.background,
      sections: [
        buildSettingsSectionCommon,
        buildSettingsSectionAccount,
        buildSettingsSectionSecurity,
        buildSettingsSectionMisc
      ],
    );
  }

  SettingsSection get buildSettingsSectionCommon {
    return SettingsSection(
      title: 'Genel',
      tiles: [
        SettingsTile(
          title: 'Dil',
          subtitle: 'Türkçe',
          leading: Icon(Icons.language, color: context.colorScheme.primary),
        ),
      ],
    );
  }

  SettingsSection get buildSettingsSectionAccount {
    return SettingsSection(
      title: 'Hesap',
      tiles: [
        SettingsTile(
          title: 'Email',
          leading: Icon(Icons.email, color: context.colorScheme.primary),
        ),
        SettingsTile(
          title: 'Parola',
          leading: Icon(Icons.lock, color: context.colorScheme.primary),
        ),
        SettingsTile(
          title: 'Oturumu kapa',
          leading: Icon(Icons.exit_to_app, color: context.colorScheme.primary),
        ),
      ],
    );
  }

  SettingsSection get buildSettingsSectionSecurity {
    return SettingsSection(
      title: 'Güvenlik',
      tiles: [
        SettingsTile.switchTile(
          title: 'Parola değiştir',
          leading: Icon(Icons.lock, color: context.colorScheme.primary),
          switchValue: changePasswordValue,
          onToggle: (bool value) {
            setState(() {
              changePasswordValue = !changePasswordValue;
            });
          },
        ),
        SettingsTile.switchTile(
          title: 'Bildirimleri aç',
          enabled: notificationsEnabled,
          leading: Icon(Icons.notifications_active, color: context.colorScheme.primary),
          switchValue: notificationsValue,
          onToggle: (bool value) {
            setState(() {
              notificationsValue = !notificationsValue;
            });
          },
        ),
      ],
    );
  }

  SettingsSection get buildSettingsSectionMisc {
    return SettingsSection(
      title: 'Diğer',
      tiles: [
        SettingsTile(
            title: 'Hizmet kullanım şartları',
            leading: Icon(Icons.description, color: context.colorScheme.primary)),
        SettingsTile(
            title: 'Açık kaynak lisansları',
            leading: Icon(Icons.collections_bookmark, color: context.colorScheme.primary)),
      ],
    );
  }
}
