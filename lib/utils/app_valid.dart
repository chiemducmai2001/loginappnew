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
    } else if (value.length < 8) {
      return ' Số điện thoại phải lớn hơn 8 kí tự';
    }
    final regex = RegExp('!@#<>?":_``~;[]\|=-+)(*&^%1234567890');
    if (!regex.hasMatch(value)) {
      return ' Số điện thoại không được chứa kí tự đặc biệt';
    }
    return null;
  }
}
