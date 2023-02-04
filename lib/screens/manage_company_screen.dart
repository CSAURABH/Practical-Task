import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageCompany extends StatelessWidget {
  const ManageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController companyName = TextEditingController();

    //Add company name function
    addCompanyName() async {
      String cName = companyName.text.trim();

      if (companyName.text.isEmpty) {
      } else {
        CollectionReference collectionReference =
            FirebaseFirestore.instance.collection("Company-Name");

        Map<String, dynamic> name = {'company-name': cName};
        companyName.clear();
        return collectionReference.add(name);
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6D7072),
        title: Text(
          'Company',
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
                controller: companyName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Company Name',
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
                    addCompanyName();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(height: 41.sp),
              Text(
                "List of companies",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff6D7072),
                ),
              ),
              SizedBox(height: 12.sp),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Company-Name")
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
                                  name['company-name'],
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('Company-Name')
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
