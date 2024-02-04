import 'package:flutter/material.dart';
import 'package:clearcontributions/src/features/donate/presentation/donate_user_form.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String? _citizenship;
  String? _contributionType;
  String _amount = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Citizenship',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Indian',
                    groupValue: _citizenship,
                    onChanged: (value) {
                      setState(() {
                        _citizenship = value;
                      });
                    },
                  ),
                  Text('Indian'),
                  Radio<String>(
                    value: 'Foreign',
                    groupValue: _citizenship,
                    onChanged: (value) {
                      setState(() {
                        _citizenship = value;
                      });
                    },
                  ),
                  Text('Foreign'),
                ],
              ),
              SizedBox(height: 20),
              Text('Contribution Type',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio<String>(
                    value: 'Monthly',
                    groupValue: _contributionType,
                    onChanged: (value) {
                      setState(() {
                        _contributionType = value;
                      });
                    },
                  ),
                  Text('Monthly'),
                  Radio<String>(
                    value: 'One Time',
                    groupValue: _contributionType,
                    onChanged: (value) {
                      setState(() {
                        _contributionType = value;
                      });
                    },
                  ),
                  Text('One Time'),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount (Minimum 100)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  final amount = int.tryParse(value);
                  if (amount == null || amount < 100) {
                    return 'Amount must be at least 100';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = value!;
                },
              ),
              SizedBox(height: 20),
              Text(
                  "❗Please note that if you do not provide your PAN Number, you will not be able to claim 50% tax exemption u/s 80G in India."),
              SizedBox(
                height: 8,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Perform donation processing here
                      print('Citizenship: $_citizenship');
                      print('Contribution Type: $_contributionType');
                      print('Amount: $_amount');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInfoScreen()),
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
