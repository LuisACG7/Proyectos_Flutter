import 'package:flutter/material.dart';

import 'catalog_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Parte superior con la imagen (60% de la pantalla).
          Expanded(
            flex: 6, // 60%
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Coffee2.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center, // Centrada.
                ),
              ),
            ),
          ),

          // Parte inferior con textos y botón (40% de la pantalla).
          Expanded(
            flex: 4, // 40%
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.black, // Fondo negro (puedes cambiarlo por un degradado si prefieres).
                borderRadius: BorderRadius.vertical(top: Radius.circular(1)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Fall in Love with\nCoffee in Blissful\nDelight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 39,
                      height: 1.25,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome to our cozy coffee corner, where\n'
                    'every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA2A2A2),
                      letterSpacing: 0.24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 327,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const CatalogScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
