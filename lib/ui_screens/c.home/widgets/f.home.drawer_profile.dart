part of '../_index.dart';

class HomeDrawerProfile extends StatelessWidget {
  const HomeDrawerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: OnReactive(
        () => _dt.rxUser.st == null
            ? const SizedBox.shrink()
            : OnBuilder.all(
                listenTo: _dt.rxUser,
                onWaiting: () => const Center(child: CircularProgressIndicator()),
                onError: (error, refreshError) => error,
                onData: (data) => Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.grey.withOpacity(0.1),
                            ),
                            onPressed: () {
                              Scaffold.of(context).closeEndDrawer();
                            },
                            child: const Icon(
                              Icons.close,
                              // color: Colors.red,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              backgroundColor: Colors.grey.withOpacity(0.1),
                            ),
                            onPressed: () {
                              nav.to(Routes.profile);
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text(
                              "Edit Profile",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                backgroundImage: data?.photoURL != null ? NetworkImage('${data?.photoURL}') : null,
                                child: data?.photoURL == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 85,
                                        color: Colors.grey,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBoxH(10),
                            OnReactive(
                              () => data?.displayName == null
                                  ? const SizedBox.shrink()
                                  : Center(
                                      child: ListTile(
                                        title: const Text(
                                          'Username',
                                          textAlign: TextAlign.center,
                                        ),
                                        subtitle: Text(
                                          data?.displayName ?? '-',
                                          textAlign: TextAlign.center,
                                        ),
                                        // leading: const Icon(Icons.person),
                                      ),
                                    ),
                            ),
                            data!.email == null
                                ? const SizedBox.shrink()
                                : ListTile(
                                    title: const Text(
                                      'Email',
                                      textAlign: TextAlign.center,
                                    ),
                                    subtitle: Text(
                                      '${data.email}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                            const Divider(
                              thickness: 0.1,
                            ),
                            const SizedBoxH(20),
                            OutlinedButton.icon(
                              onPressed: () {
                                _ct.signOut();
                              },
                              icon: const Icon(Icons.logout),
                              label: const Text('Sign out'),
                            ),
                            const SizedBoxH(20),
                            TextButton(
                              onPressed: () {
                                _ct.deleteAccount();
                              },
                              child: const Text('Delete Account'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
