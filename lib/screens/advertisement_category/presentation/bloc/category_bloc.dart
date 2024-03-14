import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/usecases/usecases.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required this.getCategoriesUsescase,
    required this.getSubCategoriesUsescase,
    required this.suggestCategoryUsescase,
    required this.suggestSubCategoryUsescase,
  }) : super(CategoryInitial()) {
    on<GetCategoriesEvent>((event, emit) {});
    on<SuggestCategoryEvent>((event, emit) {});
    on<GetSubCategoriesEvent>((event, emit) {});
    on<SuggestSubCategoryEvent>((event, emit) {});
  }

  final GetCategoriesUsescase getCategoriesUsescase;
  final GetSubCategoriesUsescase getSubCategoriesUsescase;
  final SuggestCategoryUsescase suggestCategoryUsescase;
  final SuggestSubCategoryUsescase suggestSubCategoryUsescase;
}
