import 'package:flutter/material.dart';
import 'package:product_app/widget/my_buttom.dart';
import 'package:product_app/widget/my_textformfield.dart';

import '../utils/regular excepression.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  String? selectTime;
  String? select;
  List<String> time = ['Morning', 'AfterNoon', 'Evining', 'night'];
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Order'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextFormField(
                    hintText: 'Your Name',
                    validator: RegularExceprationsConstants().isUserNameValide,
                  ),
                  MyTextFormField(
                    hintText: 'Your Phone',
                    validator: RegularExceprationsConstants().isUserPhoneValide,
                  ),
                  DropdownButtonFormField(
                      padding: const EdgeInsets.all(8),
                      decoration: InputDecoration(
                          labelText: 'Choose delivery time',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      items: time
                          .map((t) => DropdownMenuItem(
                                value: t,
                                child: Text(t),
                              ))
                          .toList(),
                      onChanged: (x) {
                        selectTime = x;
                        setState(() {});
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Paymenet Way :'),
                        Row(
                          children: [
                            Radio(
                                value: 'Cash',
                                groupValue: select,
                                onChanged: (x) {
                                  select = x;
                                  setState(() {});
                                }),
                            const Text('Cash')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'Alamqy',
                                groupValue: select,
                                onChanged: (x) {
                                  select = x;
                                  setState(() {});
                                }),
                            const Text('Alamqy')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 'Alkrimi',
                                groupValue: select,
                                onChanged: (x) {
                                  select = x;
                                  setState(() {});
                                }),
                            const Text('Alkrimi')
                          ],
                        )
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        hintText: 'Notes ..',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    minLines: 5,
                    maxLines: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButtom(
                    name: 'Order',
                    onPressed: () {
                      fromKey.currentState!.validate();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
