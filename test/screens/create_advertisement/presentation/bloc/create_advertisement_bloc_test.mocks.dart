// Mocks generated by Mockito 5.4.4 from annotations
// in landa/test/screens/create_advertisement/presentation/bloc/create_advertisement_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:landa/core/error/failure.dart' as _i6;
import 'package:landa/screens/create_advertisement/domain/repositories/repositories.dart'
    as _i2;
import 'package:landa/screens/create_advertisement/domain/usecases/creaet_advertisement_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCreateAdvertisementRepository_0 extends _i1.SmartFake
    implements _i2.CreateAdvertisementRepository {
  _FakeCreateAdvertisementRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CreateAdvertisementUsescase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateAdvertisementUsescase extends _i1.Mock
    implements _i4.CreateAdvertisementUsescase {
  @override
  _i2.CreateAdvertisementRepository get createAdvertisementRepository =>
      (super.noSuchMethod(
        Invocation.getter(#createAdvertisementRepository),
        returnValue: _FakeCreateAdvertisementRepository_0(
          this,
          Invocation.getter(#createAdvertisementRepository),
        ),
        returnValueForMissingStub: _FakeCreateAdvertisementRepository_0(
          this,
          Invocation.getter(#createAdvertisementRepository),
        ),
      ) as _i2.CreateAdvertisementRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> call(
          _i4.CreateAdvertisementParam? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}