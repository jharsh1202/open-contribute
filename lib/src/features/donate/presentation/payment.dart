import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _paymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 16),

            // SizedBox(height: 32),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Credit Card'),
              leading: Radio(
                value: 'credit_card',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    // print(value);
                    _paymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('UPI'),
              leading: Radio(
                value: 'upi',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    _paymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Netbanking / Card(Debit/Credit)'),
              leading: Radio(
                value: 'netbanking',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    _paymentMethod = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            if (_paymentMethod == 'credit_card') CardDetailsForm(),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to submit payment
                },
                child: Text('Submit Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailsForm extends StatelessWidget {
  const CardDetailsForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Card Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Card Number'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Expiration Date'),
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(labelText: 'Cardholder Name'),
        ),
      ],
    );
  }
}
