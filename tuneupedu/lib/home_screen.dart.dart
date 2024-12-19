import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/doctor_image.png'),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anna Baker",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Scientist",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Upcoming Appointment Section
              const Text(
                "Upcoming appointment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 123, 163, 226),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/mendoc_image.jpeg'),
                          radius: 30,
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Jonathan Bells",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Therapist",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 161, 183, 218),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              const Icon(Icons.more_horiz, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 89, 139, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_sharp,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Today, September 2",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "10:00 - 11:00 AM",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Today's Medicines Section
              const Text(
                "Today's medicines",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 225, 225),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 126, 211, 28),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: const EdgeInsets.all(3),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.medical_services_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Coldact",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "3 Capsules/day",
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 117, 178, 228),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: const EdgeInsets.all(3),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Taken",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 225, 225),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 126, 211, 28),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: const EdgeInsets.all(3),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.medical_services_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Coldact",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "3 Capsules/day",
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 117, 178, 228),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: const EdgeInsets.all(3),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Taken",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 225, 225),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 126, 211, 28),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: const EdgeInsets.all(3),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.medical_services_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Coldact",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "3 Capsules/day",
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 117, 178, 228),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: const EdgeInsets.all(3),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Taken",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 225, 225),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 126, 211, 28),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: const EdgeInsets.all(3),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.medical_services_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Coldact",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "3 Capsules/day",
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 117, 178, 228),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: const EdgeInsets.all(3),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Taken",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Medical Tests Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Medical tests",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(221, 230, 228, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.square, color: Colors.red, size: 20),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "BioChemical Blood test",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text(
                                  "Deviation",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.arrow_upward_sharp,
                                          color: Colors.white, size: 16),
                                      SizedBox(width: 5),
                                      Text(
                                        "35%",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
