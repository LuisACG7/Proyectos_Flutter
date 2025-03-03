import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/utils/global_values.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isValidating = false;


  @override
  Widget build(BuildContext context) {

    final txtUser = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el Usuario"
      ),
    );

      final txtPass = TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Introduce el Password"
        ),
    );


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: .9,
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.jpg") 
          )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 285,
              child: ValueListenableBuilder(
                valueListenable: GlobalValues.isValidating,
                builder: (context, value, child) {
                  return value ? CircularProgressIndicator() : Container();
                },
              //isValidating ? CircularProgressIndicator() : Container(),
              )
            ),
            Positioned(
              top: 50,
              child: Lottie.asset("assets/tecnm.json", height: 250),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 250,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    txtUser,
                    SizedBox(height: 10,),
                    txtPass,
                    GestureDetector(
                      onTap: (){
                        //isValidating = true;
                        GlobalValues.isValidating.value = true;
                        Future.delayed(Duration(milliseconds: 4000)).then((value) {
                          GlobalValues.isValidating.value = false;
                          Navigator.pushNamed(context, "/welcome");
                        },);
                      },
                      child: Image.asset(
                        "assets/boton.png",
                        height: 80,
                        ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}