part of '../_index.dart';

class HomeFeatButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String text;
  const HomeFeatButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: _ct.getThemePrimary(context),
                size: 60,
              ),
              const SizedBoxH(3),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
