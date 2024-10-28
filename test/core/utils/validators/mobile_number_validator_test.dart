import 'package:landa/core/utils/utils.dart';
import 'package:test/test.dart';

class MobileNumberValidatorTest with MobileNumberValidator {}

void main() {
  group('MobileNumberValidator', () {
    group('Iranian', () {
      late MobileNumberValidatorTest mobileNumberValidatorTest;

      setUp(() {
        mobileNumberValidatorTest = MobileNumberValidatorTest();
      });
      test('valid Irancell mobile number must result true', () {
        //Arrange
        const irancellNumber = '09377729207';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(irancellNumber);
        //Assert
        expect(result, isTrue);
      });

      test('valid Irancell mobile number with country code must result true',
          () {
        //Arrange
        const irancellNumber = '+989377729207';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(irancellNumber);
        //Assert
        expect(result, isTrue);
      });

      test('valid HamrahAvval mobile number must result true', () {
        //Arrange
        const hamrahAvvalNumber = '09126661266';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(hamrahAvvalNumber);
        //Assert
        expect(result, isTrue);
      });

      test('valid HamrahAvval mobile number with country code must result true',
          () {
        //Arrange
        const hamrahAvvalNumber = '+989126661266';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(hamrahAvvalNumber);
        //Assert
        expect(result, isTrue);
      });

      test('valid Rightel mobile number must result true', () {
        //Arrange
        const rightelNumber = '09219992199';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(rightelNumber);
        //Assert
        expect(result, isTrue);
      });

      test('valid Rightel mobile number with country code must result true',
          () {
        //Arrange
        const rightelNumber = '+989219992199';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(rightelNumber);
        //Assert
        expect(result, isTrue);
      });

      test('invalid mobile number (all zero) must result false', () {
        //Arrange
        const mobileNumber = '00000000000';
        //Act
        final result =
            mobileNumberValidatorTest.validateMobileNumber(mobileNumber);
        //Assert
        expect(result, isFalse);
      });
    });

  });
}
