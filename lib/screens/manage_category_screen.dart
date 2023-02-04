import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageCategory extends StatefulWidget {
  const ManageCategory({super.key});

  @override
  State<ManageCategory> createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  TextEditingController categoryName = TextEditingController();

  // Add category name function
  addCategoryName() async {
    String cName = categoryName.text.trim();

    if (categoryName.text.isEmpty) {
    } else {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("Category-Name");

      Map<String, dynamic> name = {'category-name': cName};
      categoryName.clear();
      return collectionReference.add(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Category',
          style: TextStyle(
            fontSize: 24.sp,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: categoryName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Category Name',
                ),
              ),
              SizedBox(height: 21.26.sp),
              SizedBox(
                width: 342.77.w,
                height: 44.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6D7072),
                  ),
                  onPressed: () {
                    addCategoryName();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(height: 41.sp),
              Text(
                "List of categories",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff6D7072),
                ),
              ),
              SizedBox(height: 12.sp),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Category-Name")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> name =
                          snapshot.data!.docs[index].data();
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Card(
                          color: const Color(0xff6D7072),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 17.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name['category-name'],
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('Category-Name')
                                        .doc(documentSnapshot.id)
                                        .delete();
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    size: 18.sp,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
