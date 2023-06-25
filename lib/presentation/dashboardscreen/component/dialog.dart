import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants.dart';
import '../../../utils/image_picker_phone.dart';
import 'package:extended_image/extended_image.dart';

class ShippingAddressDialog extends StatefulWidget {
  const ShippingAddressDialog({Key, key}) : super(key: key);

  @override
  _ShippingAddressDialogState createState() => _ShippingAddressDialogState();
}

class _ShippingAddressDialogState extends State<ShippingAddressDialog> {
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  ImageProvider<Object>? pickedImage;

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  Uint8List? _image;
  void selectImage() async {
    Uint8List im = await Utilis().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      insetPadding: const EdgeInsets.all(0),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      title: const Text('ADD PRODUCTS'),
      content: Form(
        key: formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _image == null
                    ? const Text('')
                    : Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: MemoryImage(_image!))),
                      ),
                const SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Name';
                    }
                    return null;
                  },
                  controller: countryController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a state';
                    }
                    return null;
                  },
                  controller: stateController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a city';
                    }
                    return null;
                  },
                  controller: cityController,
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a postal code';
                    }
                    return null;
                  },
                  controller: postalCodeController,
                  decoration: const InputDecoration(labelText: 'Catagory'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a postal code';
                    }
                    return null;
                  },
                  controller: postalCodeController,
                  decoration: const InputDecoration(labelText: 'Sub Catagory'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a postal code';
                    }
                    return null;
                  },
                  controller: postalCodeController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            // if (formKey.currentState!.validate()) {
            selectImage();
            //  }
          },
          child: const Text('Pick Image'),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Save form data
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
