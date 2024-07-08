import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/create_advertisement/domain/usecases/creaet_advertisement_usecase.dart';
import 'package:landa/screens/create_advertisement/presentation/bloc/bloc.dart';
import 'package:landa/screens/create_advertisement/presentation/bloc/create_advertisement_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_advertisement_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CreateAdvertisementUsescase>(),
])
void main() {
  late final MockCreateAdvertisementUsescase mockCreateAdvertisementUsescase;
  const createAdvertisementParam = CreateAdvertisementParam(
    pType: 0,
    description: 'description',
    pExpireDateTime: 'pExpireDateTime',
    pCreateDateTime: 'pCreateDateTime',
    count: 10,
    originalPrice: 450000,
    discountedPrice: 3500000,
    discount: 10,
    categoryId: 3,
    subCategoryId: 3,
    subCategoryItemId: 3,
    provinceId: 2,
    cityId: 8,
    contactNumber: 'contactNumber',
    showContactInfo: true,
  );
  setUpAll(() {
    mockCreateAdvertisementUsescase = MockCreateAdvertisementUsescase();
  });

  group('TestCreateAdvertisementBloc', () {
    test(
      'initialState',
      () => expect(
        CreateAdvertisementBloc(
          createAdvertisementUsescase: mockCreateAdvertisementUsescase,
        ).state,
        const CreateAdvertisementInitialState(),
      ),
    );
    blocTest<CreateAdvertisementBloc, CreateAdvertisementState>(
      'CreateAdvertisementEvent success',
      build: () => CreateAdvertisementBloc(
        createAdvertisementUsescase: mockCreateAdvertisementUsescase,
      ),
      act: (bloc) => bloc.add(
        const CreateAdvertisementEvent(
          param: createAdvertisementParam,
        ),
      ),
      setUp: () {
        when(
          mockCreateAdvertisementUsescase.call(createAdvertisementParam),
        ).thenAnswer(
          (realInvocation) async => const Right(true),
        );
      },
      expect: () => const <CreateAdvertisementState>[
        CreateAdvertisementLoadingState(),
        CreateAdvertisementSuccessState(),
      ],
    );

    blocTest<CreateAdvertisementBloc, CreateAdvertisementState>(
      'CreateAdvertisementEvent fail',
      build: () => CreateAdvertisementBloc(
        createAdvertisementUsescase: mockCreateAdvertisementUsescase,
      ),
      act: (bloc) => bloc.add(
        const CreateAdvertisementEvent(
          param: createAdvertisementParam,
        ),
      ),
      setUp: () {
        when(
          mockCreateAdvertisementUsescase.call(createAdvertisementParam),
        ).thenAnswer(
          (realInvocation) async => const Right(false),
        );
      },
      expect: () => const <CreateAdvertisementState>[
        CreateAdvertisementLoadingState(),
        CreateAdvertisementErrorState(),
      ],
    );

    blocTest<CreateAdvertisementBloc, CreateAdvertisementState>(
      'CreateAdvertisementEvent exception',
      build: () => CreateAdvertisementBloc(
        createAdvertisementUsescase: mockCreateAdvertisementUsescase,
      ),
      act: (bloc) => bloc.add(
        const CreateAdvertisementEvent(
          param: createAdvertisementParam,
        ),
      ),
      setUp: () {
        when(
          mockCreateAdvertisementUsescase.call(createAdvertisementParam),
        ).thenAnswer(
          (realInvocation) async => const Left(ServerFailure('message')),
        );
      },
      expect: () => const <CreateAdvertisementState>[
        CreateAdvertisementLoadingState(),
        CreateAdvertisementErrorState(),
      ],
    );
  });
}
