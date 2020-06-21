
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter a valid Email Address';
  else
    return null;
}

String validateName(String value){
  if(value.length < 6)
    return 'Name too short, minimum length is 6';
  else
    return null;
}

String validatePassword(String value){
  if(value.length < 6)
    return 'Password is too short, minimum length is 6';
  else
    return
      null;
}