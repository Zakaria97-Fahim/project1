import 'package:flutter/material.dart';
import 'themes/theme.dart'; // Import your theme file

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable to track if dark mode is enabled
  bool isDarkMode = false;

  // Function to toggle theme mode
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Test App',
      theme: AppThemes.lightTheme, // Light theme
      darkTheme: AppThemes.darkTheme, // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Dynamic theme mode
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomeScreen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Test App',
          style: TextStyle(
            fontFamily: 'Quicksand', // Use Quicksand font for title
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a title',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 20),
            Text(
              'This is body text',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Text(
              'This is bold body text',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleTheme, // Toggle the theme
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set button background to red
              ),
              child: Text(
                'Toggle Theme',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hint text example',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme, // Toggle theme on floating button press
        tooltip: 'Toggle Theme',
        child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
    );
  }
}
