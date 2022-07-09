import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managementexample/core/constants/navigation_constants.dart';
import 'package:managementexample/features/qr_check/cubit/qr_check_cubit.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCheckView extends StatefulWidget {
  final String siteId;
  final num job;
  final String userName;
  const QRCheckView(
      {Key? key,
      @PathParam('siteId') required this.siteId,
      @PathParam('job') required this.job,
      @PathParam('userName') required this.userName})
      : super(key: key);
  @override
  State<QRCheckView> createState() => _QRCheckViewState();
}

class _QRCheckViewState extends State<QRCheckView> {
  late final MobileScannerController cameraController;
  @override
  void initState() {
    super.initState();
    cameraController = MobileScannerController();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
    cameraController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCheckCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('İş Tamamla')),
        body: Builder(builder: (context) {
          final qrCubit = BlocProvider.of<QrCheckCubit>(context);
          return BlocConsumer<QrCheckCubit, QrCheckState>(
            listener: (context, state) {
              if (state is QrCheckError) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      "Üzgünüz bir hata ile karşılaştık!",
                      style: TextStyle(color: Colors.white),
                    )));
              }
              if (state is QrCheckLoading) {
                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    backgroundColor: Colors.blueAccent,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const[
                        Text(
                      "Qr Başarıyla okutuldu. İşlem tamamlanıyor...",
                      style: TextStyle(color: Colors.white),
                    ),
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    )));
              }
              if (state is QrCheckCompleted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(

                    backgroundColor: Colors.white,
                    content: Icon(
                      Icons.check_circle,
                      size: 50,
                      color: Colors.greenAccent,
                    )));
                Future.delayed(Duration(seconds: 1), () {
                  context.router.replaceNamed(NavigationConstants.HOME);
                });
              }
            },
            builder: (context, state) {
              return MobileScanner(
                  controller: cameraController,
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                    } else {
                      final String code = barcode.rawValue!;
                      qrCubit.qrCheckSuccessData(
                          apartmentId: code,
                          userName: widget.userName,
                          job: widget.job);
                      debugPrint('Barcode found! $code');
                    }
                  });
            },
          );
        }),
      ),
    );
  }
}
