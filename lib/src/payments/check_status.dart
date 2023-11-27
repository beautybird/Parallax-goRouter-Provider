import 'package:postgres/postgres.dart';

class CheckStatus {
  /*1- We check the free trial period*/
  /*2- We check if user has plan or no*/
  /*3- If expired &/Or has no plan then we remove from search result
  * Or not show company details*/
  Connection? connection;

  CheckStatus() {
    /*..Create Postgres Connection....*/

  }

  /* Tasks are :
  * 1- When company purchase plan , we do :-
  *   1A- We extend the plan time in signup table
  *   2A- We keep the company listing shows in products pages
  * 2- If company not purchase any plan :-
  *   2A- We remove the company from listing and stop showing
  *   the company products */

  /* We need know the company's email to make the change*/
  DateTime? registrationDate;
  DateTime? freeTrialExpiryDate;
  Result? changeSignupPlanResult;
  bool? planChanged;

  Future<bool?>? changeCurrentPlan() async {

    return planChanged;
  }
}
