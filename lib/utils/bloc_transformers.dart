import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

const _defaultThrottleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>([
  Duration duration = _defaultThrottleDuration,
]) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
