part of '../_index.dart';

class HomeRecentActivities extends StatelessWidget {
  const HomeRecentActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        color: Colors.grey.withOpacity(0.05),
      ),
      child: const Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Recent Activities',
              textScaler: TextScaler.linear(1.2),
            ),
          ),
        ],
      ),
    ));
  }
}
