import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 44,
      child: Stack(
        children: [
          Positioned(
            left: 336.33,
            top: 17.33,
            child: SizedBox(
              width: 24.33,
              height: 11.33,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Opacity(
                      opacity: 0.35,
                      child: Container(
                        width: 22,
                        height: 11.33,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(2.67),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 2,
                    top: 2,
                    child: Container(
                      width: 18,
                      height: 7.33,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.33),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 7.33,
            child: Container(
              width: 54,
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '9:41',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.30,
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

class HomeScreenTitle extends StatelessWidget {
  const HomeScreenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 149,
      height: 67.78,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(
              'ORBIT',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4E4AF2),
                fontSize: 47.07,
                fontFamily: 'Koulen',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.07,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 20.95,
            child: SizedBox(
              width: 39.01,
              height: 39.01,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 39.01,
                      height: 39.01,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFF4E4AF2), Color(0xFF7FDBFF)],
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24.22,
                    top: 19.70,
                    child: Container(
                      width: 7.80,
                      height: 7.80,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      height: 50,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.93, -0.37),
          end: Alignment(-0.93, 0.37),
          colors: [Color(0xFF353F54), Color(0xFF222834)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.31, color: Color(0xFF4E4AF2)),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5.24,
            offset: Offset(0, 5.24),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF7FDBFF),
            fontSize: 15,
            fontFamily: 'Lohit Devanagari',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.09,
          ),
        ),
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      height: 50,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.93, -0.37),
          end: Alignment(-0.93, 0.37),
          colors: [Color(0xFF353F54), Color(0xFF222834)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.31, color: Color(0xFF4E4AF2)),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5.24,
            offset: Offset(0, 5.24),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Log In',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF7FDBFF),
            fontSize: 15,
            fontFamily: 'Lohit Devanagari',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.09,
          ),
        ),
      ),
    );
  }
}

class HomeScreenBackground extends StatelessWidget {
  const HomeScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 497,
      height: 497,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add additional content here if needed
        ],
      ),
    );
  }
}
