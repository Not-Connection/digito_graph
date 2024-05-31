part of '../_index.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurpleAccent.shade700, Colors.purple],
          ),
          color: _ct.getThemePrimary(context).withOpacity(0.5),
        ),
        height: 100,
        width: double.infinity,
        child: OnReactive(
          () => Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _dt.rxUser.st == null
                        ? 'Hi, Anonymous'
                        : _dt.rxUser.st!.displayName != null
                            ? 'Hi, ${_dt.rxUser.st!.displayName}'
                            : 'Hi ${_dt.rxUser.st!.email}',
                    textScaler: const TextScaler.linear(1.5),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBoxH(10),
                const Text('Your profile is complete, now you can create a signature or verify your signature'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
