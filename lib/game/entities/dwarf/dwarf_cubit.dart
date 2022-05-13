import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class DwarfState extends Equatable {
  const DwarfState({
    required this.name,
    required this.selected,
  });

  const DwarfState.initial(String name)
      : this(
          name: name,
          selected: false,
        );

  final String name;
  final bool selected;

  DwarfState copyWith({
    bool? selected,
  }) {
    return DwarfState(
      name: name,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object> get props => [name, selected];
}

class DwarfCubit extends Cubit<DwarfState> {
  DwarfCubit(String name) : super(DwarfState.initial(name));

  void select() => emit(state.copyWith(selected: true));

  void unselect() => emit(state.copyWith(selected: false));
}
