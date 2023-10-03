class ValidatorDef {
  static String? validatorEmail(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال بريد الكتروني";
    }
    if (!val.contains("@") || !val.contains(".")) {
      return "الرجاء ادخال بريد الكتروني صحيح";
    }
    return null;
  }

  static String? validatorPassword(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    return null;
  }

  static String? validatorname(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال الاسم";
    }
    return null;
  }

  static String? validatorPhone(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال رقم الهاتف";
    }
    if ((val.toString()).length < 10) {
      return "رقم الهاتف غير صحيح";
    }
    return null;
  }

  static String? validatorRegion(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء اختيار منطقة ";
    }
    return null;
  }
}
