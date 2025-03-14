import 'package:eticaret_fullstack/controllers/category_controller.dart';
import 'package:eticaret_fullstack/controllers/subcategory_controller.dart';
import 'package:eticaret_fullstack/models/category_model.dart';
import 'package:eticaret_fullstack/models/subcategory_model.dart';
import 'package:eticaret_fullstack/views/screens/nav_screens/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<CategoryModel>> futureCategoryList;
  CategoryModel? selectedCategory;
  List<SubcategoryModel> subcategories = [];
  final SubcategoryController subcategoryController = SubcategoryController();
  @override
  void initState() {
    super.initState();
    futureCategoryList = CategoryController().loadCategories();
    futureCategoryList.then((categories) {
    for(var category in categories){
      if(category.name == "Bayb"){
        setState(() {
          selectedCategory = category;
        });
        _loadSubcategories(category.name);
        break;
      } 
    }
    });
  }

// this will load subCat. when category is selected
  Future<void> _loadSubcategories(String categoryName) async {
    try {
      final loadedSubcategories = await subcategoryController
          .getSubcategoriesByCategoryName(categoryName);
      setState(() {
        subcategories = loadedSubcategories;
      });
    } catch (e) {
      print("Error loading subcategories: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 20),
          child: const HeaderWidget()),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: FutureBuilder(
                future: futureCategoryList,
                builder: (context, snapshot) {
                  if (snapshot.data == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final categories = snapshot.data ?? [];
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return ListTile(
                          title: Text(
                            category.name,
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: selectedCategory == category
                                  ? const Color.fromARGB(255, 58, 130, 255)
                                  : Colors.black,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                            _loadSubcategories(category.name);
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          //Row
          Expanded(
              flex: 5,
              child: selectedCategory != null
                  ? Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            selectedCategory!.name,
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.7),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(selectedCategory!.banner),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: subcategories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 4,
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              final subcategory = subcategories[index];
                              return Column(
                                children: [
                                  Image.network(
                                    subcategory.image,
                                    fit: BoxFit.cover,
                                    width: 44,
                                    height: 44,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                          child: Text("Resim yüklenemedi"));
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    subcategory.categoryName,
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }
}
