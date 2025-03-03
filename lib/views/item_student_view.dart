import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //color: Colors.orangeAccent,
        border: Border.all(color: Color(0xFF006BD8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://scontent-dfw5-1.xx.fbcdn.net/v/t39.30808-1/448474001_1102716254548247_2613997786866384047_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=1&ccb=1-7&_nc_sid=2d3e12&_nc_eui2=AeFqC2ija9gHxOzG1RKPy3TNWz1HHlakEhFbPUceVqQSEU55ASGeyh1JX5tkN8Qk4uRO3YyjshKWcPdgpGbS-fKH&_nc_ohc=OcknLfpjlaoQ7kNvgEMDtRS&_nc_oc=AdgYDXBTuEhMQ3hF8CgIAW4F_OxDgvz9tZAMmxbbqGo40_NsKlytUV4ohSnVijpAYqk&_nc_zt=24&_nc_ht=scontent-dfw5-1.xx&_nc_gid=APbuz6lCatPRav4TLm2WJ4U&oh=00_AYCdRlFDM8Ny6YU1jIuvbQLJwe5Wh5Hujuy41SJWKDqM-w&oe=67B06321"),
              ),
              title: Text(
                "Rubensin Torres Frías",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("No.Control: 01031151"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .17,
            decoration: const BoxDecoration(
                color: Color(0xFFEDF3FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(children: const [
                    TableRow(
                      children: [
                        Center(child: Text('Semestre')),
                        Center(child: Text('Clave Materia')),
                        Center(child: Text('Grupo')),
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('6')),
                        Center(child: Text('DM13')),
                        Center(child: Text('B')),
                      ],
                    )
                  ]),
                  const SizedBox(height: 16,),
                  const Text(
                    'Ingeniería en Sistemas Computacionales',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
