import 'package:flutter/material.dart';
import 'package:wellness_app/components/custom_row.dart';
import 'package:wellness_app/screens/Excercises_page.dart';
import 'package:wellness_app/services/excercise_services.dart';
import 'package:wellness_app/shimmers/shimmer_list.dart';

class EquipmentsPage extends StatefulWidget {
  const EquipmentsPage({super.key});

  @override
  State<EquipmentsPage> createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage> {
  Map<String, String> equipmentsIcons = {
    "stepmill machine": 'aseets/icons/equipments/stepmills.png',
    "elliptical machine": 'aseets/icons/equipments/eliptical_machine.png',
    "trap bar": 'aseets/icons/equipments/trap_bar.png',
    "tire": 'aseets/icons/equipments/tire.png',
    "stationary bike": 'aseets/icons/equipments/staionary_bike.png',
    "wheel roller": 'aseets/icons/equipments/Air Balloon 1.png',
    "smith machine": 'aseets/icons/equipments/smith_machine.png',
    "hammer": 'aseets/icons/equipments/hammer2.png',
    "skierg machine": 'aseets/icons/equipments/skeirg_machine.png',
    "roller": 'aseets/icons/equipments/roller.png',
    "resistance band": 'aseets/icons/equipments/rubber-bands.png',
    "bosu ball": 'aseets/icons/equipments/bosu_ball.png',
    "weighted": 'aseets/icons/equipments/weight-plates.png',
    "olympic barbell": 'aseets/icons/equipments/olympic_barbell.png',
    "kettlebell": 'aseets/icons/equipments/kettlebell.png',
    "upper body ergometer": 'aseets/icons/equipments/upper_body_ergometer.png',
    "sled machine": 'aseets/icons/equipments/sled_machine.png',
    "ez barbell": 'aseets/icons/equipments/ez_bar2.png',
    "dumbbell": 'aseets/icons/equipments/dumbbell2.png',
    "rope": 'aseets/icons/equipments/jumping-rope.png',
    "barbell": 'aseets/icons/equipments/barbell.png',
    "band": 'aseets/icons/equipments/resistance_band2.png',
    "stability ball": 'aseets/icons/equipments/stability_ball.png',
    "medicine ball": 'aseets/icons/equipments/medicine_ball.png',
    //"assisted"
    "leverage machine": 'aseets/icons/equipments/laverage_machine.png',
    "cable": 'aseets/icons/equipments/cable.png',
    "body weight": 'aseets/icons/equipments/body_weight2.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
       FutureBuilder(
        future: ExcerciseServices().getEquipments(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<String> equipments = snapshot.data!;
            return equipments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wifi_tethering_error,
                          size: 100,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Too many requests , try again later',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final String equipment = equipments[index];
      
                      final String icon =
                          equipmentsIcons[equipment] ??
                          'aseets/icons/equipments/dumbell.png';
      
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ExercisesPage(
                                future: ExcerciseServices()
                                    .getExcerciseByEquipment(equipment),
                                query: equipment,
                              ),
                            ),
                          );
                        },
                        child: CustomRow(bodyPart: equipment, icon: icon),
                      );
                    },
                  );
          } else {
            return ShimmerList();
          }
        },
      ),
    );
  }
}
