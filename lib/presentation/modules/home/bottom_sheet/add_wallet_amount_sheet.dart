

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showAddWalletAmountSheet(BuildContext context,
    {required Function(double) addAmount}) {
  final TextEditingController amountController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      final RegExp amountRegex = RegExp(r'^(?:[1-9]\d{0,3})(?:\.\d{1,2})?$');

      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.account_balance_wallet, size: 40, color: const Color(0xFF14A56E)),
            const SizedBox(height: 16),
            const Text(
              "Add Money to Wallet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              maxLength: 7,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                // TextInputFormatter.withFunction((oldValue, newValue) {
                //   if (newValue.text.isEmpty) {
                //     return newValue; // allow empty
                //   }
                //
                //   if (amountRegex.hasMatch(newValue.text)) {
                //     return newValue;
                //   }
                //
                //   // Reject input
                //   return oldValue;
                // }),
              ],
              decoration: InputDecoration(
                labelText: "Enter amount",
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                final amount = amountController.text.trim();
                if (amount.isEmpty || int.tryParse(amount) == null || int.parse(amount) <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a valid amount")),
                  );
                  return;
                }

                addAmount(double.parse(amount));
                // You can call your actual wallet update logic here
              },
              icon: const Icon(Icons.add,color: Colors.white,),
              label: const Text("Add to Wallet",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF14A56E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
