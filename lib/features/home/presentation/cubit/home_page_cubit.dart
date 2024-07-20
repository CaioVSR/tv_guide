import 'package:bloc/bloc.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._logOutUseCase) : super(HomePageState.initial());

  final LogOutUseCase _logOutUseCase;

  Future<void> logOut() async {
    try {
      emit(state.copyWith(logOutStatus: HomePageStatus.loadInProgress));
      await _logOutUseCase.call();
      emit(state.copyWith(logOutStatus: HomePageStatus.loadSuccess));
    } catch (e) {
      emit(state.copyWith(logOutStatus: HomePageStatus.loadFailure));
    }
  }
}
