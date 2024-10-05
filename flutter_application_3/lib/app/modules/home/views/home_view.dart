import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// The Controller to manage the state
class PaymentController extends GetxController {
  var enteredAmount = ''.obs; // Reactive variable to hold entered amount
  TextEditingController amountController = TextEditingController();

  // Method to update the enteredAmount
  void updateAmount(String value) {
    enteredAmount.value = value;
  }

  // Method to set predefined amounts
  void setAmount(String value) {
    amountController.text = value; // Set the text in the TextField
    updateAmount(value); // Update the reactive variable
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  // Initialize PaymentController using GetX
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF692729), // Background color of the Scaffold
      appBar: AppBar(
        backgroundColor: const Color(0xFF692729), // Same color for AppBar
        title: Text('Payment'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              // Handle other actions
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0), // General padding for the screen
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xfff2cebe), // Light background color for the container
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select Amount Section
              Text(
                "Select Amount",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900,
                ),
              ),
              Text(
                "Check targeted amount",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              // First row with 2 buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  amountButton('Rp.10,000', Icons.attach_money, '10000'),
                  amountButton('Rp.50,000', Icons.attach_money, '50000'),
                ],
              ),
              SizedBox(height: 20),
              // Second row with 2 buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  amountButton('Rp.100,000', Icons.attach_money, '100000'),
                  amountButton('Rp.250,000', Icons.attach_money, '250000'),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              // Manual Price Entry Section
              Center(
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B3A3A), // Darker background color for the input field
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter price manually',
                      hintStyle: TextStyle(color: const Color.fromARGB(255, 212, 196, 196)),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                    onChanged: controller.updateAmount, // Update state when input changes
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Payment Method Section
              Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  paymentMethodIcon('image/bank.png'),
                  paymentMethodIcon('image/crypto.png'),
                  paymentMethodIcon('image/visa.png'),
                ],
              ),
              Spacer(),
              // Payment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Retrieve entered amount for further action
                    String amount = controller.enteredAmount.value.isEmpty
                        ? "No amount entered"
                        : controller.enteredAmount.value;
                    Get.snackbar("Amount Entered", "You entered: $amount");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: const Color(0xFF8B3A3A), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      color: Colors.white, // Updated text color for better readability
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Button for predefined amounts with icons
  Widget amountButton(String amount, IconData icon, String value) {
    return ElevatedButton.icon(
      onPressed: () {
        controller.setAmount(value); // Update the TextField with selected amount
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B3A3A), // Button color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon, color: Colors.greenAccent), // Icon for currency
      label: Text(
        amount,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // Widget to display payment method icons
  Widget paymentMethodIcon(String assetPath) {
    return Image.asset(
      assetPath,
      height: 50,
      width: 50,
    );
  }
}
