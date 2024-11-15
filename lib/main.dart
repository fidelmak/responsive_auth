import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'BetaStore/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ScreenUtil',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 133, 133, 134)),
            useMaterial3: true,
          ),
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final lightTextColor = Color(0xffffffff);
  final borderColor = Color(0xfffffdfd);
  final darkTextColor = Color(0xff424242).withOpacity(0.5);

  final plainTextColor = Color(0xff8ea5ff);
  final textFieldColor = Color(0xEAEAEAFF);

  final blackColor = Color(0xff000000);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 52.h,
        ),
        Text(
          "Sign up to MaxCraft",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 4.h,
        ),
        Wrap(
          children: [
            Text(
              "Already Have Account?",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor),
            ),
            Text(
              " Login",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: plainTextColor),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        customTextField("First Name", false),
        SizedBox(
          height: 16.h,
        ),
        customTextField("Last Name", false),
        SizedBox(
          height: 16.h,
        ),
        customTextField("Email Address", false),
        SizedBox(
          height: 16.h,
        ),
        customTextField("Password", true),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(
                  width: 1,
                  color: Colors.blue,
                )),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r), // Set radius to 0
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 16.h)),
              ),
              onPressed: () {},
              child: Text("Create Account")),
        ),
        SizedBox(
          height: 16.w,
        ),
        Row(
          children: [
            const Expanded(child: Divider()),
            SizedBox(
              width: 16.w,
            ),
            Center(
              child: Text(
                "Sign Up via",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(
          height: 16.w,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r), // Set radius to 0
                ),
              ),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 14.h),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.image),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Google",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),

        //
        SizedBox(
          height: 16.h,
        ),
        Wrap(
          children: [
            Text(
              "By signing up to MaxCraft you agree to our ",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: darkTextColor),
            ),
            Text(
              "terms and condition and our policy ",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: plainTextColor),
            ),
          ],
        ),
      ]),
    ))));
  }

  TextField customTextField(hintName, bool bool) {
    return TextField(
      obscureText: bool,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0)),
          filled: true,
          fillColor: textFieldColor,
          hintText: hintName,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h)),
    );
  }
}
