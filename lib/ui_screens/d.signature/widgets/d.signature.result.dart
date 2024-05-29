part of '../_index.dart';

class SignatureResult extends StatelessWidget {
  const SignatureResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Result'),
      ),
      body: Stack(
        children: [
          PdfViewPinch(
            controller: _dt.rxPdfControllerResultPDFWithQRCode.st!,
            builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(
                loaderSwitchDuration: Duration(seconds: 1),
              ),
              documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
              pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
              errorBuilder: (_, error) => Center(child: Text(error.toString())),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  onPressed: () {
                    _ct.downloadPDF();
                  },
                  label: const Text(
                    "Download PDF",
                  ),
                ),
                const SizedBoxW(10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    _ct.shareFile(context);
                  },
                  label: const Text(
                    "Share PDF",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
