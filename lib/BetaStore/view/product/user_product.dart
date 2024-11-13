import 'dart:io'; // For using File class
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase Authentication
import '../../model/products.dart';
import '../../provider/create_provider.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/custom_button.dart';

class CreateProductPage extends ConsumerStatefulWidget {
  const CreateProductPage({super.key});

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends ConsumerState<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form inputs
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _ratingRateController = TextEditingController();
  final TextEditingController _ratingCountController = TextEditingController();

  // Variable to store the picked image
  File? _pickedImage;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  // Function to create a new product
  Future<void> _createProduct() async {
    // Get the logged-in user
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // If the user is not logged in, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
              'You must be logged in to create a product',
            ),
            backgroundColor: Colors.orange),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_pickedImage == null) {
        // Show a SnackBar if no image is selected
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please select an image'),
              backgroundColor: Colors.orange),
        );
        return;
      }

      final product = Product(
        id: DateTime.now().millisecondsSinceEpoch, // Unique ID
        title: _titleController.text,
        price: double.parse(_priceController.text),
        description: _descriptionController.text,
        category: _categoryController.text,
        image: _pickedImage!.path, // Store the image path
        rating: Rating(
          rate: double.parse(_ratingRateController.text),
          count: int.parse(_ratingCountController.text),
        ),
        userId: user.uid, // Attach the logged-in user ID to the product
      );

      // Add product using Riverpod's provider
      await ref.read(productProvider).addProduct(product);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Product added successfully!'),
            backgroundColor: Colors.orange),
      );
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      appBar: AppBar(
        title: const Text('Create Your Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the product title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the category';
                    }
                    return null;
                  },
                ),
                // Display picked image
                const SizedBox(
                  height: 10,
                ),
                if (_pickedImage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.file(
                        _pickedImage!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                // Button to pick an image
                TextButton(
                  onPressed: _pickImage,
                  child: const Text('Pick Image',
                      style: TextStyle(color: Colors.orange)),
                ),
                TextFormField(
                  controller: _ratingRateController,
                  decoration: const InputDecoration(labelText: 'Rating (Rate)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the rating rate';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ratingCountController,
                  decoration:
                      const InputDecoration(labelText: 'Rating (Count)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the rating count';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    desireColor: Colors.orange.withOpacity(0.6),
                    screenSize: screenSize,
                    text: 'Create',
                    onPressed: _createProduct,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _ratingRateController.dispose();
    _ratingCountController.dispose();
    super.dispose();
  }
}
