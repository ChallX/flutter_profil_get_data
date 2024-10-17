import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  // Add parameters to the constructor
  final String name;
  final String role;
  final String school;
  final String description;

  // Constructor with required parameters
  const Page2({
    Key? key,
    required this.name,
    required this.role,
    required this.school,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow from AppBar
        backgroundColor: Colors.transparent, // Make AppBar transparent
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button icon color
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous page
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"), // Background image path
                fit: BoxFit.cover, // Fit image to cover
              ),
            ),
          ),

          // Content over the background
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Space for the CircleAvatar
                SizedBox(height: 80),

                // Profile picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/me.jpg'), // Profile picture path
                ),
                SizedBox(height: 10),
                Text(
                  name, // Display the name passed from the previous page
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // About section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Role: $role\nSekolah: $school\nDeskripsi: $description', // Display role, school, and description
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Skills section (optional)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    color: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tech Stack',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Example skill items
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'images/Laravel.png', // Replace with the path to Laravel image
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Laravel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/js.png', // Replace with the path to JavaScript image
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'JavaScript',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/tailwindcss.png', // Replace with the path to Tailwind CSS image
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'TailwindCSS',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
