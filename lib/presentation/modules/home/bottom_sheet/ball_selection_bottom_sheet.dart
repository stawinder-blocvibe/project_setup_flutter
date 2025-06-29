

import 'package:base_project/app/export.dart';

void showBallSelectionBottomSheet({title,subTitle,subTitleOld, required  Function(dynamic value) onInput}) {

  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    enableDrag: false,

    builder: (context) {
      return
        Container(
        // margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(color: Colors.green.shade100, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: title??'Wide Ball ',
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 18,
                         fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: subTitleOld??'(WD=1)',
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 12,
                         fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              spacing: margin_10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: margin_10,
                  children: List.generate(4, (index)=>
                      dottedCell(subTitle: subTitle,index: index,onTap:onInput)),),
                Row(
                  spacing: margin_10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (index)=>
                      dottedCell(subTitle: subTitle,index: index+4,onTap:onInput),),),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );


}
Widget dottedCell({subTitle,index, required Function(dynamic value) onTap}){
  return Expanded(
    child: GestureDetector(
      onTap: (){
        debugPrint('onTap $subTitle $index');
        onTap("$subTitle$index");
        Navigator.pop(Get.context!);
      },
      child: Container(

        // alignment: Alignment.center,
        child: DottedBorder(

          color: Colors.blue,
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: const [6, 3],
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),

          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              '${subTitle} + $index',
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
