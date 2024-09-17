import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/providers/getFinalOrder.dart';
import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:firebase_training/providers/total_price_provider.dart';
import 'package:firebase_training/providers/user_address_provider.dart';
import 'package:firebase_training/providers/user_phone_number_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderReviewScreen extends ConsumerWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController phoneNumerController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final text = ref.watch(textProvider);
    final ordersList = ref.watch(mealsFinalListProvider);
    final totalPrice = ref.watch(totalPriceProvider);
    final number = ref.watch(userPhoneNumberProvider);
    final address = ref.watch(userAdressProvider);
    final List<Widget> list = List.generate(
      ordersList.length,
      (index) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // IconButton(
              //     onPressed: () {}, icon: Icon(Icons.app_registration_rounded),),
              Text(
                'عدد: ${ordersList[index]['quantity']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Text(
                '${ordersList[index]['name']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ],
          ),
          index != ordersList.length
              ? const Divider()
              : const SizedBox(
                  height: 10,
                ),
        ],
      ),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'تفاصيل عملية الدفع:',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        customTextField(
                            controller: phoneNumerController,
                            ref: ref,
                            label: 'رقم الهاتف:',
                            messageOnError:
                                'الرجاء اضافة رقم هاتفك ليتم التواصل معك بخصوص الطلب',
                            maxLength: 11,
                            isNumber: true,
                            onSaved: (value) {
                              ref
                                  .read(userPhoneNumberProvider.notifier)
                                  .update((state) => value.toString());
                            }),
                        customTextField(
                            controller: addressController,
                            isNumber: false,
                            ref: ref,
                            label: 'العنوان',
                            messageOnError: 'الرجاء قم بإضافة عنوان عنوان صالح',
                            maxLength: 60,
                            hint:
                                'مثال: الناصرية - شارع الامام علي - قرب مصرف بغداد',
                            onSaved: (value) {
                              ref
                                  .read(userAdressProvider.notifier)
                                  .update((state) => value.toString());
                            }),
                        GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                Navigator.pushNamed(context, 'finalScreen');
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'خطأ في ملئ المعلومات',
                                          textAlign: TextAlign.center,
                                        ),
                                        content: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                              const Text(
                                                textAlign: TextAlign.center,
                                                'هنالك خطأ في المعلومات المدخلة الرجاء التأكد من أن رقم الهاتف كامل',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors.orange),
                                                  child: const Text(
                                                    textAlign: TextAlign.center,
                                                    'أغلاق',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        0.1), // Shadow color with lower opacity
                                    spreadRadius:
                                        5, // Increase the spread radius
                                    blurRadius: 10, // Increase the blur radius
                                    offset: const Offset(
                                        0, 5), // Increase the vertical offset
                                  ),
                                ],
                              ),
                              child: const Text(
                                'اطلب الآن',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.green,
          isExtended: true,
          label: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              const Text(
                'اطلب الآن  ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'قائمة طلباتي:',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            ...list,
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 10, top: 20, right: 10, bottom: 10),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.green),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  'المجموع: ${formatNumber(totalPrice)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Directionality customTextField({
    required TextEditingController controller,
    required WidgetRef ref,
    required String label,
    required String messageOnError,
    required int maxLength,
    required Function onSaved,
    required bool isNumber,
    hint,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return messageOnError;
          } else if (isNumber == true) {
            if (value.length < 11) {
              return 'خطأ في الرقم الرجاء التأكد من أن الرقم صحيح';
            }
          }
        },
        onSaved: (value) {
          onSaved(value);
        },
        maxLength: maxLength,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          floatingLabelStyle: const TextStyle(
            fontSize: 18,
            color: Colors.green,
          ),
          labelStyle: const TextStyle(fontSize: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.green),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
