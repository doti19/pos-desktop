import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/my_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title:
            const Text("Splash Screen", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: MyColors.secondaryAppColor,
      // body: BlocListener<AuthenticationBloc, AuthenticationState>(
      //   bloc: authenticationBloc,
      //   listener: (BuildContext context, AuthenticationState state) {
      //     if (state is AppAutheticated) {
      //       Navigator.pushNamed(context, '/home');
      //     }
      //     if (state is AuthenticationStart) {
      //       Navigator.pushNamed(context, '/auth');
      //     }
      //     if (state is UserLogoutState) {
      //       Navigator.pushNamed(context, '/auth');
      //     }
      //   },
      //   child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //       bloc: authenticationBloc,
      //       builder: (BuildContext context, AuthenticationState state) {
      //         return Center(child: Image.asset(AllImages().logo));
      //       }),
      // )
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/home'),
          child: const Text('move from splash',
              style: TextStyle(color: Colors.black, fontSize: 25.0)),
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   authenticationBloc = AuthenticationBlocController().authenticationBloc;
  //   authenticationBloc.add(AppLoadedup());
  //   super.initState();
  // }
}
