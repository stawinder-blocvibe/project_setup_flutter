import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class MyInfoScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  RxString _selectedGender ="".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: Get.height,
          margin: EdgeInsets.only(top: margin_10,right: margin_30),
          decoration: ShapeDecoration(
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color: const Color(0xFF14A56E),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          padding:  EdgeInsets.all(margin_20),
          child: SingleChildScrollView(
            child: Column(

              spacing: margin_10,
              children: [
                classNameTitle(title: "My Info",onTapBack: (){
                  Get.back();
                }),

                Center(child: Hero(
                    tag: "profile",
                    child: Icon(Icons.account_circle,size: height_60,color: const Color(0xFF003921),)),),
                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [
                      myField(hintText: "Enter your name",label: "Name"),
                      myField(hintText: "Enter phone number",label: "Phone"),
                      myField(hintText: "Enter Date of birth",label: "DOB"),
                    ],
                  )
                ),

                Obx(
                  ()=> customCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: margin_8,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              color: const Color(0xFF003921),
                              fontSize: 10,
                               fontWeight: FontWeight.w400,
                            ),
                          ).marginOnly(left: margin_10),

                          Row(
                            children: [

                              buildGenderRadio("Man"),
                              buildGenderRadio("Female"),
                              buildGenderRadio("Other"),
                            ],
                          )

                        ],
                      )
                  ),
                ),


                customCard(
                    child: Column(
                      spacing: margin_8,
                      children: [
                        myField(hintText: "Enter Address",label: "Address"),
                        myField(hintText: "Enter UID",label: "UID"),
                        myField(hintText: "Enter Pan card",label: "Pan card number"),
                      ],
                    )
                ),














              ],
            ),
          ),
        ),
      )
    );
  }





  Widget myInfoText(){
    return Stack(

      children: [
        Center(
          child: Text(
            'My Info',
            style: TextStyle(
              color: const Color(0xFF003921),
              fontSize: 18,
              fontFamily: 'Ancizar Serif',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          right: 0,
            top: 0,
            child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadiusGeometry.circular(radius_5)
          ),
            child: Icon(Icons.close,size: 20,)))
      ],
    );



  }








  myField({controller,hintText,label}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
       labelText: label,
        focusColor: Colors.grey,
        fillColor: Colors.grey,
        hintText: hintText??"Name",
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Icon(Icons.mode_edit_rounded,color: Colors.grey,),



        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: UnderlineInputBorder(
            borderSide:   BorderSide(color: Colors.teal)
        ),
        errorBorder: UnderlineInputBorder(
            borderSide:   BorderSide(color: Colors.teal)
        ),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide:   BorderSide(color: Colors.teal)
        ),


      ),
    );
  }

  Widget buildGenderRadio(String gender) {
    return Row(
      children: [
        Radio<String>(
          value: gender,
          groupValue: _selectedGender.value,
          onChanged: (value) {
            _selectedGender.value = value!;
          },
        ),
        Text(gender),

      ],
    );
  }



}






/**/