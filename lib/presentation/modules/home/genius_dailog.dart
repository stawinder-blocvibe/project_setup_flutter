


import '../../../app/export.dart';

class GeniusSubscriptionModal extends StatefulWidget {
  const GeniusSubscriptionModal({Key? key}) : super(key: key);

  @override
  State<GeniusSubscriptionModal> createState() => _GeniusSubscriptionModalState();
}

class _GeniusSubscriptionModalState extends State<GeniusSubscriptionModal> {
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addressController.text = "A- 126, block a, shivalik colony, malviya nagar, New Delhi, Delhi 110017, India";
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(

        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Crown icon
            AssetImageWidget(premiumIconAsset,imageFitType: BoxFit.contain,imageHeight: height_40,imageWidth: height_40,)??
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 40,
              ),
            ),

            const SizedBox(height: 14),

            // Title and price
            Text(
              'Become a Genius – ₹599',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF003921),
                fontSize: font_16,
                fontWeight: FontWeight.w800,
              ),
            ),

            // const SizedBox(height: 12),

            // Free T-shirt text
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("🎁", style: TextStyle(fontSize: 20)),
                SizedBox(width: 8),
                Text(
                  "Free T-shirt included!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Dotted line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DottedLinePainter(),
              ),
            ),

            const SizedBox(height: 14),

            // T-shirt image
        AssetImageWidget(
          "assets/icons/t_shrit.png",
          imageHeight: height_100,
          imageWidth: height_100,
        ),

            const SizedBox(height: 12),

            // Address section
            Container(

              margin: EdgeInsets.only(left: margin_30),
              alignment: Alignment.centerLeft,
              child: Text(
                ' Add your address for delivery',
                style: TextStyle(
                  color: const Color(0xFF003921),
                  fontSize: 14,
                   fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 12),
            Container(
              margin: EdgeInsets.all( margin_30).copyWith(bottom: 20,top: 10),
              padding: EdgeInsets.all( margin_10),
              decoration: ShapeDecoration(
                color: const Color(0xFFF3F5FB),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFFEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'A- 126, block a, shivalik colony, malviya nagar,\nNew Delhi, Delhi 110017, India ',
                style: TextStyle(
                  color: const Color(0xFF003921),
                  fontSize: 12,
                   fontWeight: FontWeight.w400,
                ),
              ),
            ),

           appButton(buttonText: "Pay Now",onTap: (){
             isGenius.value = !isGenius.value;
             isGenius.refresh();
             Get.back();
           }).marginSymmetric(horizontal: margin_20),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Custom painter for dotted line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    const dashWidth = 4.0;
    const dashSpace = 4.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}