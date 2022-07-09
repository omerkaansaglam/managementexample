import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:managementexample/features/home/model/orders_model.dart';
import 'package:managementexample/features/login/model/login_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUser();
  }

  Future<void> getUser() async {
    emit(const HomeLoading());
    final db = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final ref = db.collection("Users").doc(auth.currentUser?.uid).get();
    ref.then((value) {
      if (value.exists) {
        final UserModel response =
            UserModel.fromJson(jsonDecode(jsonEncode(value.data())));
        if (response.siteId.isNotEmpty) {
          db.collection("site").doc(response.siteId).get().then((ordersValue) {
          print(ordersValue.data());
              List<dynamic> body = ordersValue.get('orders');
              print(body.toString());
              final orders =
              body.map((dynamic item) => OrdersModel.fromJson(item)).toList();
            emit(HomeCompleted(response,orders));
        });
        }else{
        emit(HomeCompleted(response, []));
        }
      } else {
        emit(const HomeError());
      }
    });
  }
}
