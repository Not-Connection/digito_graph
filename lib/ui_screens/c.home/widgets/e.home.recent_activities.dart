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
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Recent Activities',
              textScaler: TextScaler.linear(1.2),
            ),
          ),
          // const SizedBoxH(10),
          // Card(
          //   child: ListTile(
          //     title: const Text('Tugas1_Jarkom.pdf'),
          //     leading: SizedBox(
          //       width: 100,
          //       height: 100,
          //       child: Image.asset('assets/images/qrcode.png'),
          //     ),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: const Text('Tugas_pemweb.pdf'),
          //     leading: SizedBox(
          //       width: 100,
          //       height: 100,
          //       child: Image.asset('assets/images/qrcode.png'),
          //     ),
          //   ),
          // ),

          // Container(
          //   child: _dt.rxHistories.st.values.isNotEmpty
          //       ? OnBuilder<Histories>.data(
          //           listenTo: _dt.rxHistories,
          //           builder: (data) => Container(
          //             child: data.values.isEmpty
          //                 ? const Center(
          //                     child: Text('No Recent Activity'),
          //                   )
          //                 : ListView(
          //                     children: List.generate(
          //                       2,
          //                       (index) {
          //                         // index = index + 1;
          //                         // final value = data.values[index];
          //                         return Card(
          //                           child: ListTile(
          //                             title: const Text('Tugas1_Jarkom.pdf'),
          //                             leading: SizedBox(
          //                               width: 100,
          //                               height: 100,
          //                               child: Image.asset('assets/images/qrcode.png'),
          //                             ),
          //                           ),
          //                         );
          //                       },
          //                     ),
          //                   ),
          //           ),
          //         )
          //       : const SizedBox.shrink(),
          // )
        ],
      ),
    ));
  }
}
