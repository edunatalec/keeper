import 'package:validart/src/enums/case_sensitivity.dart';
import 'package:validart/src/validators/validator.dart';

/// A validator that checks whether a given string is exactly equal to a specified value.
///
/// The `EqualsValidator` ensures that the input string matches the expected value,
/// with an optional case sensitivity setting.
///
/// ### Example
/// ```dart
/// final validator = EqualsValidator(
///   'password123',
///   message: 'Value must be exactly "password123"',
/// );
///
/// print(validator.validate('password123')); // null (valid)
/// print(validator.validate('Password123')); // 'Value must be exactly "password123"' (invalid)
///
/// final caseInsensitiveValidator = EqualsValidator(
///   'password123',
///   message: 'Value must be exactly "password123"',
///   caseSensitivity: CaseSensitivity.insensitive,
/// );
///
/// print(caseInsensitiveValidator.validate('PASSWORD123')); // null (valid)
/// ```
///
/// ### Parameters
/// - [expectedValue]: The exact string value that the input should match.
/// - [message]: The error message returned if validation fails.
/// - [caseSensitivity]: Determines whether validation should be case-sensitive.
///   Defaults to `CaseSensitivity.sensitive`.
class EqualsValidator extends ValidatorWithMessage<String> {
  /// The exact string value that the input should match.
  final String expectedValue;

  /// Determines whether the validation should be case-sensitive or not.
  ///
  /// Defaults to `CaseSensitivity.sensitive`.
  final CaseSensitivity caseSensitivity;

  /// Creates an `EqualsValidator` with the given [expectedValue], [message], and [caseSensitivity].
  EqualsValidator(
    this.expectedValue, {
    required super.message,
    this.caseSensitivity = CaseSensitivity.sensitive,
  });

  @override
  String? validate(covariant String value) {
    final bool isEqual = caseSensitivity == CaseSensitivity.insensitive
        ? value.toLowerCase() == expectedValue.toLowerCase()
        : value == expectedValue;

    return isEqual ? null : message;
  }
}
