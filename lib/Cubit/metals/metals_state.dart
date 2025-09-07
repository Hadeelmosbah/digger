import '../../core/api/api_models/metal_model.dart';

abstract class MetalState {}

class MetalInitial extends MetalState {}

class MetalLoading extends MetalState {}

class MetalSuccess extends MetalState {
  final List<MetalModel> metals;
  MetalSuccess({required this.metals});
}

class MetalFailure extends MetalState {
  final String errMessage;
  MetalFailure({required this.errMessage});
}