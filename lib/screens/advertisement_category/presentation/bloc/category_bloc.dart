import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/usecases/usecases.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required this.getCategoriesUsescase,
    required this.suggestCategoryUsescase,
  }) : super(const CategoryState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<SuggestCategoryEvent>(_suggestCategory);
    on<GetSubCategoriesEvent>((event, emit) {});
  }

  final GetCategoriesUsescase getCategoriesUsescase;
  final SuggestCategoryUsescase suggestCategoryUsescase;

  Future<void> _suggestCategory(
    SuggestCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(suggestCategorystatus: StateStatus.loading));
    final result = await suggestCategoryUsescase.call(event.name);
    result.fold(
      (l) => emit(
        state.copyWith(
          suggestCategorystatus: StateStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(suggestCategorystatus: StateStatus.success),
      ),
    );
  }

  Future<void> _getCategories(
    GetCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await getCategoriesUsescase.call(NoParams());
    result.fold(
      (l) => emit(state.copyWith(status: StateStatus.error)),
      (r) => emit(
        state.copyWith(status: StateStatus.success, categoryData: r),
      ),
    );
  }
}
