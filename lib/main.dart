import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "InternHub",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "InternHub",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.work,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Student Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter email";
                      }
                      if (!value.contains("@")) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }
                      if (value.length < 8) {
                        return "Password must be 8 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const StudentDetailsPage(),
                            ),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 /* @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }*/
}

class StudentDetailsPage extends StatefulWidget {
  const StudentDetailsPage({super.key});

  @override
  State<StudentDetailsPage> createState() =>
      _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Student Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter Your Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),

                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your email";
                      }
                      if (!value.contains("@")) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter phone number";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: collegeController,
                    decoration: const InputDecoration(
                      labelText: "College",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.school),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter college name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: courseController,
                    decoration: const InputDecoration(
                      labelText: "Course",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter course";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: yearController,
                    decoration: const InputDecoration(
                      labelText: "Year",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter year";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: skillsController,
                    decoration: const InputDecoration(
                      labelText: "Skills",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.code),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your skills";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      labelText: "Location",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your location";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                college: collegeController.text,
                                course: courseController.text,
                                year: yearController.text,
                                skills: skillsController.text,
                                location: locationController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Continue"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*@override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    collegeController.dispose();
    courseController.dispose();
    yearController.dispose();
    skillsController.dispose();
    locationController.dispose();
    super.dispose();
  }*/
}

class HomePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String college;
  final String course;
  final String year;
  final String skills;
  final String location;

  const HomePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.college,
    required this.course,
    required this.year,
    required this.skills,
    required this.location,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  late String name;
  late String email;
  late String phone;
  late String college;
  late String course;
  late String year;
  late String skills;
  late String location;

  List<String> internships = [
    "Flutter Developer",
    "Web Developer",
    "Python Developer",
    "Java Developer",
  ];

  List<String> companies = [
    "ABC Technologies",
    "XYZ Solutions",
    "Tech Company",
    "Code World",
  ];

  List<String> locations = [
    "Mumbai",
    "Mumbai",
    "Remote",
    "Pune",
  ];

  List<String> savedInternships = [];

  @override
  void initState() {
    super.initState();

    name = widget.name;
    email = widget.email;
    phone = widget.phone;
    college = widget.college;
    course = widget.course;
    year = widget.year;
    skills = widget.skills;
    location = widget.location;
  }

  void updateProfile(
      String newName,
      String newEmail,
      String newPhone,
      String newCollege,
      String newCourse,
      String newYear,
      String newSkills,
      String newLocation,
      ) {
    setState(() {
      name = newName;
      email = newEmail;
      phone = newPhone;
      college = newCollege;
      course = newCourse;
      year = newYear;
      skills = newSkills;
      location = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> indexes = [];

    for (int i = 0; i < internships.length; i++) {
      if (internships[i]
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        indexes.add(i);
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "InternHub",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedPage(
                    savedInternships: savedInternships,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Search internship",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {});
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Welcome, $name",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Available Internships",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                for (int index in indexes)
                  Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: const CircleAvatar(
                        child: Icon(Icons.work),
                      ),
                      title: Text(
                        internships[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${companies[index]}\n${locations[index]}",
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: Icon(
                          savedInternships
                              .contains(internships[index])
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            if (savedInternships
                                .contains(internships[index])) {
                              savedInternships
                                  .remove(internships[index]);
                            } else {
                              savedInternships
                                  .add(internships[index]);
                            }
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InternshipDetails(
                              title: internships[index],
                              company: companies[index],
                              location: locations[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                if (indexes.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: Text(
                        "No internship found",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                const SizedBox(height: 10),

                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text("My Applications"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ApplicationsPage(),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("My Profile"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          name: name,
                          email: email,
                          phone: phone,
                          college: college,
                          course: course,
                          year: year,
                          skills: skills,
                          location: location,
                          onProfileUpdated: updateProfile,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 /* @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }*/
}

class InternshipDetails extends StatelessWidget {
  final String title;
  final String company;
  final String location;

  const InternshipDetails({
    super.key,
    required this.title,
    required this.company,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Internship Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Icon(
                      Icons.work,
                      size: 80,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Company: $company",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Location: $location",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Duration: 3 Months",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Type: Full Time",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Skills: HTML, CSS, Flutter, Python",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "About Internship",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "This internship provides students "
                        "with practical experience and helps "
                        "them understand how the industry works.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ApplyPage(
                              internship: title,
                            ),
                          ),
                        );
                      },
                      child: const Text("Apply Now"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ApplyPage extends StatefulWidget {
  final String internship;

  const ApplyPage({
    super.key,
    required this.internship,
  });

  @override
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Apply Internship",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    widget.internship,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter email";
                      }
                      if (!value.contains("@")) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter phone number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Application Submitted",
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Submit Application"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

class SavedPage extends StatelessWidget {
  final List<String> savedInternships;

  const SavedPage({
    super.key,
    required this.savedInternships,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Saved Internships",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: savedInternships.isEmpty
          ? const Center(
        child: Text(
          "No saved internships",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView(
        children: [
          for (String internship in savedInternships)
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.bookmark,
                  color: Colors.blue,
                ),
                title: Text(internship),
                subtitle:
                const Text("Saved Internship"),
              ),
            ),
        ],
      ),
    );
  }
}

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Applications",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.blue,
              ),
              title: Text("Flutter Developer"),
              subtitle: Text("Application Status: Applied"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.blue,
              ),
              title: Text("Web Developer"),
              subtitle:
              Text("Application Status: Under Review"),
              trailing: Icon(
                Icons.hourglass_bottom,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String college;
  final String course;
  final String year;
  final String skills;
  final String location;

  final Function(
      String,
      String,
      String,
      String,
      String,
      String,
      String,
      String,
      ) onProfileUpdated;

  const ProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.college,
    required this.course,
    required this.year,
    required this.skills,
    required this.location,
    required this.onProfileUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Center(
            child: Text(
              course,
              style: const TextStyle(fontSize: 17),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Email"),
              subtitle: Text(email),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Phone"),
              subtitle: Text(phone),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.school),
              title: const Text("College"),
              subtitle: Text(college),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Course"),
              subtitle: Text(course),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text("Year"),
              subtitle: Text(year),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.code),
              title: const Text("Skills"),
              subtitle: Text(skills),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Location"),
              subtitle: Text(location),
            ),
          ),

          const SizedBox(height: 15),

          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit Profile"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    name: name,
                    email: email,
                    phone: phone,
                    college: college,
                    course: course,
                    year: year,
                    skills: skills,
                    location: location,
                  ),
                ),
              );

              if (result != null) {
                onProfileUpdated(
                  result["name"],
                  result["email"],
                  result["phone"],
                  result["college"],
                  result["course"],
                  result["year"],
                  result["skills"],
                  result["location"],
                );

                Navigator.pop(context);
              }
            },
          ),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const NotificationsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String college;
  final String course;
  final String year;
  final String skills;
  final String location;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.college,
    required this.course,
    required this.year,
    required this.skills,
    required this.location,
  });

  @override
  State<EditProfilePage> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController collegeController;
  late TextEditingController courseController;
  late TextEditingController yearController;
  late TextEditingController skillsController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.name);
    emailController =
        TextEditingController(text: widget.email);
    phoneController =
        TextEditingController(text: widget.phone);
    collegeController =
        TextEditingController(text: widget.college);
    courseController =
        TextEditingController(text: widget.course);
    yearController =
        TextEditingController(text: widget.year);
    skillsController =
        TextEditingController(text: widget.skills);
    locationController =
        TextEditingController(text: widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: collegeController,
                decoration: const InputDecoration(
                  labelText: "College",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: "Course",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.book),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: yearController,
                decoration: const InputDecoration(
                  labelText: "Year",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: skillsController,
                decoration: const InputDecoration(
                  labelText: "Skills",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: "Location",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      {
                        "name": nameController.text,
                        "email": emailController.text,
                        "phone": phoneController.text,
                        "college": collegeController.text,
                        "course": courseController.text,
                        "year": yearController.text,
                        "skills": skillsController.text,
                        "location": locationController.text,
                      },
                    );
                  },
                  child: const Text("Save Changes"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    collegeController.dispose();
    courseController.dispose();
    yearController.dispose();
    skillsController.dispose();
    locationController.dispose();
    super.dispose();
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
            title: Text("New Internship"),
            subtitle: Text(
              "New Flutter internship is available",
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
            title: Text("Application Update"),
            subtitle: Text(
              "Your application is under review",
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Notifications"),
            subtitle: const Text(
              "Receive internship notifications",
            ),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Change Password Selected"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About InternHub",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                Icon(
                  Icons.work,
                  size: 80,
                  color: Colors.blue,
                ),
                SizedBox(height: 15),
                Text(
                  "InternHub",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "InternHub is a simple internship "
                      "application for students. Students "
                      "can search internships, save them "
                      "and apply for available opportunities.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
    TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.lock_reset,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              "Reset your password",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Password reset link sent",
                      ),
                    ),
                  );
                },
                child: const Text("Send Reset Link"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}