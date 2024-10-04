import 'package:flutter/material.dart'; 
import 'themes/theme.dart'; 

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(); 
}

class _MyAppState extends State<MyApp> {
  
  bool isDarkMode = false; // Boolean variable to toggle between dark and light themes

  // Function to toggle the theme mode
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Switch between light and dark mode
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Test App', // App's title
      theme: AppThemes.lightTheme, // Light theme from custom themes file
      darkTheme: AppThemes.darkTheme, // Dark theme from custom themes file
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Setting theme mode based on `isDarkMode`
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode), // Setting the home screen of the app
    );
  }
}

// Stateless widget for the home screen
class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme; // Callback function to toggle theme
  final bool isDarkMode; // Boolean to check if dark mode is active

  // Constructor to initialize toggleTheme and isDarkMode
  const HomeScreen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold provides the structure for the screen
      appBar: AppBar(
        title: const Text( // Title for the app bar
          'Theme Test App',
          style: TextStyle(
            fontFamily: 'Quicksand', // Custom font for the title text
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centering the column
          children: <Widget>[
            // Large title text
            Text(
              'This is a title',
              style: Theme.of(context).textTheme.displayLarge, // Using theme style for large text
            ),
            SizedBox(height: 20), // Adding space between widgets
            // Body text
            Text(
              'This is body text',
              style: Theme.of(context).textTheme.bodyLarge, // Using theme style for body text
            ),
            SizedBox(height: 20), 
            // Bold body text
            Text(
              'This is bold body text',
              style: Theme.of(context).textTheme.bodyMedium, // Using theme style for medium text
            ),
            SizedBox(height: 20),
            // Elevated button to toggle the theme
            ElevatedButton(
              onPressed: toggleTheme, // Calls the theme toggle function
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button's background color
              ),
              child: Text(
                'Toggle Theme', // Button's label
                style: Theme.of(context).textTheme.labelLarge, // Using theme style for label text
              ),
            ),
            SizedBox(height: 20),
            // Example of hint text
            Text(
              'Hint text example',
              style: Theme.of(context).textTheme.bodySmall, // Using theme style for small text
            ),
          ],
        ),
      ),
      // Floating action button to toggle theme mode
      floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme, // Toggles theme on button press
        tooltip: 'Toggle Theme', // Tooltip text for the button
        child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode), // Changes icon based on the current theme
      ),
    );
  }
}
