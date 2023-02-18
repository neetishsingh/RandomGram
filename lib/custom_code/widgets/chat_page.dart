// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          messages: _messages,
          onAttachmentPressed: _handleAttachmentPressed,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response =
        '[ { "author": { "firstName": "John", "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca", "lastName": "Doe" }, "createdAt": 1655648404000, "id": "c67ed376-52bf-4d4e-ba2a-7a0f8467b22a", "status": "seen", "text": "Ooowww ☺️", "type": "text" }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655648403000, "height": 1280, "id": "02797655-4d73-402e-a319-50fde79e2bc4", "name": "madrid", "size": 585000, "status": "seen", "type": "image", "uri": "https://source.unsplash.com/WBGjg0DsO_g/1920x1280", "width": 1920 }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655648402000, "id": "4e048753-2d60-4144-bc28-9967050aaf12", "status": "seen", "text": "What a ~nice~ _wonderful_ sunset! 😻", "type": "text" }, { "author": { "firstName": "Matthew", "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac", "lastName": "White" }, "createdAt": 1655648401000, "id": "64747b28-df19-4a0c-8c47-316dc3546e3c", "status": "seen", "text": "Here you go buddy! 💪", "type": "text" }, { "author": { "firstName": "Matthew", "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac", "lastName": "White" }, "createdAt": 1655648400000, "id": "6a1a4351-cf05-4d0c-9d0f-47ed378b6112", "mimeType": "application/pdf", "name": "city_guide-madrid.pdf", "size": 10550000, "status": "seen", "type": "file", "uri": "https://www.esmadrid.com/sites/default/files/documentos/madrid_imprescindible_2016_ing_web_0.pdf" }, { "author": { "firstName": "John", "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca", "lastName": "Doe" }, "createdAt": 1655624464000, "id": "38681a33-2563-42aa-957b-cfc12f791d16", "status": "seen", "text": "Matt, where is my Madrid guide?", "type": "text" }, { "author": { "firstName": "Matthew", "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac", "lastName": "White" }, "createdAt": 1655624463000, "id": "113bb2e8-f74e-42cd-aa30-4085a0f52c58", "status": "seen", "text": "Awesome! 😍", "type": "text" }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655624462000, "id": "22212d42-1252-4641-9786-d6f83b2ce4a8", "status": "seen", "text": "Matt, what do you think?", "type": "text" }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655624461000, "id": "afc2269a-374b-4382-8864-b3b60d1e8cd7", "status": "seen", "text": "Yeah! Together with Demna, Mark Hamill and others 🥰", "type": "text" }, { "author": { "firstName": "John", "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca", "lastName": "Doe" }, "createdAt": 1655624460000, "id": "634b2f0b-2486-4bfe-b36d-1c7d6313c7b3", "status": "seen", "text": "Guys! Did you know Imagine Dragons became ambassadors for u24.gov.ua ?", "type": "text" } ]'; //await rootBundle.loadString('assets/ab.json');

    // '[ { "author": { "firstName": "John", "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca", "lastName": "Doe" }, "createdAt": 1655648404000, "id": "c67ed376-52bf-4d4e-ba2a-7a0f8467b22a", "status": "seen", "text": "Ooowww ☺️", "type": "text" }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655648403000, "height": 1280, "id": "02797655-4d73-402e-a319-50fde79e2bc4", "name": "madrid", "size": 585000, "status": "seen", "type": "image", "uri": "https://source.unsplash.com/WBGjg0DsO_g/1920x1280", "width": 1920 }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655648402000, "id": "4e048753-2d60-4144-bc28-9967050aaf12", "status": "seen", "text": "What a ~nice~ _wonderful_ sunset! 😻", "type": "text" }, { "author": { "firstName": "Matthew", "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac", "lastName": "White" }, "createdAt": 1655648401000, "id": "64747b28-df19-4a0c-8c47-316dc3546e3c", "status": "seen", "text": "Here you go buddy! 💪", "type": "text" }, { "author": { "firstName": "Matthew", "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac", "lastName": "White" }, "createdAt": 1655648400000, "id": "6a1a4351-cf05-4d0c-9d0f-47ed378b6112", "mimeType": "application/pdf", "name": "city_guide-madrid.pdf", "size": 10550000, "status": "seen", "type": "file", "uri": "https://www.esmadrid.com/sites/default/files/documentos/madrid_imprescindible_2016_ing_web_0.pdf" }, { "author": { "firstName": "John", "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca", "lastName": "Doe" }, "createdAt": 1655624464000, "id": "38681a33-2563-42aa-957b-cfc12f791d16", "status": "seen", "text": "Matt, where is my Madrid guide?", "type": "text" }, { "author": { "firstName": "Matthew", "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac", "lastName": "White" }, "createdAt": 1655624463000, "id": "113bb2e8-f74e-42cd-aa30-4085a0f52c58", "status": "seen", "text": "Awesome! 😍", "type": "text" }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655624462000, "id": "22212d42-1252-4641-9786-d6f83b2ce4a8", "status": "seen", "text": "Matt, what do you think?", "type": "text" }, { "author": { "firstName": "Janice", "id": "e52552f4-835d-4dbe-ba77-b076e659774d", "imageUrl": "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d", "lastName": "King" }, "createdAt": 1655624461000, "id": "afc2269a-374b-4382-8864-b3b60d1e8cd7", "status": "seen", "text": "Yeah! Together with Demna, Mark Hamill and others 🥰", "type": "text" }, { "author": { "firstName": "John", "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca", "lastName": "Doe" }, "createdAt": 1655624460000, "id": "634b2f0b-2486-4bfe-b36d-1c7d6313c7b3", "status": "seen", "text": "Guys! Did you know Imagine Dragons became ambassadors for u24.gov.ua ?", "type": "text" } ]'; //await rootBundle.loadString('assets/ab.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(
            jsonDecode(jsonEncode(MessageBox.fromJson(e)))
                as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }
}

