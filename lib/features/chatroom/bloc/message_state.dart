import '../models/message.dart';

class MessageState {
  final List<Message> messages;
  // final Exception? error;
  final bool isLoading;

  MessageState({
    required this.messages,
    required this.isLoading,
  });

  const MessageState.initial()
      : messages = const [],
        isLoading = false;
}



// class MessageError extends Exception {
//   final String message;
//   final String? code;

//   MessageError(this.code, {this.message = 'Error'});

//   @override
//   String toString() => message;
// }
