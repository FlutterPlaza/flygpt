import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flygpt_client/flygpt_client.dart';
import 'package:flygpt_flutter/server/client.dart';
import 'package:flygpt_flutter/shared/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'chat_history_event.dart';

part 'chat_history_state.dart';

part 'chat_history_bloc.freezed.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  final PodClient pod;

  StreamSubscription? _sessionSubscription;

  ChatHistoryBloc(this.pod) : super(const ChatHistoryState()) {
    on<ChatHistoryEvent>((event, emit) async {
      event.map(
        init: (e) async => await _init(),
        delete: (e) async => await _deleteHistory(e, emit),
        create: (e) async => await _createHistory(e, emit),
        update: (e) async => await _updateHistory(e, emit),
        fetchAllHistory: (e) async => await _fetchAllHistory(emit),
        sendTextPrompt: (e) => _sendTextPrompt(e, emit),
        fetchComplete: (e) => _fetchComplete(e, emit),
        streamHistory: (e) => _streamHistory(e, emit),
        setSelectedHistory: (e) => _setSelectedHistory(e, emit),
      );
    });
  }

  void _setSelectedHistory(_SetSelectedHistory event, Emitter emit) {
    emit(state.copyWith(selectedHistory: event.history));
  }

  Future<void> _updateHistory(_UpdateHistory event, Emitter emit) async {
    try {
      final existingHistory = state.allHistories
          .firstWhere((element) => element.id == event.historyId);
      existingHistory.chats[DateTime.now()] = event.text;
      emit(state.copyWith(
          allHistories: state.allHistories
              .map(
                (history) =>
                    history.id == event.historyId ? existingHistory : history,
              )
              .toList()));
      await pod.client.history.updateHistory(existingHistory);
      add(ChatHistoryEvent.fetchAllHistory());
    } on Exception catch (e) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  void _streamHistory(_StreamHistory event, Emitter emit) {
    final existingIndex = state.allHistories
        .indexWhere((history) => history.id == event.history.id);
    List<History> updatedHistories = List.from(state.allHistories);

    if (existingIndex != -1) {
      // Update existing history
      updatedHistories[existingIndex] = event.history;
    } else {
      // Add new history
      updatedHistories.add(event.history);
    }

    updatedHistories.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    emit(state.copyWith(
      allHistories: updatedHistories,
      sectionedHistories: groupBy(
        updatedHistories,
        (History element) => getRelativeDate(element.dateTime),
      ),
    ));
  }

  void _sendTextPrompt(_SendTextPrompt event, Emitter emit) {
    if (event.text.isEmpty) return;
    emit(state.copyWith(isLoading: true));
    if (event.historyId != null && state.nextHistoryId != event.historyId) {
      add(ChatHistoryEvent.update(event.text, event.historyId!));
    } else {
      add(
        ChatHistoryEvent.create(
          History(
            id: state.nextHistoryId,
            dateTime: DateTime.now(),
            desc: event.text,
            iconData: Random().nextInt(11).toString(),
            createdById: pod.sessionManager.signedInUser?.id ?? 0,
            chats: {
              DateTime.now(): event.text,
            },
          ),
        ),
      );
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _deleteHistory(_DeleteHistory event, Emitter emit) async {
    try {
      emit(state.copyWith(
          allHistories: state.allHistories
              .where((element) => element.id != event.history.id)
              .toList()));
      await pod.client.history.deleteHistory(event.history);
      add(ChatHistoryEvent.fetchAllHistory());
    } on Exception catch (e) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  Future<void> _createHistory(_CreateHistory event, Emitter emit) async {
    try {
      emit(state.copyWith(allHistories: state.allHistories + [event.history]));
      await pod.client.history.createHistory(event.history);
      add(ChatHistoryEvent.fetchAllHistory());
    } on Exception catch (e) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  Future<void> _fetchAllHistory(Emitter emit) async {
    try {
      final histories = await pod.client.history.getAllHistory();
      add(ChatHistoryEvent.fetchComplete(histories));
    } on Exception catch (e) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  void _fetchComplete(_FetchComplete event, Emitter emit) {
    final list = List<History>.from(event.allHistories)
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    emit(
      state.copyWith(
        allHistories: list,
        sectionedHistories: groupBy(
          list,
          (History element) => getRelativeDate(element.dateTime),
        ),
        isLoading: false,
      ),
    );
  }

  Future<void> _init() async {
    // if (_sessionSubscription != null) {
    //   await _sessionSubscription?.cancel();
    //   pod.client.history.client.close();
    // }
    // _sessionSubscription ??=
    //     pod.client.history.stream.listen((SerializableModel model) {
    //   if (model is History) {
    //     add(ChatHistoryEvent.streamHistory(model));
    //   } else {
    //     // Handle the case where the model is not of type List<History>
    //   }
    // });

    add(ChatHistoryEvent.fetchAllHistory());
  }

  dispose() {
    _sessionSubscription?.cancel();
  }
}
