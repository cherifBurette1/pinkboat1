import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
import 'package:js_shims/js_shims.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

String BASE_URL = 'https://pinkboat.herokuapp.com';
//String BASE_URL = "https://mscmaproject.herokuapp.com";
String retrivePath = "https://pinkboat.herokuapp.com/login/forget-password";

class Apis {
static String screenresult ="";
static bool lang =true;
static String sampleresult ="";
  static String mytoken ="";
  static String id = "";
  static String first_name = "";
  static String middle_name = "";
  static String last_name = "";
  static String email = "";
  static String pic = "";
  static String phone = "";
static String street = "";
static String national = "";
static String password="";
static String upemail="";
  static String fmail = "";
static String area="";
static String city="";
static String dob="";
static String mobileid="";
  static saveUserApi(data) async {
    var response = await http.post(BASE_URL + "/savecitizen",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    return beResponse;
  }

  // static userSignIn(data) async {
  //   var response = await http.post(BASE_URL + "/signin",
  //       body: json.encode(data), headers: {"Content-Type": "application/json"});
  //   var beResponse = json.decode(response.body);
  //   return beResponse;
  // }
static dynamic familyadd(data) async {
    var response = await http.post(BASE_URL + "/addFamily",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
  var newdecodedresponse = decodedResponse['message'];
    return newdecodedresponse;
  }
static dynamic familyshow(data) async {
    var response = await http.post(BASE_URL + "/getFamilyHistory",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
  List newdecodedresponse = decodedResponse['familyHistory'] as List;
    return newdecodedresponse;
  }
  static userSignIn(data) async {
    var response = await http.post(BASE_URL + "/signin",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    
    var beResponse = json.decode(response.body);
    // print(beResponse['citizen']);
    // assign citizen to userData
    var userData = beResponse['citizen'];
    // save user data in shared pref
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', JSON.stringify(userData));
    return beResponse;
  }

  static uploadpropic(data) async {
    var response = await http.put(BASE_URL + "/uploadProfilePic",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    return beResponse;
  }
   static changeemail(data) async {
    var response = await http.put(BASE_URL + "/changeEmail",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    return beResponse;
  }
   static changepassword(data) async {
    var response = await http.put(BASE_URL + "/resetPassword",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    return beResponse;
  }

   static changephone(data) async {
    var response = await http.put(BASE_URL + "/changePhone",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    return beResponse;
  }




  static dynamic getPosts() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    List decodedResponse = json.decode(response.body) as List;
    return decodedResponse;
  }

  static dynamic showtreatmentplan(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showTreatmentPlan",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["plans"] as List;
    return newdecodedResponse;
  }

  static dynamic showsession(data) async {
    var response = await http.post(BASE_URL + "/showSessions",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["sessions"] as List;
    return newdecodedResponse;
  }

  static dynamic showmedication(data) async {
    var response = await http.post(BASE_URL + "/showMedications",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["medications"] as List;
    return newdecodedResponse;
  }

  // forget password

  static verify1(String code) async {
    var data = {
      "email": fmail,
      "code": code,
    };
    var response = await http.put(BASE_URL + "/emailVerification",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    return beResponse;
  }


 static dynamic retrivePassword(String email) async {
    var data = {
      "email": email,
    };
    var response = await http.post(
        "https://pinkboat.herokuapp.com/login/forgetPassword",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    return decodedResponse;
  }
  
  // static dynamic getHospitals() async {
  //   var response = await http.get("https://millionscma.herokuapp.com/gethospitals");
  //   List decodedResponse = json.decode(response.body) as List;
  //   return decodedResponse;
  // }

  static dynamic getAwareness() async {
    var response = await http.get(
        "https://pinkboat.herokuapp.com/getAllUpcomingAwarenessCampaignsSortedByDate");
    var dResponse = json.decode(response.body);
    List decodedResponse = dResponse["upcomingCampaigns"] as List;
    return decodedResponse;
  }

  // hospital api

  static dynamic getHospitals() async {
    var response =
        await http.get("https://pinkboat.herokuapp.com/getallhospitals");
    List decodedResponse = json.decode(response.body) as List;
    return decodedResponse;
  }

  static dynamic getHospitalsSorted() async {
    var response =
        await http.get("https://pinkboat.herokuapp.com/getAllhospitalsSorted");
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["medicalOrg"] as List;
    return newdecodedresponse;
  }

  static dynamic getHospitalsSortedDetails(String mid) async {
    var data = {"token": Apis.mytoken, "medicalOrg_id": mid};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getHospitalDetailsByMedicalCode",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    dynamic newdecodedResponse = decodedResponse["hospital"];
    return newdecodedResponse;
  }




  // test center 
 static dynamic getcenterdetails(String mid) async {
    var data = {"token": Apis.mytoken, "mobile_id": mid};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getMobileTestCenterDetailsByIdWithNearestSchedule",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    dynamic newdecodedResponse = decodedResponse["mobileWithSchedule"];
    return newdecodedResponse;
  }
  static dynamic getTestCenterStatic() async {
    var response = await http
        .get("https://pinkboat.herokuapp.com/getAllStaticTestCenters");
    List decodedResponse = json.decode(response.body) as List;
    return decodedResponse;
  }

  static dynamic getTestCenterStaticSorted() async {
    var response = await http
        .get("https://pinkboat.herokuapp.com/getAllStaticTestCentersSorted");
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse as List;
    return newdecodedresponse;
  }

  static dynamic getStaticSortedDetails(String mid) async {
    var data = {"token": Apis.mytoken, "medicalOrg_id": mid};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getStaticTestCenterDetailsByMedicalCode",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    dynamic newdecodedResponse = decodedResponse["static"];
    return newdecodedResponse;
  }

  static dynamic checkvtest(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/checkValidityToAddScreeningReservation",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    String newdecodedResponse = decodedResponse["message"] as String;
    return newdecodedResponse;
  }

  //test center reservation  api

  static dynamic showrtest(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showTestCenterChosenDayReservationsTable",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["resTimeTable"] as List;
    if (newdecodedResponse == null) {
      return ["A"];
    } else
      return newdecodedResponse;
  }

  static dynamic addres(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/addScreeningReservation",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    String newdecodedResponse = decodedResponse["message"] as String;
    return newdecodedResponse;
  }

// MY reservation
  static dynamic cancelreservation(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/CancelScreeningReservation",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    String newdecodedResponse = decodedResponse["message"] as String;
    return newdecodedResponse;
  }

  static dynamic myreservation(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showAllMyScreeningReservations",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["myRes"] as List;
    return newdecodedResponse;
  }

  static updatereservation(data) async {
    var response = await http.put(BASE_URL + "/UpdateScreeningReservation",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  }





  // hospital reservation api

  static updatehreservation(data) async {
    var response = await http.put(BASE_URL + "/updateTreatmentReservation",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  }

  static dynamic showtreatmentdayavail(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showHospitalChosenDayReservationsTable",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["resTimeTable"] as List;
    if (newdecodedResponse == null) {
      return ["A"];
    } else
      return newdecodedResponse;
  }

  static dynamic cancelhreservation(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/cancelTreatmentReservation",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    String newdecodedResponse = decodedResponse["message"] as String;
    return newdecodedResponse;
  }

  static dynamic myreservationhosp(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showAllMyTreatmentReservations",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["myRes"] as List;
    return newdecodedResponse;
  }

  static dynamic addhospres(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/addTreatmentReservation",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    String newdecodedResponse = decodedResponse["message"] as String;
    return newdecodedResponse;
  }
    static dynamic checkvhosp(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/checkValidityToAddTreatmentReservation",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    String newdecodedResponse = decodedResponse["message"] as String;
    return newdecodedResponse;
  }







  //mopile testCenter Api

  static dynamic getMobileTestCenter() async {
    var response =
        await http.get("https://pinkboat.herokuapp.com/getAllMobileTestCentersWithNearestSchedule");
   var decodedResponse = json.decode(response.body) ;
    List newdecodedResponse =decodedResponse["mobileTestCenter"] as List;
    return newdecodedResponse;
  }

  static dynamic getMobileTestCenterSorted() async {
    var response =
        await http.get("https://pinkboat.herokuapp.com/getAllmobileTestCentersSortedByNameWithNearestSchedule");
   var decodedResponse = json.decode(response.body) ;
    List
     newdecodedResponse =decodedResponse["mobileWithSchedule"] as List;
    return newdecodedResponse;
  }

 static dynamic getscreenresult(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showMyScreeningResult",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    screenresult=decodedResponse["message"];
   List newdecodedResponse = decodedResponse["screeningResult"] as List;
    return newdecodedResponse;
  }
      static dynamic getsampleresult(data) async {
    var response = await http.post(
        "https://pinkboat.herokuapp.com/showMySampleResult",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
     sampleresult=decodedResponse["message"];
   List newdecodedResponse = decodedResponse["sampleResult"] as List  ;
    return newdecodedResponse;
  }


  // login

static login()async{
var data={
  "email":upemail
};
var response = await http.post(BASE_URL+ "/login/forgetPassword",
  body: json.encode(data),headers: {"Content-Type": "application/json"});
  
  return response.statusCode;
}




// verify account

  static verify(String code)async{
  var data={
    "email":upemail,
    "code":code,
  };
  var response = await http.put(BASE_URL+ "/emailVerification",
  body: json.encode(data),headers: {"Content-Type": "application/json"});
  var beResponse= json.decode(response.body);
  return beResponse;
  
}

static dynamic shownotification(data) async {
    var response = await http.post(BASE_URL + "/getMyNotifications",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedResponse = decodedResponse["sortedNotifications"] as List;
    return newdecodedResponse;
  }









// T3delat Menna


static dynamic getHospitals2() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getAllHospitalsAccordingToCitizenPhase",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["batch"] as List;
    return newdecodedresponse;
  }

  static dynamic getHospitalsSorted2() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getAllHospitalsSortedAccordingToCitizenPhase",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["batch"] as List;
    return newdecodedresponse;
  }

  static dynamic getStatic2() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getAllStaticTestCentersAccordingToCitizenPhase",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["batch"] as List;
    return newdecodedresponse;
  }

  static dynamic getStaticSorted2() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getAllStaticTestCentersSortedAccordingToCitizenPhase",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["batch"] as List;
    return newdecodedresponse;
  }

  static dynamic getMobile2() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getAllMobileTestCentersWithNearestScheduleAccordingToCitizenPhase",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["batch"] as List;
    return newdecodedresponse;
  }

  static dynamic getMobileSorted2() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    var response = await http.post(
        "https://pinkboat.herokuapp.com/getAllMobileTestCentersWithNearestScheduleSortedAccordingToCitizenPhase",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
    List newdecodedresponse = decodedResponse["batch"] as List;
    return newdecodedresponse;
  }


  //medicalhistory
static addallergyapi(data) async {
    var response = await http.post("https://pinkboat.herokuapp.com/addAllergy",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static adddiseaseapi(data) async {
    var response = await http.post(BASE_URL + "/addDisease",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static addsurgeryapi(data) async {
    var response = await http.post(BASE_URL + "/addSurgery",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static addimmunizationapi(data) async {
    var response = await http.post(BASE_URL + "/addImmunization",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static delallergyapi(data) async {
    var response = await http.post(BASE_URL + "/removeAllergy",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static deldiseaseapi(data) async {
    var response = await http.post("https://pinkboat.herokuapp.com/removeDisease",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static delsurgeryapi(data) async {
    var response = await http.post(BASE_URL + "/removeSurgery",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static delimmunizationapi(data) async {
    var response = await http.post(BASE_URL + "/removeImmunization",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var beResponse = json.decode(response.body);
    String newdecodedresponse = beResponse["message"] as String;
    return newdecodedresponse;
  
  
}
static dynamic showmedhistory(data) async {
    var response = await http.post(BASE_URL + "/showMedicalHistory",
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var decodedResponse = json.decode(response.body);
   
    var newdecodedResponse=decodedResponse["medicalHistory"];
    
    return newdecodedResponse;

  }






static dynamic myresttestdetails(data) async {
    var response = await 
      http.post(
        "https://pinkboat.herokuapp.com/getMobileTestCenterDetailsByMedicalCode",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
   var decodedResponse = json.decode(response.body) ;
    List
     newdecodedResponse =decodedResponse["mobileWithSchedule"] as List;
    return newdecodedResponse;
  }
   static dynamic myreststestdetails(data) async {
    var response = await 
      http.post(
        "https://pinkboat.herokuapp.com/getStaticTestCenterDetailsByMedicalCode",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
   var decodedResponse = json.decode(response.body) ;
    
    var newdecodedResponse =decodedResponse["static"] ;
//List newerdecodedResponse=newdecodedResponse;
print(newdecodedResponse["_id"]);

    return newdecodedResponse;
  }

  
}
