import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: ContactInformation() ,
        );
      },
    );
  }
}


class ContactInformation extends StatefulWidget {
  // const ContactInformation({Key key}) : super(key: key);

  @override
  _ContactInformationState createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {

  TextEditingController _mobileNumberController=  TextEditingController();
  TextEditingController _emailNumberController=  TextEditingController();
  TextEditingController _investorCodeController=  TextEditingController();

  var mediaQueryWidth, mediaQueryHeight;
  late double mainContainerWidth, mainContainerHeight, mainContainerWidthWP, stackFirstContainerForSpinner, stackSecondContainerForSpinner, containerHalfWidth, containerHalfWidthWP;
  late Orientation orientation;
  late double landStackFirstContainerFS, landStackSecondContainerFS, landStackFirstHalfContainerFS, landStackScondHalfContainerFS,
      stackFirstHalfContainerFS, stackSecondHalfContainerFS;
  final _regKey = GlobalKey<FormState>();
  String mobile='', email='', code='';
  bool checkBoxValue= false;

  @override
  void dispose() {
    _investorCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initUI();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //     color: Colors.white, //change your color here
      //   ),
      //   backgroundColor: Colors.blue[900],
      // ),
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Container(
          // padding: EdgeInsets.only(top: 7.h,bottom: 2.h),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/app_background.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: Form(
            key: _regKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 7.h,bottom: 4.h),
                    width:  60.w,
                    // color: Colors.amber,
                    child: Image.asset(
                      "assets/icons/logo_hori.png",
                      // height: 100,
                      // width: 200,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFFDBECF4), borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: EdgeInsets.only(left: 7.w, right: 7.w),
                        child: Container(
                          // margin: EdgeInsets.only(top: 24.h,bottom: 24.h),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  // Utils.navigateLeftToRightAnimation(context, LoginParent(''));
                                  // Navigator.pop(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 3.w,top: 3.h),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios, color: HexColor("#0558a8"),size: 10.sp,),
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: HexColor("#0558a8"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 2.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/new_log.jpg',
                                    height: 10.h,
                                    // width: 80,
                                  ),
                                ),
                              ),
                              Text(
                                'Trade Smart',
                                style: GoogleFonts.getFont(
                                  'Kalam',
                                  fontSize: 10.sp,
                                  color: Color.fromRGBO(0, 114, 188, .85),
                                ),
                              ),

                              SizedBox(height: 2.h),
                              Text(
                                'Register to',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(0, 114, 188, .85),
                                ),
                              ),
                              Text(
                                'BRAC EPL iDesk',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 114, 188, .85),
                                ),
                              ),
                              SizedBox(height: 2.h),

                              ///Email text form field container
                              Container(
                                // height: 50,
                                margin: EdgeInsets.only(left: 7.w, right: 7.w),
                                decoration: BoxDecoration(
                                  // boxShadow:  [
                                  //   BoxShadow(
                                  //     color: Color.fromRGBO(0, 0, 0, 0.15),
                                  //     // color: AppConstant.myMainColor().withOpacity(.5),
                                  //     spreadRadius: 0,
                                  //     blurRadius: 5,
                                  //     offset: Offset(0, 2), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                                child: TextFormField(
                                  controller: _mobileNumberController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 2.0.w),
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    // labelText: 'Find my by city',
                                    errorStyle: TextStyle(
                                      inherit: false,
                                      color: Colors.red,
                                      fontSize: 8.sp,
                                      height: 0.01.h,
                                    ),
                                    // contentPadding: EdgeInsets.all(15),

                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) return "Mobile Number is required";
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 1.5.h),
                              Container(
                                // height: 50,
                                margin: EdgeInsets.only(left: 7.w, right: 7.w),
                                decoration: BoxDecoration(
                                  // boxShadow:  [
                                  //   BoxShadow(
                                  //     color: Color.fromRGBO(0, 0, 0, 0.15),
                                  //     // color: AppConstant.myMainColor().withOpacity(.5),
                                  //     spreadRadius: 0,
                                  //     blurRadius: 5,
                                  //     offset: Offset(0, 2), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                                child: TextFormField(
                                  controller: _mobileNumberController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 2.0.w),
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    // labelText: 'Find my by city',
                                    errorStyle: TextStyle(
                                      inherit: false,
                                      color: Colors.red,
                                      fontSize: 8.sp,
                                      height: 0.01.h,
                                    ),
                                    // contentPadding: EdgeInsets.all(15),

                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) return "Mobile Number is required";
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 1.5.h),
                              Container(
                                // height: 50,
                                margin: EdgeInsets.only(left: 7.w, right: 7.w),
                                decoration: BoxDecoration(
                                  // boxShadow:  [
                                  //   BoxShadow(
                                  //     color: Color.fromRGBO(0, 0, 0, 0.15),
                                  //     // color: AppConstant.myMainColor().withOpacity(.5),
                                  //     spreadRadius: 0,
                                  //     blurRadius: 5,
                                  //     offset: Offset(0, 2), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                                child: TextFormField(
                                  controller: _mobileNumberController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 2.0.w),
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    // labelText: 'Find my by city',
                                    errorStyle: TextStyle(
                                      inherit: false,
                                      color: Colors.red,
                                      fontSize: 8.sp,
                                      height: 0.01.h,
                                    ),
                                    // contentPadding: EdgeInsets.all(15),

                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) return "Mobile Number is required";
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(height: 2.h),
                              Container(
                                margin: EdgeInsets.only(left: 9.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Transform.scale(
                                        scale: 0.9,
                                        child: Checkbox(
                                          // fillColor: WidgetStateProperty.resolveWith((states) {
                                          //   if (states.contains(WidgetState.selected)) {
                                          //     return HexColor("#0075ff"); // Color when checkbox is selected
                                          //   }
                                          //   return Colors.white; // Color when checkbox is not selected
                                          // }),
                                          side:  BorderSide(width: 1.5, color: HexColor("#747675")),
                                          // checkColor: HexColor("#0558a8"),
                                          checkColor: Colors.white,
                                          activeColor: HexColor("#0075ff"),
                                          value: checkBoxValue,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              checkBoxValue = value!;
                                              print("check this value: $checkBoxValue");
                                            });
                                          },
                                        ),
                                      ),height: 2.h,width: 2.w,
                                    ),
                                    SizedBox(width: 3.w),
                                    InkWell(
                                      onTap: (){
                                        // openBottomSheet(context, ' Terms & Conditions', termsConditions);
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'I accept the ',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.7),
                                            fontSize: 10.sp,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'terms and conditions',
                                              style:  TextStyle(
                                                color: Colors.black.withOpacity(0.7),
                                                fontSize: 10.sp,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // child: Text(
                                      //   "I accept the terms and conditions",
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: Colors.black54,
                                      //     // fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Container(
                                  margin: EdgeInsets.only(left: 7.w, right: 7.w),
                                  child: globalButton(context, "Register", () {

                                    setState(() {
                                      if(_regKey.currentState!.validate()){
                                        if(checkBoxValue==false){
                                          // Utils.showMyDialog(context, "Please, Accept trams & conditions");
                                        }else{
                                          // _postContactData();
                                        }
                                      }
                                      // if(_mobileNumberController.text.isEmpty){
                                      //   Utils.showMyDialog(context, "Enter Mobile Number");
                                      // } else if(_emailNumberController.text.isEmpty){
                                      //   Utils.showMyDialog(context, "Enter Email");
                                      // } else if(_investorCodeController.text.isEmpty){
                                      //   Utils.showMyDialog(context, "Enter Investor Code");
                                      // } else if(checkBoxValue==false){
                                      //    Utils.showMyDialog(context, "Please, Accept trams & conditions");
                                      //  } else{
                                      //   mobile= _mobileNumberController.text.toString();
                                      //   email= _emailNumberController.text.toString();
                                      //   code= _investorCodeController.text.toString();
                                      //   _postContactData();
                                      // }
                                    });

                                  }, 80.w, 5.h, HexColor('#e4a711'))),
                              SizedBox(height: 3.h),


                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.h),
                        // color: Colors.amber,
                        // alignment: Alignment.center,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: (){
                                    // openBottomSheet(context, 'About us ', aboutUsMessage);
                                  },
                                  child: Text("About us ", style: TextStyle(color: Colors.white,fontSize: 14.sp),)),
                              Text("|", style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                              InkWell(
                                  onTap: (){
                                    // openBottomSheet(context, ' Policies', privacyMessage);
                                  },
                                  child: Text(" Policies ", style: TextStyle(color: Colors.white,fontSize: 14.sp),)),
                              Text("|", style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                              InkWell(
                                  onTap: (){
                                    // openBottomSheet(context, 'Contact us', contactUs);
                                  },
                                  child: Text(" Contact us", style: TextStyle(color: Colors.white,fontSize: 14.sp),)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.h,top: 8.h),
                    child: Text(
                      'App Version: 7.0.0',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            margin: EdgeInsets.all(10.0),
            height: mainContainerHeight,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [

                    Container(
                      width: mediaQueryWidth,
                      child: Text(
                        "Enter you contact information",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    _fieldTitle("Mobile Number"),
                    Container(
                      height: 40,
                      width: mediaQueryWidth,
                      margin: EdgeInsets.only(top: 5),
                      child: TextFormField(
                        autofocus: false,
                        controller: _mobileNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: new InputDecoration(
                          focusColor: Colors.blue,
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    _fieldTitle("Email Address"),
                    Container(
                      height: 40,
                      width: mediaQueryWidth,
                      margin: EdgeInsets.only(top: 5),
                      child: TextFormField(
                        autofocus: false,
                        controller: _emailNumberController,
                        decoration:  InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        // labelText: 'Find my by city',

                        contentPadding: EdgeInsets.all(15),

                      ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    _fieldTitle("Investor Code"),
                    Container(
                      height: 40,
                      width: mediaQueryWidth,
                      margin: EdgeInsets.only(top: 5),
                      child: TextFormField(
                        autofocus: false,
                        controller: _investorCodeController,
                        decoration: new InputDecoration(
                          focusColor: Colors.blue,
                          hintText: 'Enter Your Investor Code',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),







                    Container(
                      height: 40,
                      width: 150,
                      child: MaterialButton(
                        color: HexColor("#f9a825"),
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "VERIFY",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            if(_mobileNumberController.text.isEmpty){
                              Utils.showMyDialog(context, "Enter Mobile Number");
                            } else if(_emailNumberController.text.isEmpty){
                              Utils.showMyDialog(context, "Enter Email");
                            } else if(_investorCodeController.text.isEmpty){
                              Utils.showMyDialog(context, "Enter Investor Code");
                            } else{
                              mobile= _mobileNumberController.text.toString();
                              email= _emailNumberController.text.toString();
                              code= _investorCodeController.text.toString();
                              _postContactData();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

         */
        ),
      ),
    );
  }

  /// responsible ui init
  _initUI(){
    mediaQueryWidth = MediaQuery.of(context).size.width;
    mediaQueryHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    mainContainerHeight = ((mediaQueryHeight / 100.0) * 90.0);
    mainContainerWidth = ((mediaQueryWidth / 100.0) * 90.0);
    mainContainerWidthWP = mainContainerWidth - 5.0;

    containerHalfWidth = ((mainContainerWidthWP / 2) - 4);
    containerHalfWidthWP = (containerHalfWidth - 2);

    stackFirstContainerForSpinner = ((mainContainerWidthWP / 100.0) * 87.0);
    stackSecondContainerForSpinner = ((mainContainerWidthWP / 100.0) * 13.0);

    stackFirstHalfContainerFS = ((containerHalfWidthWP / 100.0) * 75.00);
    stackSecondHalfContainerFS = ((containerHalfWidthWP / 100.0) * 25.00);

    landStackFirstHalfContainerFS = ((mediaQueryWidth / 100.0) * 87.00);
    landStackScondHalfContainerFS = ((mediaQueryWidth / 100.0) * 13.00);
    landStackFirstContainerFS = mediaQueryWidth - 150;
    landStackSecondContainerFS = ((mediaQueryWidth / 100.0) * 07.0);
  }

  ///each field title ui
  _fieldTitle(String s) {
    return Container(
      width: mediaQueryWidth,
      margin: EdgeInsets.only(left: 5),
      child: Text(s, style: TextStyle(fontSize: 12),),
    );
  }

  /// network call
  String message='';
  int status=0;


  Widget globalButton(BuildContext context, String title, VoidCallback callback,double w, double h, Color color){

    return InkWell(
      onTap: callback,
      child: Container(
        height: h,
        // width: w,
        alignment: Alignment.center,
        // margin: const EdgeInsets.only(top: 20, bottom: 20),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: color,
          // border: Border.all(color: HexColor("#0558a8")),
          // boxShadow:  [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: const Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child:  Text(
          title,
          style:  TextStyle(
              fontSize: 11.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


}
