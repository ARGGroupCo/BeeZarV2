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
}
