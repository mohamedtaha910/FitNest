import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_app/components/too_many_requests_page.dart';
import 'package:wellness_app/screens/excercises_page.dart';
import 'package:wellness_app/screens/search_page.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:wellness_app/services/excercise_services.dart';
import 'package:wellness_app/shimmers/shimmer_grid.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.chevron_left_rounded, color: Colors.black, size: 32,),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  // margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.search, size: 20, color: Colors.black38,),
                      SizedBox(width: 12,),
                      Text(
                        'Search Exercises',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18,),
              Text(
                'Muscles',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              FutureBuilder(
                future: ExcerciseServices().getAllMuscles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ShimmerGrid();
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    final List<String> muscles = snapshot.data as List<String>;

                    return muscles.isEmpty ? TooManyRequestsPage()
                    
                    :  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: muscles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 16,
                        childAspectRatio: 3.5,
                      ),
                      itemBuilder: (context, index) {
                        final String muscle = muscles[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExercisesPage(future: ExcerciseServices().getExcercisesByMuscle(muscle) , query: muscle,)));
                          },
                          child: Container(
                            // margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300.withAlpha(200),
                                width: 0.4,
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    muscle,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                Icon(Icons.chevron_right_rounded, color: Colors.black54, size: 22,)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return ShimmerGrid();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
