// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Weather extends DataClass implements Insertable<Weather> {
  final int id;
  final String weatherState;
  final String name;
  final DateTime lastUpdated;
  final String formattedWeatherState;
  final String minTemp;
  final String temp;
  final String maxTemp;
  final String created;

  Weather(
      {@required this.id,
      @required this.weatherState,
      @required this.name,
      this.lastUpdated,
      @required this.formattedWeatherState,
      @required this.minTemp,
      @required this.temp,
      @required this.maxTemp,
      @required this.created});

  factory Weather.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Weather(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      weatherState: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_state']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastUpdated: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_updated']),
      formattedWeatherState: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}formatted_weather_state']),
      minTemp: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}min_temp']),
      temp: stringType.mapFromDatabaseResponse(data['${effectivePrefix}temp']),
      maxTemp: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_temp']),
      created:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}created']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || weatherState != null) {
      map['weather_state'] = Variable<String>(weatherState);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    if (!nullToAbsent || formattedWeatherState != null) {
      map['formatted_weather_state'] = Variable<String>(formattedWeatherState);
    }
    if (!nullToAbsent || minTemp != null) {
      map['min_temp'] = Variable<String>(minTemp);
    }
    if (!nullToAbsent || temp != null) {
      map['temp'] = Variable<String>(temp);
    }
    if (!nullToAbsent || maxTemp != null) {
      map['max_temp'] = Variable<String>(maxTemp);
    }
    if (!nullToAbsent || created != null) {
      map['created'] = Variable<String>(created);
    }
    return map;
  }

  WeathersCompanion toCompanion(bool nullToAbsent) {
    return WeathersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      weatherState: weatherState == null && nullToAbsent
          ? const Value.absent()
          : Value(weatherState),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      formattedWeatherState: formattedWeatherState == null && nullToAbsent
          ? const Value.absent()
          : Value(formattedWeatherState),
      minTemp: minTemp == null && nullToAbsent
          ? const Value.absent()
          : Value(minTemp),
      temp: temp == null && nullToAbsent ? const Value.absent() : Value(temp),
      maxTemp: maxTemp == null && nullToAbsent
          ? const Value.absent()
          : Value(maxTemp),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Weather(
      id: serializer.fromJson<int>(json['id']),
      weatherState: serializer.fromJson<String>(json['weatherState']),
      name: serializer.fromJson<String>(json['name']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
      formattedWeatherState:
          serializer.fromJson<String>(json['formattedWeatherState']),
      minTemp: serializer.fromJson<String>(json['minTemp']),
      temp: serializer.fromJson<String>(json['temp']),
      maxTemp: serializer.fromJson<String>(json['maxTemp']),
      created: serializer.fromJson<String>(json['created']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weatherState': serializer.toJson<String>(weatherState),
      'name': serializer.toJson<String>(name),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
      'formattedWeatherState': serializer.toJson<String>(formattedWeatherState),
      'minTemp': serializer.toJson<String>(minTemp),
      'temp': serializer.toJson<String>(temp),
      'maxTemp': serializer.toJson<String>(maxTemp),
      'created': serializer.toJson<String>(created),
    };
  }

  Weather copyWith(
          {int id,
          String weatherState,
          String name,
          DateTime lastUpdated,
          String formattedWeatherState,
          String minTemp,
          String temp,
          String maxTemp,
          String created}) =>
      Weather(
        id: id ?? this.id,
        weatherState: weatherState ?? this.weatherState,
        name: name ?? this.name,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        formattedWeatherState:
            formattedWeatherState ?? this.formattedWeatherState,
        minTemp: minTemp ?? this.minTemp,
        temp: temp ?? this.temp,
        maxTemp: maxTemp ?? this.maxTemp,
        created: created ?? this.created,
      );

  @override
  String toString() {
    return (StringBuffer('Weather(')
          ..write('id: $id, ')
          ..write('weatherState: $weatherState, ')
          ..write('name: $name, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('formattedWeatherState: $formattedWeatherState, ')
          ..write('minTemp: $minTemp, ')
          ..write('temp: $temp, ')
          ..write('maxTemp: $maxTemp, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          weatherState.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  lastUpdated.hashCode,
                  $mrjc(
                      formattedWeatherState.hashCode,
                      $mrjc(
                          minTemp.hashCode,
                          $mrjc(temp.hashCode,
                              $mrjc(maxTemp.hashCode, created.hashCode)))))))));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Weather &&
          other.id == this.id &&
          other.weatherState == this.weatherState &&
          other.name == this.name &&
          other.lastUpdated == this.lastUpdated &&
          other.formattedWeatherState == this.formattedWeatherState &&
          other.minTemp == this.minTemp &&
          other.temp == this.temp &&
          other.maxTemp == this.maxTemp &&
          other.created == this.created);
}

