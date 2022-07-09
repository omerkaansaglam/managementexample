// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class OrdersModelCollectionReference
    implements
        OrdersModelQuery,
        FirestoreCollectionReference<OrdersModelQuerySnapshot> {
  factory OrdersModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$OrdersModelCollectionReference;

  static OrdersModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return OrdersModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    OrdersModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  OrdersModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<OrdersModelDocumentReference> add(OrdersModel value);
}

class _$OrdersModelCollectionReference extends _$OrdersModelQuery
    implements OrdersModelCollectionReference {
  factory _$OrdersModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$OrdersModelCollectionReference._(
      firestore.collection('site').withConverter(
            fromFirestore: OrdersModelCollectionReference.fromFirestore,
            toFirestore: OrdersModelCollectionReference.toFirestore,
          ),
    );
  }

  _$OrdersModelCollectionReference._(
    CollectionReference<OrdersModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<OrdersModel> get reference =>
      super.reference as CollectionReference<OrdersModel>;

  @override
  OrdersModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return OrdersModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<OrdersModelDocumentReference> add(OrdersModel value) {
    return reference
        .add(value)
        .then((ref) => OrdersModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$OrdersModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class OrdersModelDocumentReference
    extends FirestoreDocumentReference<OrdersModelDocumentSnapshot> {
  factory OrdersModelDocumentReference(
          DocumentReference<OrdersModel> reference) =
      _$OrdersModelDocumentReference;

  DocumentReference<OrdersModel> get reference;

  /// A reference to the [OrdersModelCollectionReference] containing this document.
  OrdersModelCollectionReference get parent {
    return _$OrdersModelCollectionReference(reference.firestore);
  }

  @override
  Stream<OrdersModelDocumentSnapshot> snapshots();

  @override
  Future<OrdersModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String dateTime,
    num job,
    String name,
    String number,
    String staff,
  });

  Future<void> set(OrdersModel value);
}

class _$OrdersModelDocumentReference
    extends FirestoreDocumentReference<OrdersModelDocumentSnapshot>
    implements OrdersModelDocumentReference {
  _$OrdersModelDocumentReference(this.reference);

  @override
  final DocumentReference<OrdersModel> reference;

  /// A reference to the [OrdersModelCollectionReference] containing this document.
  OrdersModelCollectionReference get parent {
    return _$OrdersModelCollectionReference(reference.firestore);
  }

  @override
  Stream<OrdersModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return OrdersModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<OrdersModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return OrdersModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? dateTime = _sentinel,
    Object? job = _sentinel,
    Object? name = _sentinel,
    Object? number = _sentinel,
    Object? staff = _sentinel,
  }) async {
    final json = {
      if (dateTime != _sentinel) "dateTime": dateTime as String,
      if (job != _sentinel) "job": job as num,
      if (name != _sentinel) "name": name as String,
      if (number != _sentinel) "number": number as String,
      if (staff != _sentinel) "staff": staff as String,
    };

    return reference.update(json);
  }

  Future<void> set(OrdersModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is OrdersModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class OrdersModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  OrdersModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<OrdersModel> snapshot;

  @override
  OrdersModelDocumentReference get reference {
    return OrdersModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final OrdersModel? data;
}

abstract class OrdersModelQuery
    implements QueryReference<OrdersModelQuerySnapshot> {
  @override
  OrdersModelQuery limit(int limit);

  @override
  OrdersModelQuery limitToLast(int limit);

  OrdersModelQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  OrdersModelQuery whereDateTime({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  OrdersModelQuery whereJob({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num>? whereIn,
    List<num>? whereNotIn,
  });
  OrdersModelQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  OrdersModelQuery whereNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  OrdersModelQuery whereStaff({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  OrdersModelQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  });

  OrdersModelQuery orderByDateTime({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  });

  OrdersModelQuery orderByJob({
    bool descending = false,
    num startAt,
    num startAfter,
    num endAt,
    num endBefore,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  });

  OrdersModelQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  });

  OrdersModelQuery orderByNumber({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  });

  OrdersModelQuery orderByStaff({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  });
}

class _$OrdersModelQuery extends QueryReference<OrdersModelQuerySnapshot>
    implements OrdersModelQuery {
  _$OrdersModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<OrdersModel> reference;

  OrdersModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<OrdersModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return OrdersModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<OrdersModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: OrdersModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return OrdersModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<OrdersModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<OrdersModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  OrdersModelQuery limit(int limit) {
    return _$OrdersModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  OrdersModelQuery limitToLast(int limit) {
    return _$OrdersModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  OrdersModelQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OrdersModelQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrdersModelQuery whereDateTime({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OrdersModelQuery(
      reference.where(
        "dateTime",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrdersModelQuery whereJob({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num>? whereIn,
    List<num>? whereNotIn,
  }) {
    return _$OrdersModelQuery(
      reference.where(
        "job",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrdersModelQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OrdersModelQuery(
      reference.where(
        "name",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrdersModelQuery whereNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OrdersModelQuery(
      reference.where(
        "number",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrdersModelQuery whereStaff({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$OrdersModelQuery(
      reference.where(
        "staff",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrdersModelQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrdersModelQuery(query, _collection);
  }

  OrdersModelQuery orderByDateTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("dateTime", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrdersModelQuery(query, _collection);
  }

  OrdersModelQuery orderByJob({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("job", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrdersModelQuery(query, _collection);
  }

  OrdersModelQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("name", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrdersModelQuery(query, _collection);
  }

  OrdersModelQuery orderByNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("number", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrdersModelQuery(query, _collection);
  }

  OrdersModelQuery orderByStaff({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrdersModelDocumentSnapshot? startAtDocument,
    OrdersModelDocumentSnapshot? endAtDocument,
    OrdersModelDocumentSnapshot? endBeforeDocument,
    OrdersModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("staff", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrdersModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$OrdersModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class OrdersModelQuerySnapshot
    extends FirestoreQuerySnapshot<OrdersModelQueryDocumentSnapshot> {
  OrdersModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<OrdersModel> snapshot;

  @override
  final List<OrdersModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<OrdersModelDocumentSnapshot>> docChanges;
}

class OrdersModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements OrdersModelDocumentSnapshot {
  OrdersModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<OrdersModel> snapshot;

  @override
  OrdersModelDocumentReference get reference {
    return OrdersModelDocumentReference(snapshot.reference);
  }

  @override
  final OrdersModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      dateTime: json['dateTime'] as String,
      job: json['job'] as num,
      name: json['name'] as String,
      number: json['number'] as String,
      staff: json['staff'] as String,
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'job': instance.job,
      'name': instance.name,
      'number': instance.number,
      'staff': instance.staff,
    };
