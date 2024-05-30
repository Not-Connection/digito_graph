part of '../_index.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: OnReactive(
            () => InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: CircleAvatar(
                backgroundImage: _dt.rxUser.st?.photoURL != null ? NetworkImage('${_dt.rxUser.st?.photoURL}') : null,
                child: _dt.rxUser.st?.photoURL != null
                    ? null
                    : Icon(
                        Icons.person,
                        color: Colors.black.withOpacity(0.5),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
