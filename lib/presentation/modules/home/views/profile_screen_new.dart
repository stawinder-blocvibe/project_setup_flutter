import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileScreenNew extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => CircleAvatar(
                  radius: 50,
                  backgroundImage: controller.avatarUrl.value.isNotEmpty
                      ? NetworkImage(controller.avatarUrl.value)
                      : null,
                  child: controller.avatarUrl.value.isEmpty
                      ? const Icon(Icons.person, size: 50)
                      : null,
                )),
            const SizedBox(height: 16),
            Obx(() => Text(
                  controller.name.value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 8),
            Obx(() => Text(
                  controller.email.value,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                )),
            const SizedBox(height: 8),
            Obx(() => Text(
                  controller.phone.value,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                )),
            const SizedBox(height: 16),
            Obx(() => Text(
                  controller.bio.value,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: (){
                controller.logout();
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/**/