class PRM1model {
  final String? childName;
  final String? date;
  final bool? presence;
  final int? mood;  // 1) :)             2) :(                    3)  :|
  final List<String>? naps;
  final bool? mealsBreakfast;
  final bool? mealslunch;   
  final bool? fluidLiquid;
  final bool? fluidBottle;
  final List<String>? diaper;
  final bool? restroomPotty;
  final bool? restroomToilet;
  final List<bool>? clothes;
  final List<String>? activities;
  final List<String>? notes;

  PRM1model({this.activities,this.date,this.childName,this.clothes,this.diaper,this.fluidBottle,this.fluidLiquid,this.mealsBreakfast,this.mealslunch,this.mood,this.naps,this.notes,this.presence,this.restroomPotty,this.restroomToilet});
}