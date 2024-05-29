part of '_index.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: VerifyAppbar(),
      ),
      // floatingActionButton: const VerifyFab(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OnReactive(
          () => Center(
            child: _dt.rxFilePickedResult.st == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     "Scan QR Code",
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          _ct.pickFile(isVerifyQR: true);
                        },
                        child: const Text(
                          "Scan PDF with Watermark QR Code",
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: ListTile(
                          title: const Text('PDF with QRCode Watermark'),
                          subtitle: Text(_dt.rxFilePickedResultNameWatermark.st),
                          onTap: () => nav.toDialog(
                            AlertDialog(
                              title: Text(_dt.rxFilePickedResultNameWatermark.st),
                              content: SizedBox(
                                width: 300,
                                child: PdfViewPinch(
                                  controller: _dt.rxPdfController.st!,
                                  builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                                    options: const DefaultBuilderOptions(
                                      loaderSwitchDuration: Duration(seconds: 1),
                                    ),
                                    documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                    pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                    errorBuilder: (_, error) => Center(child: Text(error.toString())),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBoxH(20),
                      OnReactive(
                        () => Visibility(
                          visible: _dt.rxFilePickedResultNameWatermark.st.isNotEmpty,
                          child: OutlinedButton(
                            onPressed: _dt.rxFilePickedResultNameOri.st.isEmpty
                                ? () {
                                    _ct.pickFile(isVerifyOri: true);
                                  }
                                : null,
                            child: const Text(
                              "Scan Original PDF without QRCode Watermark",
                            ),
                          ),
                        ),
                      ),
                      const SizedBoxH(20),
                      Visibility(
                        visible: _dt.rxFilePickedResultNameOri.st.isNotEmpty,
                        child: Card(
                          child: ListTile(
                            title: const Text('PDF Original without QRCode Watermark'),
                            subtitle: Text(_dt.rxFilePickedResultNameOri.st),
                            onTap: () => nav.toDialog(
                              AlertDialog(
                                title: Text(_dt.rxFilePickedResultNameOri.st),
                                content: SizedBox(
                                  width: 300,
                                  child: PdfViewPinch(
                                    controller: _dt.rxPdfControllerOri.st!,
                                    builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                                      options: const DefaultBuilderOptions(
                                        loaderSwitchDuration: Duration(seconds: 1),
                                      ),
                                      documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                      pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                      errorBuilder: (_, error) => Center(child: Text(error.toString())),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _dt.rxFilePickedResultNameOri.st.isNotEmpty,
                        child: OutlinedButton(
                          onPressed: () {
                            _ct.imageProcess();
                          },
                          child: const Text(
                            "Verify",
                          ),
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
