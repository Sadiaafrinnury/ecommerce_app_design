import 'package:ecommerce_app_design/views/add_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PaymentController extends GetxController {
  var selectedMethod = ''.obs;

  void togglePaymentMethod(String method) {
    if (selectedMethod.value == method) {
      selectedMethod.value = '';
    } else {
      selectedMethod.value = method;
    }
  }
}

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF433FFF).withOpacity(0.7),
                Colors.cyan.withOpacity(0.6),
                Colors.white.withOpacity(0.5),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 350),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                Text(
                  "Choose the Payment Method",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                // Progress steps
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProgressStep(
                      imagePath: 'assets/images/ecommerce completed order.png',
                      label: "Cart",
                      isActive: true,
                    ),
                    ProgressLine(isActive: true),
                    ProgressStep(
                      imagePath: 'assets/images/credit cards.png',
                      label: "Payment",
                      isActive: true,
                    ),
                    ProgressLine(isActive: true),
                    ProgressStep(
                      imagePath: 'assets/images/home.png',
                      label: "Home",
                      isActive: true,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Image(image: AssetImage("assets/images/Card.png")),
                SizedBox(height: 10),
                OrDivider(),
                SizedBox(height: 10),

                // Payment options
                Obx(() => Column(
                  children: [
                    PaymentOption(
                      value: 'Google Pay',
                      text: 'Google Pay',
                      imagePath: 'assets/images/Google Pay.png',
                      isSelected: paymentController.selectedMethod.value == 'Google Pay',
                      onChanged: paymentController.togglePaymentMethod,
                    ),
                    PaymentOption(
                      value: 'Paytm',
                      text: 'Paytm',
                      imagePath: 'assets/images/Paytm.png',
                      isSelected: paymentController.selectedMethod.value == 'Paytm',
                      onChanged: paymentController.togglePaymentMethod,
                    ),
                    PaymentOption(
                      value: 'Cash on Delivery',
                      text: 'Cash on Delivery',
                      imagePath: 'assets/images/Cash and coins.png',
                      isSelected: paymentController.selectedMethod.value == 'Cash on Delivery',
                      onChanged: paymentController.togglePaymentMethod,
                    ),
                  ],
                )),

                SizedBox(height: 40),
                GradientButton(
                  onPressed: () {
                    Get.to(AddCard());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;

  GradientButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 60),
            Icon(Icons.chevron_right, color: Colors.white),
            Icon(Icons.chevron_right, color: Colors.white),
            Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String value;
  final String text;
  final String imagePath;
  final bool isSelected;
  final Function(String) onChanged;

  const PaymentOption({
    required this.value,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: ListTile(
            dense: true,
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Radio<String>(
                value: value,
                groupValue: isSelected ? value : null,
                onChanged: (newValue) => onChanged(value),
                activeColor: isSelected ? Colors.grey : Colors.transparent,
              ),
            ),
            title: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
            trailing: Image.asset(
              imagePath,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 3,
                endIndent: 10,
              ),
            ),
            Text(
              "or",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 3,
                indent: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressStep extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isActive;

  ProgressStep({required this.imagePath, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: isActive ? Colors.white : Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class ProgressLine extends StatelessWidget {
  final bool isActive;

  ProgressLine({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      color: isActive ? Colors.white : Colors.grey[300],
    );
  }
}







