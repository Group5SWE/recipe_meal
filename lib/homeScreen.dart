import 'package:flutter/material.dart';
import 'package:recipe_meal/groceryList.dart';
import 'recipeList.dart';
import 'mealPlanner.dart';
import 'database_helper.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
 @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper _db = DatabaseHelper();
  String?_firstName;
  String?_lastName;
  String _fullName = 'User';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final users = await _db.database.then((db) => db.query('users', limit: 1));
      if (users.isNotEmpty) {
        setState(() {
          _firstName = users.first['first_name'] as String;
          _lastName = users.first['last_name'] as String;
          _fullName = '$_firstName $_lastName';
        });
      } else {
        _navigateToLogin();
      }
    } catch (e) {
      print('Error loading user data: $e');
      _navigateToLogin();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

    void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _logout() async {
    await _db.database.then((db) => db.close());
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
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
              'Welcome back, $_fullName!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What would you like to plan today?',
              style: TextStyle(
                fontSize: 18.0,
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
                          builder: (context) => RecipeListScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.book),
                    label: Text('Recipes'),
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
                          builder: (context) => MealPlannerScreen(),
                        ),
                      ); },
                    icon: Icon(Icons.calendar_today),
                    label: Text('Meal Planner'),
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
                          builder: (context) => GroceryListScreen(),
                        ),
                      ); 
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Grocery List'),
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
