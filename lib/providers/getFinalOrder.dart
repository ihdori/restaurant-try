import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:firebase_training/providers/total_price_provider.dart';
import 'package:firebase_training/providers/user_address_provider.dart';
import 'package:firebase_training/providers/user_phone_number_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((ref) {
  final mealList = ref.watch(mealsFinalListProvider);
  final totalPrice = ref.watch(totalPriceProvider);
  final address = ref.watch(userAdressProvider);
  final phoneNumber = ref.watch(userPhoneNumberProvider);
  String formatOrderDetails(List<Map<String, dynamic>> meals, int totalPrice,
      String address, String phoneNumber) {
    // Construct the meal details string
    String mealDetails = meals.map((meal) {
      return '${meal['name']} --- العدد: ${meal['quantity']}';
    }).join('\n');

    // Construct the final order details string
    String orderDetails = '''
تفاصيل الطلب:
==============
$mealDetails
-------------------------------

السعر النهائي:  ${formatNumber(totalPrice)}

-------------------------------

العنوان: $address

-------------------------------
رقم الهاتف: https://wa.me/964${phoneNumber[0] == "0" ? phoneNumber.substring(1) : phoneNumber}
''';

    return orderDetails;
  }

  return formatOrderDetails(
    mealList,
    totalPrice,
    address,
    phoneNumber,
  );
});
