import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((ref) {
  String formatOrderDetails(List<Map<String, dynamic>> meals, double totalPrice,
      String address, String phoneNumber) {
    // Construct the meal details string
    String mealDetails = meals.map((meal) {
      return '${meal['name']} --- العدد: ${meal['quantity']}';
    }).join('\n');

    // Construct the final order details string
    String orderDetails = '''
:تفاصيل الطلب
============
$mealDetails
------------------
السعر النهائي: \$${totalPrice.toStringAsFixed(2)}

-----------------

العنوان: $address

-----------------
رقم الهاتف: https://wa.me/964${phoneNumber[0] == "0" ? phoneNumber.substring(1) : phoneNumber}
''';

    return orderDetails;
  }

  return formatOrderDetails([
    {"name": 'برياني', "quantity": 2},
    {"name": 'بيتزا', "quantity": 2},
    {"name": 'صاج دجاج', "quantity": 6},
    {"name": 'ريزو', "quantity": 2},
    {"name": 'شاورما لحم', "quantity": 3}
  ], 25, 'الناصرية - حي البشائر', '7806233291');
});


// final textProvider = StateProvider((ref) {
//   return '''
// الطلب:
// قوزي  - العدد 1
// بيتزا لحم - العدد:4 
// لبن - العدد: 5

// الحساب: 50500 دينار عراقي

// رقم الهاتف: wa.me/9647806233291
// العنوان: حي البشائر قرب اسواق الشورجة
// ''';
// });