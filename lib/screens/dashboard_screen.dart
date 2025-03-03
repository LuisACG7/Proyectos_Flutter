import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        actions: [
          DarlightButton(
            type: Darlights.DarlightFour,
            options: DarlightFourOption(),
            onChange: (value) {
              if (value == ThemeMode.light) {
                GlobalValues.themeApp.value = ThemeSettings.lightTheme();
                }else {
                  GlobalValues.themeApp.value = ThemeSettings.darkTheme();
                  }
        },
        
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://scontent-dfw5-1.xx.fbcdn.net/v/t39.30808-1/448474001_1102716254548247_2613997786866384047_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=1&ccb=1-7&_nc_sid=2d3e12&_nc_eui2=AeFqC2ija9gHxOzG1RKPy3TNWz1HHlakEhFbPUceVqQSEU55ASGeyh1JX5tkN8Qk4uRO3YyjshKWcPdgpGbS-fKH&_nc_ohc=OcknLfpjlaoQ7kNvgEMDtRS&_nc_oc=AdgYDXBTuEhMQ3hF8CgIAW4F_OxDgvz9tZAMmxbbqGo40_NsKlytUV4ohSnVijpAYqk&_nc_zt=24&_nc_ht=scontent-dfw5-1.xx&_nc_gid=APbuz6lCatPRav4TLm2WJ4U&oh=00_AYCdRlFDM8Ny6YU1jIuvbQLJwe5Wh5Hujuy41SJWKDqM-w&oe=67B06321"),
              ),
              accountName: Text('Rubensin Torres Frías'),
             accountEmail: Text('ruben.torres@itcelaya.edu.mx')
             ),
             ListTile(
              onTap: (){},
              leading: Icon(Icons.design_services),
              title: Text('Practica Figma'),
              subtitle: Text('Fronted App'),
              trailing: Icon(Icons.chevron_right),
             ),
              ListTile(
                onTap: ()=>Navigator.pushNamed(context, "/todo"),
                leading: Icon(Icons.task),
                title: Text('Todo App'),
                subtitle: Text('Task List'),
                trailing: Icon(Icons.chevron_right),
             )
          ],
        ),
      ),
      //endDrawer: Drawer(),
    );
  }
}