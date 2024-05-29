part of '../_index.dart';

class LoginSubmit extends StatelessWidget {
  const LoginSubmit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => Center(
        child: OnFormSubmissionBuilder(
          listenTo: _dt.rxForm,
          onSubmitting: () => const CircularProgressIndicator(),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: const Size.fromWidth(200),
            ),
            onPressed: _dt.rxForm.isDirty && _dt.rxForm.isValid ? () => _ct.submit() : null,
            child: const Text(
              'Submit',
            ),
          ),
        ),
      ),
    );
  }
}
