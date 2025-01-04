import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileCardPage extends StatefulWidget {
  const ProfileCardPage({super.key});

  @override
  _ProfileCardPageState createState() => _ProfileCardPageState();
}

class _ProfileCardPageState extends State<ProfileCardPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  String? _profileImageUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  // Load profile image from Firebase Storage or use default image
  Future<void> _loadProfileImage() async {
    try {
      String userId = _auth.currentUser!.uid;
      final imageRef = _storage.ref().child('profile_pictures/$userId');
      final imageUrl = await imageRef.getDownloadURL();
      setState(() {
        _profileImageUrl = imageUrl;
      });
    } catch (e) {
      // Use default image if no image is uploaded
      setState(() {
        _profileImageUrl = null;
      });
    }
  }

  // Pick an image from the user's gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _isLoading = true;
      });

      // Upload the image to Firebase Storage
      String userId = _auth.currentUser!.uid;
      final imageRef = _storage.ref().child('profile_pictures/$userId');

      try {
        await imageRef.putFile(File(image.path));
        await _loadProfileImage(); // Reload the profile image after upload
      } catch (e) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card'),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 50),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickImage, // Allow user to tap on the avatar to upload a new image
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImageUrl != null
                      ? NetworkImage(_profileImageUrl!)
                      : const AssetImage('assets/avatar.png') as ImageProvider,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user?.email ?? 'No email set',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text('@${user?.email?.toLowerCase().split('.')[0] ?? 'username'}'),
            ],
          ),
        ),
      ),
    );
  }
}
