import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor implements Interceptor {
  final logger = getLogger('LOGGER');

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) =>
      throw err;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    try {
      final headers = options.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
      logger.i('REQUEST -> ${options.method} ${options.uri}\n$headers');
      logger.i(options.data ?? '');
      logger.i('REQUEST END');
    } catch (e) {
      logger.e(e);
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final base = response.requestOptions;
    final headers = base.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    final level = (response.statusCode ?? 0) >= 400 ? Level.error : Level.info;
    logger.log(level, 'RESPONSE <- ${response.statusCode} ${base.method} ${base.uri}\n$headers');
    logger.log(level, response.data ?? '');
    logger.log(level, 'RESPONSE END');
    handler.next(response);
  }
}

Logger getLogger(
  String className, {
  bool printCallingFunctionName = true,
  bool printCallstack = false,
  List<String> excludeLogsFromClasses = const [],
  String? showOnlyClass,
}) {
  return Logger(
    filter: _LogAllTheTimeFilter(),
    printer: _SimpleLogPrinter(
      className,
      printCallingFunctionName: printCallingFunctionName,
      printCallStack: printCallstack,
      showOnlyClass: showOnlyClass,
      exludeLogsFromClasses: excludeLogsFromClasses,
    ),
    output: _MultipleLoggerOutput(
      [
        ConsoleOutput(),
      ],
    ),
  );
}

class _SimpleLogPrinter extends LogPrinter {
  final stackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  final String className;
  final bool printCallingFunctionName;
  final bool printCallStack;
  final List<String> exludeLogsFromClasses;
  final String? showOnlyClass;

  _SimpleLogPrinter(
    this.className, {
    this.printCallingFunctionName = true,
    this.printCallStack = false,
    this.exludeLogsFromClasses = const [],
    this.showOnlyClass,
  });

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final methodName = _getMethodName();
    final methodNameSection = printCallingFunctionName && methodName != null ? ' | $methodName ' : '';
    final stackLog = event.stackTrace.toString();
    final output = '$className$methodNameSection - ${event.message}${printCallStack ? '\nSTACKTRACE:\n$stackLog' : ''}';
    if (exludeLogsFromClasses.any((excludeClass) => className == excludeClass) ||
        (showOnlyClass != null && className != showOnlyClass)) {
      return [];
    }
    final pattern = RegExp('.{1,800}');
    final result = <String>[];
    for (final line in output.split('\n')) {
      result.addAll(pattern.allMatches(line).map((match) => kReleaseMode ? match.group(0)! : color!(match.group(0)!)));
    }
    return result;
  }

  String? _getMethodName() {
    try {
      final currentStack = StackTrace.current;
      final formattedStacktrace = _formatStackTrace(currentStack, 3);
      final realFirstLine = formattedStacktrace?.firstWhere((line) => line.contains(className));
      final methodName = realFirstLine?.replaceAll('$className.', '') ?? '';
      return methodName;
    } catch (e) {
      return null;
    }
  }

  List<String>? _formatStackTrace(
    StackTrace stackTrace,
    int methodCount,
  ) {
    final lines = stackTrace.toString().split('\n');
    final formatted = <String>[];
    var count = 0;
    for (final line in lines) {
      final match = stackTraceRegex.matchAsPrefix(line);
      if (match != null) {
        if (match.group(2)!.startsWith('package:logger')) {
          continue;
        }
        final newLine = ("${match.group(1)}");
        formatted.add(newLine.replaceAll('<anonymous closure>', '()'));
        if (++count == methodCount) {
          break;
        }
      } else {
        formatted.add(line);
      }
    }
    return formatted.isEmpty ? null : formatted;
  }
}

class _MultipleLoggerOutput extends LogOutput {
  final List<LogOutput> logOutputs;

  _MultipleLoggerOutput(this.logOutputs);

  @override
  void output(OutputEvent event) {
    for (final logOutput in logOutputs) {
      try {
        logOutput.output(event);
      } catch (e) {
        print('Log output failed');
      }
    }
  }
}

class _LogAllTheTimeFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}
