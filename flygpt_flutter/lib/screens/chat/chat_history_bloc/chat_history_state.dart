part of 'chat_history_bloc.dart';

@freezed
class ChatHistoryState with _$ChatHistoryState {
  const ChatHistoryState._();

  const factory ChatHistoryState({
    @Default({}) Map<String, List<History>> sectionedHistories,
    @Default([]) List<History> allHistories,
    History? selectedHistory,
    @Default(false) bool isLoading,
    @Default('') String textPrompt,
  }) = _ChatHistoryState;

  int get nextHistoryId {
    final his = allHistories.isNotEmpty
        ? allHistories.reduce((a, b) {
            final aId = a.id ?? -1; // Default to -1 if id is null
            final bId = b.id ?? -1; // Default to -1 if id is null
            return aId > bId ? a : b;
          })
        : null;

    return his == null ? 1 : his.id! + 1;
  }
}