class MessageBox {
  Author _author = new Author();
  int _createdAt = 0;
  String _id = '';
  int _height = 0, _width = 0, _size = 0;
  String _status = '';
  String _text = '';
  String _type = '', _uri = '', _name = '';

  MessageBox(
      {Author? author,
      int? createdAt,
      String? id,
      String? status,
      String? text,
      String? type}) {
    this._author = author!;
    this._createdAt = createdAt!;
    this._id = id!;
    this._status = status!;
    this._text = text!;
    this._type = type!;
    this._width = _width;
    this._height = _height;
    this._size = _size;
    this._uri = _uri;
    this._name = _name;
  }

  Author get author => _author;
  set author(Author author) => _author = author;
  int get createdAt => _createdAt;
  set createdAt(int createdAt) => _createdAt = createdAt;
  String get id => _id;
  set id(String id) => _id = id;
  String get status => _status;
  set status(String status) => _status = status;
  String get text => _text;
  set text(String text) => _text = text;
  String get type => _type;
  set type(String type) => _type = type;

  MessageBox.fromJson(Map<String, dynamic> json) {
    _author = (json['author'] != null
        ? new Author.fromJson(json['author'])
        : new Author());
    _createdAt = (json['createdAt'] != null ? json['createdAt'] : 0);
    _id = (json['id'] != null ? json['id'] : '');
    _status = (json['status'] != null ? json['status'] : '');
    _text = (json['text'] != null ? json['text'] : '');

    _type = (json['type'] != null ? json['type'] : '');

    _uri = (json['uri'] != null ? json['uri'] : '');

    _name = (json['name'] != null ? json['name'] : '');

    _size = (json['size'] != null ? json['size'] : 0);

    _width = (json['width'] != null ? json['width'] : 0);

    _height = (json['height'] != null ? json['height'] : 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._author != null) {
      data['author'] = this._author.toJson();
    }
    data['createdAt'] = this._createdAt;
    data['id'] = this._id;
    data['status'] = this._status;
    data['text'] = this._text;
    data['type'] = this._type;
    data['uri'] = this._uri;

    data['name'] = this._name;
    data['size'] = this._size;
    data['width'] = this._width;
    data['height'] = this._height;
    return data;
  }
}

class Author {
  String _firstName = 'Anonymus';
  String _id = '';
  String _lastName = '';
  String _imageUrl = '';

  Author(
      {String? firstName = 'Anonymus',
      String? id = '',
      String? lastName = '',
      String? imageUrl = ''}) {
    this._firstName = firstName!;
    this._id = id!;
    this._lastName = lastName!;
    this._imageUrl = imageUrl!;
  }

  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get id => _id;
  set id(String id) => _id = id;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;

  Author.fromJson(Map<String, dynamic> json) {
    _firstName = (json['firstName'] != null ? json['firstName'] : '');
    _id = (json['id'] != null ? json['id'] : '');
    _lastName = (json['lastName'] != null ? json['lastName'] : '');
    _imageUrl = (json['imageUrl'] != null ? json['imageUrl'] : '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this._firstName;
    data['id'] = this._id;
    data['lastName'] = this._lastName;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}
