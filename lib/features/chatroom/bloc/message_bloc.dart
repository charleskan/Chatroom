import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pma001/features/chatroom/bloc/message_event.dart';
import 'package:pma001/features/chatroom/bloc/message_state.dart';
import 'package:pma001/features/chatroom/models/message.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc([MessageState messageState = const MessageState.initial()])
      : super(messageState) {
    on<LoadMessage>(_handleLoadMessage);
  }

  Future<void> _handleLoadMessage(
    LoadMessage event,
    Emitter<MessageState> emit,
  ) async {
    emit(MessageState(
      isLoading: true,
      messages: [],
    ));

    await Future.delayed(const Duration(seconds: 2));

    emit(MessageState(isLoading: false, messages: [
      Message(
        id: '1',
        content: 'Hello',
        createdAt: DateTime.now(),
        authorId: '1',
        updatedAt: DateTime.now(),
      ),
    ]));

  }
}
