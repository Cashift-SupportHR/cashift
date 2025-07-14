import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/evulation/evaluation_item.dart';

part 'evulation_params_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class EvulationParamsDto {
  @JsonKey(name: 'evaluations')
  final  List<EvaluationItem> evaluations;
  @JsonKey(name: 'comment')
  final  String comment;

  EvulationParamsDto({required this.evaluations, required this.comment});

  factory EvulationParamsDto.fromJson(Map<String, dynamic> json) => _$EvulationParamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EvulationParamsDtoToJson(this);
}

