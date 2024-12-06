part of 'chat_history_bloc.dart';

@freezed
sealed class ChatHistoryEvent with _$ChatHistoryEvent {
  const ChatHistoryEvent._();

  const factory ChatHistoryEvent.init() = _Init;

  const factory ChatHistoryEvent.delete(History history) = _DeleteHistory;

  const factory ChatHistoryEvent.create(History history) = _CreateHistory;

  const factory ChatHistoryEvent.setSelectedHistory(History? history) =
      _SetSelectedHistory;

  const factory ChatHistoryEvent.update(String text, int historyId) =
      _UpdateHistory;

  const factory ChatHistoryEvent.streamHistory(History history) =
      _StreamHistory;

  const factory ChatHistoryEvent.fetchAllHistory() = _FetchAllHistory;

  const factory ChatHistoryEvent.fetchComplete(List<History> allHistories) =
      _FetchComplete;

  const factory ChatHistoryEvent.sendTextPrompt(String text, {int? historyId}) =
      _SendTextPrompt;
}
