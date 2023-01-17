final List<Message>messages = [
  Message(
    content: 'Hello',
    id: '1',
    type: 'text',
    authorId: '1',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Message(
    content: 'Hi',
    id: '2',
    type: 'text',
    authorId: '2',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Message(
    content: 'How are you?',
    id: '3',
    type: 'text',
    authorId: '1',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Message(
    content: 'I am fine, thank you',
    id: '4',
    type: 'text',
    authorId: '2',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Message(
    content: 'Today xxxxxxxxxxxx',
    id: '5',
    type: 'text',
    authorId: '1',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

];

class Message {
  final String content;
  final String id;
  final String? type;
  final String authorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Message({
    required this.content,
    required this.id,
    this.type,
    required this.authorId,
    this.createdAt,
    this.updatedAt,
  });
}
