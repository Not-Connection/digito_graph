part of '../_index.dart';

class SignatureBottomNavBar extends StatelessWidget {
  const SignatureBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary, size: 30),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _dt.rxSelectedIndex.st,
        onTap: (value) => _dt.rxSelectedIndex.setState((s) => value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Signature',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified),
            label: 'Verify',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class SignatureContentSign extends StatelessWidget {
  const SignatureContentSign({super.key});

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _dt.rxResultPDFwithQRCode.st != null
                ? Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.memory(_dt.rxQRCodeBytes.st!),
                          ),
                          const SizedBoxH(10),
                          Card(
                            child: ListTile(
                              title: const Text('Document Result'),
                              subtitle: Text(_dt.rxResultPDFwithQRCodePath.st),
                              onTap: () => nav.toDialog(
                                AlertDialog(
                                  title: Text(_dt.rxResultPDFwithQRCodePath.st),
                                  content: SizedBox(
                                    width: 300,
                                    child: PdfViewPinch(
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
                                  ),
                                ),
                              ),
                              trailing: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _ct.downloadPDF();
                                    },
                                    icon: const Icon(Icons.download),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _ct.shareFile(context);
                                    },
                                    icon: const Icon(Icons.share),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: _dt.rxPdfController.st != null
                          ? PdfViewPinch(
                              controller: _dt.rxPdfController.st!,
                              builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                                options: const DefaultBuilderOptions(
                                  loaderSwitchDuration: Duration(seconds: 1),
                                ),
                                documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                errorBuilder: (_, error) => Center(child: Text(error.toString())),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'No Document Selected',
                                textScaler: TextScaler.linear(1.5),
                                style: TextStyle(color: Colors.white24),
                              ),
                            ),
                    ),
                  ),
            Visibility(
              visible: _dt.rxResultPDFwithQRCode.st == null,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: SignatureFab(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignatureContentVerify extends StatelessWidget {
  const SignatureContentVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: _dt.rxPdfControllerVerifyQR.st != null
                  ? _dt.rxQRCodeFromPDFPath.st != null
                      ? Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            // height: 200,
                            // width: 150,
                            child: Image.file(File('${_dt.rxQRCodeFromPDFPath.st}')),
                          ))
                      : PdfViewPinch(
                          controller: _dt.rxPdfControllerVerifyQR.st!,
                          builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                            options: const DefaultBuilderOptions(
                              loaderSwitchDuration: Duration(seconds: 1),
                            ),
                            documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                            pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                            errorBuilder: (_, error) => Center(child: Text(error.toString())),
                          ),
                        )
                  : Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _ct.pickFile(isVerify: true, isVerifyQR: true);
                        },
                        child: const Text(
                          "Select PDF File with QRCode",
                        ),
                      ),
                    ),
            ),
            Visibility(
              visible: _dt.rxPickedPdfFileQRCode.st != null,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _ct.pickFile(isVerify: true, isVerifyOri: true);
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 120),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _dt.rxPdfControllerVerifyOri.st != null
                            ? PdfViewPinch(
                                controller: _dt.rxPdfControllerVerifyOri.st!,
                                builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                                  options: const DefaultBuilderOptions(
                                    loaderSwitchDuration: Duration(seconds: 1),
                                  ),
                                  documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                  pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                                  errorBuilder: (_, error) => Center(child: Text(error.toString())),
                                ),
                              )
                            : Center(
                                child: Text(
                                  'Select Original PDF File',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Visibility(
            //   visible: _dt.rxPdfControllerVerifyOri.st != null,
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: ElevatedButton.icon(
            //       icon: const Icon(Icons.verified),
            //       onPressed: () {
            //         _ct.imageProcess();
            //       },
            //       label: const Text(
            //         "Start Verify Signature",
            //       ),
            //     ),
            //   ),
            // ),
            Visibility(
              visible: _dt.rxQRCodeImage.st != null,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    nav.toDialog(
                      AlertDialog(
                        content: Image.file(File(_dt.rxQRCodeImage.st!.path)),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: const Text(
                    "Show Result",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignatureContentProfile extends StatelessWidget {
  const SignatureContentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
