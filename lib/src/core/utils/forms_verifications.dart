class FormsVerifications {
  static String? verifyName(String? name) {
    if (name != null) {
      if (name.isEmpty) {
        return "Ingresa un nombre";
      } else if (name.length > 50) {
        return "El nombre es demasiado extenso";
      }
      return null;
    } else {
      return "Error";
    }
  }

  static String? verifyLastName(String? lastname) {
    if (lastname != null) {
      if (lastname.isEmpty) {
        return "Ingresa un apellido";
      } else if (lastname.length > 50) {
        return "El apellido es demasiado extenso";
      }
      return null;
    } else {
      return "Error";
    }
  }

  static String? verifyMainAddress(String? address) {
    if (address != null) {
      if (address.isEmpty) {
        return "Ingresa una Dirección";
      } else if (address.length > 50) {
        return "La dirección es demasiado extensa";
      }
      return null;
    } else {
      return "Error";
    }
  }

  static String? validateEmail(String? email) {
    if (email != null) {
      if (!email.contains(RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
        return "Ingrese un email valido";
      } else {
        return null;
      }
    } else {
      return "Error";
    }
  }
}
