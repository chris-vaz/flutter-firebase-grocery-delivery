import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home/home.dart'; // Make sure your home.dart path is correct

// --- Onboarding Screen ---
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the color scheme for easier access to theme colors
    final colorScheme = Theme.of(context).colorScheme;

    // Set the system status bar style to match the image
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 1. Illustration
                _buildIllustration(context),

                const SizedBox(height: 30),

                // 2. Text Content
                _buildTextContent(colorScheme),

                // 3. Continue Button
                _buildContinueButton(context, colorScheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Center(
            child: Image.asset(
              'assets/images/onboard.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.local_shipping_outlined,
                  size: 100,
                  color: Color(0xFF6AA84F),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(ColorScheme colorScheme) {
    return Column(
      children: [
        // Title
        Text(
          'Fresh & Tasty\nGrocery Foods',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 32,
            height: 1.2,
            color: const Color(0xFF6AA84F),
          ),
        ),

        const SizedBox(height: 15),

        // Description
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Get your groceries delivered fresh to your doorstep. Browse fruits, vegetables, dairy, and more with just a few taps!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.05,
        top: 40.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to HomeScreen and replace onboarding
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6AA84F),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2,
          ),
          child: const Text(
            'Continue',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
