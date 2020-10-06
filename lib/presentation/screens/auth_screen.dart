import 'package:cokut/cubit/login_form/login_cubit.dart';
import 'package:cokut/infrastructure/repositories/auth_repo.dart';
import 'package:cokut/presentation/widgets/main/sign_in_form.dart';
import 'package:cokut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int duration = 100;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => LoginCubit(
        context.repository<AuthenticationRepository>(),
        utils: Provider.of<Utils>(context, listen: false),
      ),
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            height: mediaQuery.size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 5,
                  child: AnimatedContainer(
                    width: double.infinity,
                    duration: Duration(milliseconds: duration),
                    child: Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Image.asset(
                            'assets/images/whitesid.png',
                          ),
                        ),
                        Text(
                          "feel the luxury of food",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: duration),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: SignInForm(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
