part of '_index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProfileAppbar(),
      ),
      // floatingActionButton: ProfileFab(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 350),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBuilder.all(
                  listenTo: _dt.rxUser,
                  onWaiting: () => const CircularProgressIndicator(),
                  onError: (error, refreshError) => error,
                  onData: (data) => Column(
                    children: [
                      Card(
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          radius: 50,
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
                      const SizedBoxH(20),
                      OnFormBuilder(
                        listenTo: _dt.rxForm,
                        builder: () {
                          return Column(
                            children: [
                              TextField(
                                readOnly: true,
                                controller: _dt.rxUid.controller,
                                focusNode: _dt.rxUid.focusNode,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Id',
                                  errorText: _dt.rxUid.error,
                                ),
                              ),
                              const SizedBoxH(20),
                              TextField(
                                // readOnly: true,
                                controller: _dt.rxUsername.st.controller,
                                focusNode: _dt.rxUsername.st.focusNode,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Username',
                                  errorText: _dt.rxUsername.st.error,
                                ),
                              ),
                              const SizedBoxH(20),
                              TextField(
                                readOnly: true,
                                controller: _dt.rxEmail.controller,
                                focusNode: _dt.rxEmail.focusNode,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Email',
                                  errorText: _dt.rxEmail.error,
                                ),
                              ),
                              const SizedBoxH(20),
                              OnFormSubmissionBuilder(
                                listenTo: _dt.rxForm,
                                onSubmitting: () => const CircularProgressIndicator(),
                                child: ElevatedButton(
                                  onPressed: _dt.rxForm.isDirty ? () => _ct.submit() : null,
                                  child: const Text(
                                    "Save Changes",
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
