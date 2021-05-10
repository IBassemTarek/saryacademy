class PRM1model {
     String  childName;
     String  date;
     bool  presence;
     int  mood;  // 1) :)             2) :(                    3)  :|
     List<String>  naps;
     bool  mealsBreakfast;
     bool  mealslunch;   
     bool  fluidLiquid;
     bool  fluidBottle;
     List<String>  diaper;
     bool  restroomPotty;
     bool restroomToilet;
     List<bool>  clothes;
     List<String> activities;
     List<String>  notes;

  PRM1model({this.activities,this.date,this.childName,this.clothes,this.diaper,this.fluidBottle,this.fluidLiquid,this.mealsBreakfast,this.mealslunch,this.mood,this.naps,this.notes,this.presence,this.restroomPotty,this.restroomToilet});
}