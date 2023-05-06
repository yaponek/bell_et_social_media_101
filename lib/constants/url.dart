/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

class AppUrl {

  static const String liveBaseURL = "https://remote-ur/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";

  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "/session";
  static const String register = baseURL + "/registration";
  static const String forgotPassword = baseURL + "/forgot-password";

}