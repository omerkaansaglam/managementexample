extension JobExtension on num {
  String toJob() {
    switch (this) {
      case 0:
        return JobConstants.ADMIN;
      case 1:
        return JobConstants.CLEANING_STAFF;
      case 2:
        return JobConstants.LIFT_STAFF;
      default:
        return 'Görev Belirtilmedi';
    }
  }
}

extension JobNameExtension on num {
  String toJobName() {
    switch (this) {
      case 1:
        return JobNameConstants.CLEANING;
      case 2:
        return JobNameConstants.LIFT;
      default:
        return '-';
    }
  }
}

class JobConstants {
  static const String ADMIN = "Yönetici";
  static const String CLEANING_STAFF = "Temizlik Görevlisi";
  static const String LIFT_STAFF = "Asansör Görevlisi";
}

class JobNameConstants {
  static const String CLEANING = "Temizlik";
  static const String LIFT = "Asansör";
}
