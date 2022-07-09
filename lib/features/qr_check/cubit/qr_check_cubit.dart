import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'qr_check_state.dart';

class QrCheckCubit extends Cubit<QrCheckState> {
  QrCheckCubit() : super(const QrCheckInitial());


  Future<void> qrCheckSuccessData({required String apartmentId,required String userName,required num job}) async {
    emit(const QrCheckLoading());
    final db = FirebaseFirestore.instance;
    await db.collection('apartments').doc(apartmentId).get().then((value){
      if (value.exists) {
      final apartmentName = value.get('name');
      final siteId = value.get('siteId');
      db.collection('site').doc(siteId).update({
        'orders' : FieldValue.arrayUnion([{
          'dateTime' : DateTime.now().toIso8601String(),
          'job' : job,
          'name' : 'Özlem Sitesi',
          'number' : apartmentName,
          'staff' : userName
        }]),
      }).whenComplete(() => emit(const QrCheckCompleted())).onError((error, stackTrace) => emit(const QrCheckError()));
      }
    });
  }

}
