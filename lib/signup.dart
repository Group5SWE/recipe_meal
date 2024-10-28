import 'package:flutter/material.dart';
import 'login.dart';
import 'database_helper.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final DatabaseHelper _db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Welcome to ReciPlan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sign up for free to get started with your meal planning',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'First Name',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Last Name',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: passwordConfirmController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                                        onPressed: () async {
                      if (firstNameController.text.isEmpty ||
                          lastNameController.text.isEmpty ||
                          usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in all fields')),                          
                        );
                        return;
                      }
                      else if (firstNameController.text.length < 2){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a first name longer than 2 letters')),
                        );
                        return;                           
                      }
                      else if (lastNameController.text.length < 2){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a last name longer than 2 letters')),
                        );
                        return;                           
                      }
                      else if (usernameController.text.length < 6){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a username longer than 2 characters')),
                        );
                        return;                           
                      }
                      else if (passwordController.text.length < 8){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a password longer than 8 characters')),
                        );
                        return;                           
                      }
                      else if (passwordController.text != passwordConfirmController.text){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Your passwords do not match. Please try again')),
                        );
                        return;                           
                      }                      
                      try {
                        await _db.insertUser(
                          firstNameController.text,
                          lastNameController.text,
                          usernameController.text,
                          passwordController.text,
                        );
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Account created successfully!')),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error creating account')),
                        );
                      }
                    },
              
                    label: Text('Sign Up'),
                    icon: Icon(Icons.arrow_right),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 20, color: Colors.white), 
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      ); 
                    },
              
                    label: Text('Already a Member? Login'),
                    icon: Icon(Icons.arrow_left),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 20, color: Colors.white), 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}