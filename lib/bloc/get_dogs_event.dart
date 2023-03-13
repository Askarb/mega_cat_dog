part of 'get_dogs_bloc.dart';

@immutable
abstract class GetDogsEvent {}

class GetDataEvent extends GetDogsEvent {
  final int count;
  final bool isDog;
  GetDataEvent({required this.count, required this.isDog});
}
