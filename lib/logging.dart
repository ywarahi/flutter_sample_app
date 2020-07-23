import 'package:stack_trace/stack_trace.dart' show Trace;

void log(String message) {
  const level = 1;
  final frames = Trace.current(level).frames;
  final frame = frames.isEmpty ? null : frames.first;
  print('$frame $message');
}
