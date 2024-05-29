part of '../_index.dart';

class SignatureFab extends StatelessWidget {
  const SignatureFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnReactive(
              () => ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: _dt.rxPickedFile.st == null
                    ? () {
                        _ct.pickFile();
                      }
                    : null,
                label: const Text(
                  "Add PDF File",
                ),
              ),
            ),
            const SizedBoxW(20),
            OnReactive(
              () => ElevatedButton.icon(
                icon: const Icon(Icons.edit_document),
                onPressed: _dt.rxSignature.st != null
                    ? null
                    : _dt.rxQRCodeBytes.st == null && _dt.rxPickedFile.st != null
                        ? () {
                            _ct.createSignature();
                          }
                        : null,
                label: const Text(
                  "Add Signature",
                ),
              ),
            ),
          ],
        ),
        // OnReactive(() => _dt.rxPdfControllerResultPDFWithQRCode.st != null
        //     ? ElevatedButton(
        //         onPressed: () {
        //           nav.to(Routes.signatureResult);
        //         },
        //         child: const Text(
        //           "Show Result",
        //         ),
        //       )
        //     : const SizedBox.shrink()),
      ],
    );
  }
}
