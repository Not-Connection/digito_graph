part of '../_index.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeFeatButton(
                icon: Icons.edit_document,
                text: 'Signature',
                onTap: () {
                  nav.to(Routes.signature);
                },
              ),
              HomeFeatButton(
                icon: Icons.verified,
                text: 'Verify',
                onTap: () {
                  nav.to(Routes.verify);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
