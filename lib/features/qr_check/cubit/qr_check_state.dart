part of 'qr_check_cubit.dart';

abstract class QrCheckState extends Equatable {
  const QrCheckState();

  @override
  List<Object> get props => [];
}

class QrCheckInitial extends QrCheckState {
  const QrCheckInitial();
}


class QrCheckLoading extends QrCheckState {
  const QrCheckLoading();
  
  @override
  List<Object> get props => [];
}

class QrCheckCompleted extends QrCheckState {
  const QrCheckCompleted();
  
  @override
  List<Object> get props => [];
}

class QrCheckError extends QrCheckState {
  const QrCheckError();
  
  @override
  List<Object> get props => [];
}
