import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
      appBar: buildScaffoldAppBar(),
      body: buildScaffoldBody(),
    );
  }

  AppBar buildScaffoldAppBar() {
    return AppBar(
      centerTitle: true,
      title: buildAppBarTitle(),
      flexibleSpace: buildAppBarBackground(),
    );
  }

  Text buildAppBarTitle() {
    return Text(
      'Ayarlar',
      style: TextStyle(
          fontFamily: "Quicksand",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25),
    );
  }

  Container buildAppBarBackground() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange, Colors.orange[900]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
    );
  }

  SettingsList buildScaffoldBody() {
    return SettingsList(
      sections: [
        buildSettingsSectionCommon(),
        buildSettingsSectionAccount(),
        buildSettingsSectionSecurity(),
        buildSettingsSectionMisc()
      ],
    );
  }

  SettingsSection buildSettingsSectionCommon() {
    return SettingsSection(
      title: 'Genel',
      tiles: [
        SettingsTile(
          title: 'Dil',
          subtitle: 'Türkçe',
          leading: Icon(
            Icons.language,
            color: Colors.orange[400],
          ),
        ),
      ],
    );
  }

  SettingsSection buildSettingsSectionAccount() {
    return SettingsSection(
      title: 'Hesap',
      tiles: [
        SettingsTile(
            title: 'Email',
            leading: Icon(
              Icons.email,
              color: Colors.orange[400],
            )),
        SettingsTile(
            title: 'Parola',
            leading: Icon(
              Icons.lock,
              color: Colors.orange[400],
            )),
        SettingsTile(
            title: 'Oturumu kapa',
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.orange[400],
            )),
      ],
    );
  }

  SettingsSection buildSettingsSectionSecurity() {
    return SettingsSection(
      title: 'Güvenlik',
      tiles: [
        SettingsTile.switchTile(
          title: 'Parola değiştir',
          leading: Icon(
            Icons.lock,
            color: Colors.orange[400],
          ),
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
          leading: Icon(
            Icons.notifications_active,
            color: Colors.orange[400],
          ),
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

  SettingsSection buildSettingsSectionMisc() {
    return SettingsSection(
      title: 'Diğer',
      tiles: [
        SettingsTile(
            title: 'Hizmet kullanım şartları',
            leading: Icon(
              Icons.description,
              color: Colors.orange[400],
            )),
        SettingsTile(
            title: 'Açık kaynak lisansları',
            leading: Icon(
              Icons.collections_bookmark,
              color: Colors.orange[400],
            )),
      ],
    );
  }
}
