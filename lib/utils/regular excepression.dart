class RegularExceprationsConstants {

  String? isFieldVelid(String? value) {
    if (value!.isEmpty) {
      return 'الحقل فارغ';
    }
    return null;
  }

  String? isUserPhoneValide(String? value) {
    if (value!.isEmpty || !RegExp(r'^7[7,8,1,3]+[0-9]{7}$').hasMatch(value)) {
      return 'رقم الجوال غير صحيح';
    }
    return null;
  }

  String? isUserNameValide(String? value) {
    if (value!.isEmpty ||
            !RegExp(r"^[أ-يA-Za-z ]+ +[أ-يA-Za-z ]+ +[أ-يA-Za-z ]")
                .hasMatch(value)
        // !RegExp(r'(^(?:[+0]9)?[a-z" "A-Z]{1,50}$)').hasMatch(value)
        ) {
      return 'Enter Third Name';
    }
    return null;
  }

  String? isUserEmailValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'الايميل غير صحيح';
    }
    return null;
  }

  String? isUserPassworValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'(^(?:[+0]9)?[0-9a-z@#$&_]{1,12}$)').hasMatch(value)) {
      return 'كلمة المرور يجب الاتحتوي على الرموز @,#,&_ \nوالا تكون اقل من ستة احرف او ارقام ';
    }

    return null;
  }
}
