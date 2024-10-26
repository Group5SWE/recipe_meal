import 'package:flutter/material.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
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
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'First Name',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Last Name',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              ),
            ),
            SizedBox(height: 5),
            TextField(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
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