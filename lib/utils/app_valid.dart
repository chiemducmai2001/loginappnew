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
}
