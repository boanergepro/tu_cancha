// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSchedulingModelCollection on Isar {
  IsarCollection<SchedulingModel> get schedulingModels => this.collection();
}

const SchedulingModelSchema = CollectionSchema(
  name: r'SchedulingModel',
  id: -2143290629011119330,
  properties: {
    r'fieldName': PropertySchema(
      id: 0,
      name: r'fieldName',
      type: IsarType.string,
    ),
    r'precipitationPercentage': PropertySchema(
      id: 1,
      name: r'precipitationPercentage',
      type: IsarType.long,
    ),
    r'scheduledDay': PropertySchema(
      id: 2,
      name: r'scheduledDay',
      type: IsarType.dateTime,
    ),
    r'userName': PropertySchema(
      id: 3,
      name: r'userName',
      type: IsarType.string,
    )
  },
  estimateSize: _schedulingModelEstimateSize,
  serialize: _schedulingModelSerialize,
  deserialize: _schedulingModelDeserialize,
  deserializeProp: _schedulingModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _schedulingModelGetId,
  getLinks: _schedulingModelGetLinks,
  attach: _schedulingModelAttach,
  version: '3.0.5',
);

int _schedulingModelEstimateSize(
  SchedulingModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fieldName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _schedulingModelSerialize(
  SchedulingModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fieldName);
  writer.writeLong(offsets[1], object.precipitationPercentage);
  writer.writeDateTime(offsets[2], object.scheduledDay);
  writer.writeString(offsets[3], object.userName);
}

SchedulingModel _schedulingModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SchedulingModel(
    fieldName: reader.readStringOrNull(offsets[0]),
    id: id,
    precipitationPercentage: reader.readLongOrNull(offsets[1]),
    scheduledDay: reader.readDateTime(offsets[2]),
    userName: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _schedulingModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _schedulingModelGetId(SchedulingModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _schedulingModelGetLinks(SchedulingModel object) {
  return [];
}

void _schedulingModelAttach(
    IsarCollection<dynamic> col, Id id, SchedulingModel object) {
  object.id = id;
}

extension SchedulingModelQueryWhereSort
    on QueryBuilder<SchedulingModel, SchedulingModel, QWhere> {
  QueryBuilder<SchedulingModel, SchedulingModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SchedulingModelQueryWhere
    on QueryBuilder<SchedulingModel, SchedulingModel, QWhereClause> {
  QueryBuilder<SchedulingModel, SchedulingModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SchedulingModelQueryFilter
    on QueryBuilder<SchedulingModel, SchedulingModel, QFilterCondition> {
  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fieldName',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fieldName',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fieldName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fieldName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fieldName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fieldName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fieldName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fieldName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fieldName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fieldName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fieldName',
        value: '',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      fieldNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fieldName',
        value: '',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      precipitationPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitationPercentage',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      precipitationPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitationPercentage',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      precipitationPercentageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitationPercentage',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      precipitationPercentageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitationPercentage',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      precipitationPercentageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitationPercentage',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      precipitationPercentageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitationPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      scheduledDayEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledDay',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      scheduledDayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledDay',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      scheduledDayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledDay',
        value: value,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      scheduledDayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }
}

extension SchedulingModelQueryObject
    on QueryBuilder<SchedulingModel, SchedulingModel, QFilterCondition> {}

extension SchedulingModelQueryLinks
    on QueryBuilder<SchedulingModel, SchedulingModel, QFilterCondition> {}

extension SchedulingModelQuerySortBy
    on QueryBuilder<SchedulingModel, SchedulingModel, QSortBy> {
  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByFieldName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldName', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByFieldNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldName', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByPrecipitationPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationPercentage', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByPrecipitationPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationPercentage', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByScheduledDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDay', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByScheduledDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDay', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension SchedulingModelQuerySortThenBy
    on QueryBuilder<SchedulingModel, SchedulingModel, QSortThenBy> {
  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByFieldName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldName', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByFieldNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldName', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByPrecipitationPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationPercentage', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByPrecipitationPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipitationPercentage', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByScheduledDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDay', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByScheduledDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledDay', Sort.desc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QAfterSortBy>
      thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension SchedulingModelQueryWhereDistinct
    on QueryBuilder<SchedulingModel, SchedulingModel, QDistinct> {
  QueryBuilder<SchedulingModel, SchedulingModel, QDistinct> distinctByFieldName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fieldName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QDistinct>
      distinctByPrecipitationPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipitationPercentage');
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QDistinct>
      distinctByScheduledDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledDay');
    });
  }

  QueryBuilder<SchedulingModel, SchedulingModel, QDistinct> distinctByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }
}

extension SchedulingModelQueryProperty
    on QueryBuilder<SchedulingModel, SchedulingModel, QQueryProperty> {
  QueryBuilder<SchedulingModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SchedulingModel, String?, QQueryOperations> fieldNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fieldName');
    });
  }

  QueryBuilder<SchedulingModel, int?, QQueryOperations>
      precipitationPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipitationPercentage');
    });
  }

  QueryBuilder<SchedulingModel, DateTime, QQueryOperations>
      scheduledDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledDay');
    });
  }

  QueryBuilder<SchedulingModel, String?, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}
