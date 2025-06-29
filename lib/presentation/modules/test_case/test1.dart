


import '../../../app/export.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarWithWallet(onTapBack: (){},onlyWallet: true),
            AssetImageWidget(
                matchGroundAsset,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(20, (index)=> Text("item ${index+1}")),
            )
          ],
        ),
      ),
    );
  }
}
