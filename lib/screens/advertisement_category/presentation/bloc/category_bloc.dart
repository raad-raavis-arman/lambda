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
    required this.suggestSubCategoryUsescase,
  }) : super(const CategoryState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<SuggestCategoryEvent>((event, emit) {});
    on<GetSubCategoriesEvent>((event, emit) {});
    on<SuggestSubCategoryEvent>((event, emit) {});
  }

  final GetCategoriesUsescase getCategoriesUsescase;
  final SuggestCategoryUsescase suggestCategoryUsescase;
  final SuggestSubCategoryUsescase suggestSubCategoryUsescase;

  Future<void> _getCategories(
    GetCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final categories = await getCategoriesUsescase.call(NoParams());
    categories.fold(
      (l) => emit(state.copyWith(status: StateStatus.error)),
      (r) => emit(
        state.copyWith(status: StateStatus.success, categories: r),
      ),
    );
  }
}