class WeathersCompanion extends UpdateCompanion<Weather> {
  final Value<int> id;
  final Value<String> weatherState;
  final Value<String> name;
  final Value<DateTime> lastUpdated;
  final Value<String> formattedWeatherState;
  final Value<String> minTemp;
  final Value<String> temp;
  final Value<String> maxTemp;
  final Value<String> created;

  const WeathersCompanion({
    this.id = const Value.absent(),
    this.weatherState = const Value.absent(),
    this.name = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.formattedWeatherState = const Value.absent(),
    this.minTemp = const Value.absent(),
    this.temp = const Value.absent(),
    this.maxTemp = const Value.absent(),
    this.created = const Value.absent(),
  });

  WeathersCompanion.insert({
    this.id = const Value.absent(),
    @required String weatherState,
    @required String name,
    this.lastUpdated = const Value.absent(),
    @required String formattedWeatherState,
    @required String minTemp,
    @required String temp,
    @required String maxTemp,
    @required String created,
  })  : weatherState = Value(weatherState),
        name = Value(name),
        formattedWeatherState = Value(formattedWeatherState),
        minTemp = Value(minTemp),
        temp = Value(temp),
        maxTemp = Value(maxTemp),
        created = Value(created);

  static Insertable<Weather> custom({
    Expression<int> id,
    Expression<String> weatherState,
    Expression<String> name,
    Expression<DateTime> lastUpdated,
    Expression<String> formattedWeatherState,
    Expression<String> minTemp,
    Expression<String> temp,
    Expression<String> maxTemp,
    Expression<String> created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weatherState != null) 'weather_state': weatherState,
      if (name != null) 'name': name,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (formattedWeatherState != null)
        'formatted_weather_state': formattedWeatherState,
      if (minTemp != null) 'min_temp': minTemp,
      if (temp != null) 'temp': temp,
      if (maxTemp != null) 'max_temp': maxTemp,
      if (created != null) 'created': created,
    });
  }

  WeathersCompanion copyWith(
      {Value<int> id,
      Value<String> weatherState,
      Value<String> name,
      Value<DateTime> lastUpdated,
      Value<String> formattedWeatherState,
      Value<String> minTemp,
      Value<String> temp,
      Value<String> maxTemp,
      Value<String> created}) {
    return WeathersCompanion(
      id: id ?? this.id,
      weatherState: weatherState ?? this.weatherState,
      name: name ?? this.name,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      formattedWeatherState:
          formattedWeatherState ?? this.formattedWeatherState,
      minTemp: minTemp ?? this.minTemp,
      temp: temp ?? this.temp,
      maxTemp: maxTemp ?? this.maxTemp,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weatherState.present) {
      map['weather_state'] = Variable<String>(weatherState.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (formattedWeatherState.present) {
      map['formatted_weather_state'] =
          Variable<String>(formattedWeatherState.value);
    }
    if (minTemp.present) {
      map['min_temp'] = Variable<String>(minTemp.value);
    }
    if (temp.present) {
      map['temp'] = Variable<String>(temp.value);
    }
    if (maxTemp.present) {
      map['max_temp'] = Variable<String>(maxTemp.value);
    }
    if (created.present) {
      map['created'] = Variable<String>(created.value);
    }
    return map;
  }
}

class $WeathersTable extends Weathers with TableInfo<$WeathersTable, Weather> {
  final GeneratedDatabase _db;
  final String _alias;

  $WeathersTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _weatherStateMeta =
      const VerificationMeta('weatherState');
  GeneratedTextColumn _weatherState;

  @override
  GeneratedTextColumn get weatherState =>
      _weatherState ??= _constructWeatherState();

  GeneratedTextColumn _constructWeatherState() {
    return GeneratedTextColumn('weather_state', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;

  @override
  GeneratedTextColumn get name => _name ??= _constructName();

  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  GeneratedDateTimeColumn _lastUpdated;

  @override
  GeneratedDateTimeColumn get lastUpdated =>
      _lastUpdated ??= _constructLastUpdated();

  GeneratedDateTimeColumn _constructLastUpdated() {
    return GeneratedDateTimeColumn(
      'last_updated',
      $tableName,
      true,
    );
  }

  final VerificationMeta _formattedWeatherStateMeta =
      const VerificationMeta('formattedWeatherState');
  GeneratedTextColumn _formattedWeatherState;

  @override
  GeneratedTextColumn get formattedWeatherState =>
      _formattedWeatherState ??= _constructFormattedWeatherState();

  GeneratedTextColumn _constructFormattedWeatherState() {
    return GeneratedTextColumn('formatted_weather_state', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _minTempMeta = const VerificationMeta('minTemp');
  GeneratedTextColumn _minTemp;

  @override
  GeneratedTextColumn get minTemp => _minTemp ??= _constructMinTemp();

  GeneratedTextColumn _constructMinTemp() {
    return GeneratedTextColumn('min_temp', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _tempMeta = const VerificationMeta('temp');
  GeneratedTextColumn _temp;

  @override
  GeneratedTextColumn get temp => _temp ??= _constructTemp();

  GeneratedTextColumn _constructTemp() {
    return GeneratedTextColumn('temp', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _maxTempMeta = const VerificationMeta('maxTemp');
  GeneratedTextColumn _maxTemp;

  @override
  GeneratedTextColumn get maxTemp => _maxTemp ??= _constructMaxTemp();

  GeneratedTextColumn _constructMaxTemp() {
    return GeneratedTextColumn('max_temp', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  GeneratedTextColumn _created;

  @override
  GeneratedTextColumn get created => _created ??= _constructCreated();

  GeneratedTextColumn _constructCreated() {
    return GeneratedTextColumn('created', $tableName, false,
        minTextLength: 1, maxTextLength: 35);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        weatherState,
        name,
        lastUpdated,
        formattedWeatherState,
        minTemp,
        temp,
        maxTemp,
        created
      ];

  @override
  $WeathersTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'weathers';
  @override
  final String actualTableName = 'weathers';

  @override
  VerificationContext validateIntegrity(Insertable<Weather> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('weather_state')) {
      context.handle(
          _weatherStateMeta,
          weatherState.isAcceptableOrUnknown(
              data['weather_state'], _weatherStateMeta));
    } else if (isInserting) {
      context.missing(_weatherStateMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated'], _lastUpdatedMeta));
    }
    if (data.containsKey('formatted_weather_state')) {
      context.handle(
          _formattedWeatherStateMeta,
          formattedWeatherState.isAcceptableOrUnknown(
              data['formatted_weather_state'], _formattedWeatherStateMeta));
    } else if (isInserting) {
      context.missing(_formattedWeatherStateMeta);
    }
    if (data.containsKey('min_temp')) {
      context.handle(_minTempMeta,
          minTemp.isAcceptableOrUnknown(data['min_temp'], _minTempMeta));
    } else if (isInserting) {
      context.missing(_minTempMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
          _tempMeta, temp.isAcceptableOrUnknown(data['temp'], _tempMeta));
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('max_temp')) {
      context.handle(_maxTempMeta,
          maxTemp.isAcceptableOrUnknown(data['max_temp'], _maxTempMeta));
    } else if (isInserting) {
      context.missing(_maxTempMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created'], _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Weather map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Weather.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WeathersTable createAlias(String alias) {
    return $WeathersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WeathersTable _weathers;

  $WeathersTable get weathers => _weathers ??= $WeathersTable(this);
  WeatherDao _weatherDao;

  WeatherDao get weatherDao => _weatherDao ??= WeatherDao(this as AppDatabase);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [weathers];
}
