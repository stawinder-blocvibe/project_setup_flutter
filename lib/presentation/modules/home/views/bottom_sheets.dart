

import 'package:flutter/material.dart';

void showBallValueSelectorBottomSheet({
  required BuildContext context,
  required int overNumber,
  required int ballNumber,
  required Function(String value) onSelect,
}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sports_cricket, size: 32, color: Colors.orange),
            SizedBox(height: 12),
            Text(
              'Select Ball Value',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Choose the correct value for Over ${overNumber+1} - Ball ${ballNumber}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onSelect('5');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      '5 Runs',
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onSelect('7');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      '7 Runs',
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}
