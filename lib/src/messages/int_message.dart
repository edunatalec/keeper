import 'package:keeper/src/messages/num_message.dart';

class IntMessage extends NumMessage<int> {
  final String odd;
  final String even;

  IntMessage({
    required super.required,
    required super.refine,
    required super.min,
    required super.max,
    required super.multipleOf,
    required super.between,
    required super.positive,
    required super.negative,
    required this.odd,
    required this.even,
  });

  @override
  IntMessage copyWith({
    String? required,
    String? refine,
    String Function(int min)? min,
    String Function(int max)? max,
    String Function(int multipleOf)? multipleOf,
    String Function(int min, int max)? between,
    String? positive,
    String? negative,
    String? odd,
    String? even,
  }) {
    return IntMessage(
      required: required ?? this.required,
      refine: refine ?? this.refine,
      min: min ?? this.min,
      max: max ?? this.max,
      multipleOf: multipleOf ?? this.multipleOf,
      between: between ?? this.between,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      odd: odd ?? this.odd,
      even: even ?? this.even,
    );
  }
}
