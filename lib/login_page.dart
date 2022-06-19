import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Image.asset('lib/assets/logo.png',
            width: 130.w,
            ),
          ),
        ),
    ),
    backgroundColor: Colors.black,
    body: SafeArea(
    child:Center(
      child: SizedBox(
        width: 300.w,
        height: 345.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign in',style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w800
              )),
              SizedBox(height: 20.h),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(77, 163, 155, 155),
                  hintText: 'Email or Phone number',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(104, 255, 255, 255),
                  )
                ),
              ),
              SizedBox(height: 10.h),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(77, 163, 155, 155),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(104, 255, 255, 255),
                  )
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 300.w,
                height: 40.h,
                child: TextButton(
                onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => const HomePage()));
                },
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.red.shade700)
                ),
                child: Text('Sign in',
                style:TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.sp
                )) 
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Remember me',style: TextStyle(color: Color.fromARGB(104, 255, 255, 255))),
                  Text('Need help?',style: TextStyle(color: Color.fromARGB(104, 255, 255, 255)))
                ],
              ),
              SizedBox(height: 15.h),
              Align(
              alignment: Alignment.center,
              child: Text('Not a member yet? Start your free month!',style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800
                ))), 
              const Expanded(child: SizedBox()),
              Align(
              alignment: Alignment.center,
              child: Text('Forget Your Password?',style: TextStyle(
                color: const Color.fromARGB(104, 255, 255, 255),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500
                ))), 
          ],
        ),
      ),
    )
    ),
    );
  }
}