import 'package:flash_chat/main.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller, controller1;
  late Animation animation;
  late Animation animation1;

  @override
  void initState() {
    //writing animation init state as we have to give animation while screen is opened each time
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // upperBound: 100.0,
    );

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // upperBound: 100.0,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    //to proceed animation forward i.e. increments number of ticker

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    animation1 =
        ColorTween(begin: Colors.blue, end: Colors.black87).animate(controller);

    controller.addListener(() {
      //to check what ticker is doing
      setState(() {}); //to dynamically change value of background color
      print(controller.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //.withOpacity(controller.value)
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // SizedBox(
                //   width: 30,
                // ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 100,
                  ),
                ),
                SizedBox(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Arima',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      pause: Duration(milliseconds: 1000),
                      animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                      totalRepeatCount: 3,
                      onTap: () {
                        print('tapped on app name');
                      },
                      // textStyle: TextStyle(
                      //     fontSize: 45.0,
                      //     fontWeight: FontWeight.w900,
                      //     color: animation1.value,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(width: 15.0, height: 100.0),
                const Text(
                  'Stay Connected',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arima'),
                ),
                const SizedBox(width: 10.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caveat',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Anytime'),
                      RotateAnimatedText('Anywhere'),
                    ],
                    repeatForever: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // RoundedButton(
            //   color: Colors.lightBlue,
            //   title: 'Log in',
            //   onPressed: Navigator.pushNamed(context, LoginScreen.id),
            // ),
            // RoundedButton(
            //   color: Colors.blueAccent,
            //   // LoginScreenId: RegistrationScreen.id,
            //   title: 'Register',
            //   onPressed: Navigator.pushNamed(context, RegistrationScreen.id),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
