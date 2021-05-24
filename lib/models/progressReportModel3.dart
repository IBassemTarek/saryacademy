// 0- غير مقاس 
// 1- تقدم جيد
// 2- جاري العمل عليها
// 3- غير مطابق

class PRM3model {
   List<int>  socialSkills; // 0)unmeasured             1)Good Progress                2)Working on Skill           3)Not Applicable
   List<int>  personalDevelopment;
   List<int>  physicalDevelopment;
  PRM3model({this.socialSkills,this.personalDevelopment,this.physicalDevelopment});
}


class PRM3Listmodel {
   List<PRM3model>  allMonthsReports; 
      String studentNameA;
      String studentNameE;
      String month1E;
      String month2E;
      String month3E;
      String month1A;
      String month2A;
      String month3A;
  PRM3Listmodel({this.allMonthsReports,this.month1E,this.month2E,this.month3E,this.studentNameA,this.studentNameE,this.month1A,this.month2A,this.month3A});
}


PRM3Listmodel prM3modeltest = PRM3Listmodel(
studentNameA:'جني',
studentNameE:'Jana',
month1A: 'مايو',
month1E: 'May',
month2A: 'يونيو',
month2E: 'June',
month3A: 'يوليو',
month3E: 'July',
allMonthsReports: [
 PRM3model(
  personalDevelopment: [0,0,0,0,0],
  physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
  socialSkills: [0,0,0,0,0,0,0,0,0,0,0,0,0]
),
PRM3model(//1)Good Progress                2)Working on Skill           3)Not Applicable
  personalDevelopment: [1,2,2,1,2],
  physicalDevelopment:  [1,2,2,3,2,3,2,2,1,2],
  socialSkills: [1,2,2,3,2,3,2,1,2,2,3,2,3]
),
PRM3model(
  personalDevelopment: [1,1,1,1,1],
  physicalDevelopment:  [1,1,1,1,1,2,1,1,1,1],
  socialSkills: [1,1,1,1,1,2,1,1,1,1,1,1,2]
),
]);