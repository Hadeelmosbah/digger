import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/api/api_consumer.dart';
import '../../core/api/api_models/metal_model.dart';
import '../../core/api/end_points.dart';
import '../../core/api/errors/exceptions.dart';
import 'metals_state.dart';

class MetalsCubit extends Cubit<MetalState> {
  MetalsCubit(this.api) : super(MetalInitial());

  final ApiConsumer api;

  Future<void> fetchMetals() async {
    try {
      emit(MetalLoading());

      final response = await api.get(EndPoint.metals);

      if (response != null && response is List) {
        final metals = response
            .map<MetalModel>((e) => MetalModel.fromJson(e))
            .toList();

        emit(MetalSuccess(metals: metals));
      } else {
        emit(MetalFailure(errMessage: "Unexpected response format"));
      }
    } on ServerException catch (e) {
      emit(MetalFailure(errMessage: e.errModel.description ?? "Server error"));
    } catch (e) {
      emit(MetalFailure(errMessage: e.toString()));
    }
  }
}
