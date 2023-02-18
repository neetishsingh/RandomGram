// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbox_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatboxRecord> _$chatboxRecordSerializer =
    new _$ChatboxRecordSerializer();

class _$ChatboxRecordSerializer implements StructuredSerializer<ChatboxRecord> {
  @override
  final Iterable<Type> types = const [ChatboxRecord, _$ChatboxRecord];
  @override
  final String wireName = 'ChatboxRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatboxRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.chatboxname;
    if (value != null) {
      result
        ..add('chatboxname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chatperson1;
    if (value != null) {
      result
        ..add('chatperson1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.chatperson2;
    if (value != null) {
      result
        ..add('chatperson2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ChatboxRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatboxRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chatboxname':
          result.chatboxname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chatperson1':
          result.chatperson1 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'chatperson2':
          result.chatperson2 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatboxRecord extends ChatboxRecord {
  @override
  final String? chatboxname;
  @override
  final DocumentReference<Object?>? chatperson1;
  @override
  final DocumentReference<Object?>? chatperson2;
  @override
  final bool? active;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatboxRecord([void Function(ChatboxRecordBuilder)? updates]) =>
      (new ChatboxRecordBuilder()..update(updates))._build();

  _$ChatboxRecord._(
      {this.chatboxname,
      this.chatperson1,
      this.chatperson2,
      this.active,
      this.ffRef})
      : super._();

  @override
  ChatboxRecord rebuild(void Function(ChatboxRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatboxRecordBuilder toBuilder() => new ChatboxRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatboxRecord &&
        chatboxname == other.chatboxname &&
        chatperson1 == other.chatperson1 &&
        chatperson2 == other.chatperson2 &&
        active == other.active &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, chatboxname.hashCode), chatperson1.hashCode),
                chatperson2.hashCode),
            active.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatboxRecord')
          ..add('chatboxname', chatboxname)
          ..add('chatperson1', chatperson1)
          ..add('chatperson2', chatperson2)
          ..add('active', active)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatboxRecordBuilder
    implements Builder<ChatboxRecord, ChatboxRecordBuilder> {
  _$ChatboxRecord? _$v;

  String? _chatboxname;
  String? get chatboxname => _$this._chatboxname;
  set chatboxname(String? chatboxname) => _$this._chatboxname = chatboxname;

  DocumentReference<Object?>? _chatperson1;
  DocumentReference<Object?>? get chatperson1 => _$this._chatperson1;
  set chatperson1(DocumentReference<Object?>? chatperson1) =>
      _$this._chatperson1 = chatperson1;

  DocumentReference<Object?>? _chatperson2;
  DocumentReference<Object?>? get chatperson2 => _$this._chatperson2;
  set chatperson2(DocumentReference<Object?>? chatperson2) =>
      _$this._chatperson2 = chatperson2;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatboxRecordBuilder() {
    ChatboxRecord._initializeBuilder(this);
  }

  ChatboxRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chatboxname = $v.chatboxname;
      _chatperson1 = $v.chatperson1;
      _chatperson2 = $v.chatperson2;
      _active = $v.active;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatboxRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatboxRecord;
  }

  @override
  void update(void Function(ChatboxRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatboxRecord build() => _build();

  _$ChatboxRecord _build() {
    final _$result = _$v ??
        new _$ChatboxRecord._(
            chatboxname: chatboxname,
            chatperson1: chatperson1,
            chatperson2: chatperson2,
            active: active,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
