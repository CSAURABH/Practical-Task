// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  File? productImage;
  File? productImage1;

  TextEditingController productName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  String? categoryTitle;
  String? companyTitle;

  //Add product
  addProduct() async {
    String pName = productName.text.trim();
    String descName = description.text.trim();
    String priceName = price.text.trim();
    String qtyName = quantity.text.trim();

    if (productName.text.trim().isEmpty ||
        categoryTitle!.isEmpty ||
        companyTitle!.isEmpty ||
        description.text.trim().isEmpty ||
        price.text.trim().isEmpty ||
        quantity.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill the required field'),
      ));
    } else {
      // Uplaod image to firebase storage
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(const Uuid().v1())
          .putFile(productImage!);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      UploadTask uploadTask1 = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(const Uuid().v1())
          .putFile(productImage1!);

      TaskSnapshot taskSnapshot1 = await uploadTask1;
      String downloadUrl1 = await taskSnapshot1.ref.getDownloadURL();

      // add data to firestore
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('Product');
      Map<String, dynamic> product = {
        'product-name': pName,
        'category': categoryTitle,
        'company': companyTitle,
        'description-name': descName,
        'price-name': priceName,
        'qty-name': qtyName,
        'image': downloadUrl,
        'image2': downloadUrl1
      };
      // ignore: use_build_context_synchronously

      collectionReference.add(product);
    }
  }

  dialog(collection) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              const CircularProgressIndicator(),
              SizedBox(height: 10.h),
              const Text('Loading....'),
            ],
          ),
        );
      },
    ).then(
      (value) => Navigator.pop(context),
    );
  }

  //Upload image
  uploadImage1() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      File convertedFile = File(file.path);
      setState(() {
        productImage = convertedFile;
      });
    }
    return null;
  }

  uploadImage2() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      File convertedFile = File(file.path);
      setState(() {
        productImage1 = convertedFile;
      });
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Add Products',
          style: TextStyle(
            fontSize: 24.sp,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: productName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Product Name',
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5.sp),
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: ExpansionTile(
                    title: Text(
                        categoryTitle == null ? 'Category' : categoryTitle!),
                    children: [
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Category-Name")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox.shrink(),
                            );
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 340,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> name =
                                    snapshot.data!.docs[index].data();
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      categoryTitle = name['category-name'];
                                    });
                                  },
                                  title: Text(name['category-name']),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5.sp),
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: ExpansionTile(
                    title:
                        Text(companyTitle == null ? 'Company' : companyTitle!),
                    children: [
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Company-Name")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox.shrink(),
                            );
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 340,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> name =
                                    snapshot.data!.docs[index].data();
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      companyTitle = name['company-name'];
                                    });
                                  },
                                  title: Text(name['company-name']),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: description,
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Color(0xff6D7072)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: price,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Price',
                  ),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: quantity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: 'Qty',
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Upload Image:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff6D7072),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        uploadImage1();
                      },
                      child: SizedBox(
                        height: 42.h,
                        width: 80.48.w,
                        child: Card(
                          child: productImage != null
                              ? Image.file(
                                  productImage!,
                                  fit: BoxFit.fill,
                                )
                              : const Icon(Icons.add),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        uploadImage2();
                      },
                      child: SizedBox(
                        height: 42.h,
                        width: 80.48.w,
                        child: Card(
                          child: productImage1 != null
                              ? Image.file(
                                  productImage1!,
                                  fit: BoxFit.fill,
                                )
                              : const Icon(Icons.add),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 42.h,
                      width: 80.48.w,
                      child: const Card(
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      height: 42.h,
                      width: 80.48.w,
                      child: const Card(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Minimum 2 Image',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff6D7072),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 342.77.w,
                  height: 44.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6D7072),
                    ),
                    onPressed: () {
                      addProduct();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
