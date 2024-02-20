import 'package:form_field_validator/form_field_validator.dart';

final phoneNumberValidator = MinLengthValidator(10,
    errorText: 'Phone Number must be at least 10 digits long');
