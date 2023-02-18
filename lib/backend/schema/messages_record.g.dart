// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesRecord> _$messagesRecordSerializer =
    new _$MessagesRecordSerializer();

class _$MessagesRecordSerializer
    implements StructuredSerializer<MessagesRecord> {
  @override
  final Iterable<Type> types = const [MessagesRecord, _$MessagesRecord];
  @override
  final String wireName = 'MessagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.timeofsent;
    if (value != null) {
      result
        ..add('timeofsent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isActive;
    if (value != null) {
      result
        ..add('isActive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sendTo;
    if (value != null) {
      result
        ..add('sendTo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sendFrom;
    if (value != null) {
      result
        ..add('sendFrom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.chatboxid;
    if (value != null) {
      result
        ..add('chatboxid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.width;
    if (value != null) {
      result
        ..add('width')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.uri;
    if (value != null) {
      result
        ..add('uri')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mimeType;
    if (value != null) {
      result
        ..add('mimeType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  MessagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'timeofsent':
          result.timeofsent = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isActive':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sendTo':
          result.sendTo = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sendFrom':
          result.sendFrom = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'chatboxid':
          result.chatboxid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mimeType':
          result.mimeType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$MessagesRecord extends MessagesRecord {
  @override
  final DateTime? timeofsent;
  @override
  final String? content;
  @override
  final bool? isActive;
  @override
  final DocumentReference<Object?>? sendTo;
  @override
  final DocumentReference<Object?>? sendFrom;
  @override
  final String? chatboxid;
  @override
  final String? status;
  @override
  final String? type;
  @override
  final int? height;
  @override
  final int? width;
  @override
  final String? uri;
  @override
  final String? mimeType;
  @override
  final String? size;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MessagesRecord([void Function(MessagesRecordBuilder)? updates]) =>
      (new MessagesRecordBuilder()..update(updates))._build();

  _$MessagesRecord._(
      {this.timeofsent,
      this.content,
      this.isActive,
      this.sendTo,
      this.sendFrom,
      this.chatboxid,
      this.status,
      this.type,
      this.height,
      this.width,
      this.uri,
      this.mimeType,
      this.size,
      this.ffRef})
      : super._();

  @override
  MessagesRecord rebuild(void Function(MessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesRecordBuilder toBuilder() =>
      new MessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesRecord &&
        timeofsent == other.timeofsent &&
        content == other.content &&
        isActive == other.isActive &&
        sendTo == other.sendTo &&
        sendFrom == other.sendFrom &&
        chatboxid == other.chatboxid &&
        status == other.status &&
        type == other.type &&
        height == other.height &&
        width == other.width &&
        uri == other.uri &&
        mimeType == other.mimeType &&
        size == other.size &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            timeofsent
                                                                .hashCode),
                                                        content.hashCode),
                                                    isActive.hashCode),
                                                sendTo.hashCode),
                                            sendFrom.hashCode),
                                        chatboxid.hashCode),
                                    status.hashCode),
                                type.hashCode),
                            height.hashCode),
                        width.hashCode),
                    uri.hashCode),
                mimeType.hashCode),
            size.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagesRecord')
          ..add('timeofsent', timeofsent)
          ..add('content', content)
          ..add('isActive', isActive)
          ..add('sendTo', sendTo)
          ..add('sendFrom', sendFrom)
          ..add('chatboxid', chatboxid)
          ..add('status', status)
          ..add('type', type)
          ..add('height', height)
          ..add('width', width)
          ..add('uri', uri)
          ..add('mimeType', mimeType)
          ..add('size', size)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MessagesRecordBuilder
    implements Builder<MessagesRecord, MessagesRecordBuilder> {
  _$MessagesRecord? _$v;

  DateTime? _timeofsent;
  DateTime? get timeofsent => _$this._timeofsent;
  set timeofsent(DateTime? timeofsent) => _$this._timeofsent = timeofsent;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DocumentReference<Object?>? _sendTo;
  DocumentReference<Object?>? get sendTo => _$this._sendTo;
  set sendTo(DocumentReference<Object?>? sendTo) => _$this._sendTo = sendTo;

  DocumentReference<Object?>? _sendFrom;
  DocumentReference<Object?>? get sendFrom => _$this._sendFrom;
  set sendFrom(DocumentReference<Object?>? sendFrom) =>
      _$this._sendFrom = sendFrom;

  String? _chatboxid;
  String? get chatboxid => _$this._chatboxid;
  set chatboxid(String? chatboxid) => _$this._chatboxid = chatboxid;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  int? _width;
  int? get width => _$this._width;
  set width(int? width) => _$this._width = width;

  String? _uri;
  String? get uri => _$this._uri;
  set uri(String? uri) => _$this._uri = uri;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  String? _size;
  String? get size => _$this._size;
  set size(String? size) => _$this._size = size;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MessagesRecordBuilder() {
    MessagesRecord._initializeBuilder(this);
  }

  MessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timeofsent = $v.timeofsent;
      _content = $v.content;
      _isActive = $v.isActive;
      _sendTo = $v.sendTo;
      _sendFrom = $v.sendFrom;
      _chatboxid = $v.chatboxid;
      _status = $v.status;
      _type = $v.type;
      _height = $v.height;
      _width = $v.width;
      _uri = $v.uri;
      _mimeType = $v.mimeType;
      _size = $v.size;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesRecord;
  }

  @override
  void update(void Function(MessagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessagesRecord build() => _build();

  _$MessagesRecord _build() {
    final _$result = _$v ??
        new _$MessagesRecord._(
            timeofsent: timeofsent,
            content: content,
            isActive: isActive,
            sendTo: sendTo,
            sendFrom: sendFrom,
            chatboxid: chatboxid,
            status: status,
            type: type,
            height: height,
            width: width,
            uri: uri,
            mimeType: mimeType,
            size: size,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
