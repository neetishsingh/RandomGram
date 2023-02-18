import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chatbox_record.g.dart';

abstract class ChatboxRecord
    implements Built<ChatboxRecord, ChatboxRecordBuilder> {
  static Serializer<ChatboxRecord> get serializer => _$chatboxRecordSerializer;

  String? get chatboxname;

  DocumentReference? get chatperson1;

  DocumentReference? get chatperson2;

  bool? get active;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatboxRecordBuilder builder) => builder
    ..chatboxname = ''
    ..active = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatbox');

  static Stream<ChatboxRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatboxRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatboxRecord._();
  factory ChatboxRecord([void Function(ChatboxRecordBuilder) updates]) =
      _$ChatboxRecord;

  static ChatboxRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatboxRecordData({
  String? chatboxname,
  DocumentReference? chatperson1,
  DocumentReference? chatperson2,
  bool? active,
}) {
  final firestoreData = serializers.toFirestore(
    ChatboxRecord.serializer,
    ChatboxRecord(
      (c) => c
        ..chatboxname = chatboxname
        ..chatperson1 = chatperson1
        ..chatperson2 = chatperson2
        ..active = active,
    ),
  );

  return firestoreData;
}
