import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReciPlan'),
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
              'Login to get Started',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
              ),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
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
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
              
                    label: Text('Login'),
                    icon: Icon(Icons.arrow_right),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 20, color: Colors.white), 
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      ); },
                    label: Text('Not a Member? Sign Up'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 20, color: Colors.white), 
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      ); 
                    },
                    label: Text('Sign in as guest'),
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