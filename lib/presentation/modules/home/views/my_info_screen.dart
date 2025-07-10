 import 'package:base_project/app/export.dart';
 import '../controllers/my_info_controller.dart';

class MyInfoScreen extends StatelessWidget {
  final MyInfoController controller = Get.put(MyInfoController());


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
          child: Column(
            children: [
              classNameTitle(title: "My Info",onTapBack: (){
                Get.back();
              }),
              SizedBox(height: height_10,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                
                    spacing: margin_10,
                    children: [
                
                
                      Center(child: Hero(
                          tag: "profile",
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Obx(()=> handleProfileImage()),
                              GestureDetector(
                                onTap: () async {
                                  var data = await controller.onTapCamera().then((value){
                
                                    if(value != null && value is PickedFile){
                                      debugPrint("Image path: $value");
                                      controller.profileImage.value = value.path;
                                      controller.profileImage.refresh();
                                    }
                                    debugPrint("Image path:33 ==>$value");
                                  });
                                  debugPrint("Image path:11 ==>${data}");
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(right: (!controller.profileImage.value.contains('http') || controller.profileImage.value.isEmpty )?margin_10:margin_0,bottom: (!controller.profileImage.value.contains('http') || controller.profileImage.value.isEmpty )?margin_10:margin_0,),
                                  child: const Icon(
                                    CupertinoIcons.camera_circle,size: 30,color: Colors.green,),
                                ),
                              )
                            ],
                          ))),
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [
                            myField(hintText: "Enter your name",label: "Name",controller: controller.nameController),
                            myField(hintText: "Enter your email",label: "Email",controller: controller.emailController),
                            myField(hintText: "Enter phone number",label: "Phone",controller: controller.phoneController,readOnly: true),
                            myField(hintText: "Enter Date of birth",label: "DOB",controller: controller.dobController,
                                readOnly: true,
                                onTap:(){
                              showDatePicker(context: Get.context!, firstDate: DateTime(1900), lastDate: DateTime.now().subtract(Duration(days: 365*14))).then((value){
                                if(value != null){
                                  controller.dobController.text = value.toString().split(" ")[0];
                                }
                              });
                            }),
                          ],
                        )
                      ),
                      Obx(
                        ()=> customCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: margin_8,
                              children: [
                                const Text(
                                  'Gender',
                                  style: TextStyle(
                                    color: Color(0xFF003921),
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
                              myField(hintText: "Enter Address",label: "Address",controller: controller.addressController),
                              myField(hintText: "Enter UID",label: "UID",controller: controller.uidController),
                              myField(hintText: "Enter Pan card",label: "Pan card number",controller: controller.panController),
                            ],
                          )
                      ),
                
                      appButton(buttonText: "Update Profile",onTap: () {
                        controller.updateProfile();
                      }
                        )
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                    ],
                  ),
                ),
              ),
            ],
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








  myField({controller,hintText,label,readOnly = false,onTap}) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
       labelText: label,
        focusColor: Colors.grey,
        fillColor: Colors.grey,
        hintText: hintText??"Name",
        hintStyle: TextStyle(color: Colors.grey),

        suffixIcon: Icon(Icons.mode_edit_rounded,color: readOnly?Colors.transparent:Colors.grey,),



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
            groupValue: controller.selectedGender.value,
            onChanged: (value) {
              controller.selectedGender.value = value!;
            },
          ),
          Text(gender),

        ],
      );
  }

  Widget handleProfileImage() {
    if (controller.profileImage.value.isNotEmpty && controller.profileImage.value.startsWith('http')) {
      return NetworkImageWidget(
        imageUrl: controller.profileImage.value,
        imageWidth: 100,
        imageHeight: 100,
        imageFitType: BoxFit.cover,
        radiusAll: 100.r,
      );
    }else if(controller.profileImage.value.isNotEmpty){
      return ClipRRect(//controller.profileImage.value??""
        borderRadius: BorderRadius.circular(radius_50),
        child: Image.file(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            File(controller.profileImage.value)),
      );
  } else{
      return Icon(Icons.account_circle,size: height_100);
    }
  }



}






/**/