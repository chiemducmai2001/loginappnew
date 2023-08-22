class AppValid {
  AppValid._();
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Không được rỗng';
    } else if (value.length < 2) {
      return 'Tên phải lớn hơn 2 kí tự';
    }
    final regex = RegExp(
      r'^[a-z A-ZỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđỲỌÁẦẢẤỜỄÀẠẰỆẾÝỘẬỐŨỨĨÕÚỮỊỖÌỀỂẨỚẶÒÙỒỢÃỤỦÍỸẮẪỰỈỎỪỶỞÓÉỬỴẲẸÈẼỔẴẺỠƠÔƯĂÊÂĐ]+$',
    );
    if (!regex.hasMatch(value)) {
      return 'Tên không được chưa kí tự đặc biệt';
    }
    return null;
  }

  static String? validatePhoneNumBer(String? value) {
    if (value == null || value.isEmpty) {
      return 'Không được để trống ';
    } else if (value.length != 10) {
      return ' Số điện thoại phải có 10 kí tự';
    }
    final regex =
        RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)');
    if (!regex.hasMatch(value)) {
      return ' Số điện thoại không được chứa kí tự đặc biệt';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email không được bỏ trống';
    }
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(value)) {
      return 'Nhập vào đúng định dạng email @';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Không được để trống';
    } else if (value.length < 5) {
      return 'Mật khẩu lặp lại phải lớn hơn 6 kí tự';
    }
    // final regex =
    //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    // if (!regex.hasMatch(value)) {
    //   return 'Nhập mật khẩu đúng định dạng';
    // } else {
    //   return null;
    // }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? Password) {
    if (value == null || value.isEmpty) {
      return 'Không được để trống';
    } else if (value.length < 6) {
      return 'Mật khẩu lặp lại phải lớn hơn 6 kí tự';
    } else if (value != Password) return 'Không trùng với mật khẩu trên';
    return null;
  }
}
