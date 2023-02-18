import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'messages_record.g.dart';

abstract class MessagesRecord
    implements Built<MessagesRecord, MessagesRecordBuilder> {
  static Serializer<MessagesRecord> get serializer =>
      _$messagesRecordSerializer;

  DateTime? get timeofsent;

  String? get content;

  bool? get isActive;

  DocumentReference? get sendTo;

  DocumentReference? get sendFrom;

  String? get chatboxid;

  String? get status;

  String? get type;

  int? get height;

  int? get width;

  String? get uri;

  String? get mimeType;

  String? get size;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MessagesRecordBuilder builder) => builder
    ..content = ''
    ..isActive = false
    ..chatboxid = ''
    ..status = ''
    ..type = ''
    ..height = 0
    ..width = 0
    ..uri = ''
    ..mimeType = ''
    ..size = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MessagesRecord._();
  factory MessagesRecord([void Function(MessagesRecordBuilder) updates]) =
      _$MessagesRecord;

  static MessagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMessagesRecordData({
  DateTime? timeofsent,
  String? content,
  bool? isActive,
  DocumentReference? sendTo,
  DocumentReference? sendFrom,
  String? chatboxid,
  String? status,
  String? type,
  int? height,
  int? width,
  String? uri,
  String? mimeType,
  String? size,
}) {
  final firestoreData = serializers.toFirestore(
    MessagesRecord.serializer,
    MessagesRecord(
      (m) => m
        ..timeofsent = timeofsent
        ..content = content
        ..isActive = isActive
        ..sendTo = sendTo
        ..sendFrom = sendFrom
        ..chatboxid = chatboxid
        ..status = status
        ..type = type
        ..height = height
        ..width = width
        ..uri = uri
        ..mimeType = mimeType
        ..size = size,
    ),
  );

  return firestoreData;
}
