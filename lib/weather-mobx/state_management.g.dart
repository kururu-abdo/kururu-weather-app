// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_management.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$City on _City, Store {
  Computed<ObservableList<CityWeather>> _$unique_prefferdComputed;

  @override
  ObservableList<CityWeather> get unique_prefferd =>
      (_$unique_prefferdComputed ??= Computed<ObservableList<CityWeather>>(
              () => super.unique_prefferd))
          .value;

  final _$_citiesAtom = Atom(name: '_City._cities');

  @override
  ObservableList<CityWeather> get _cities {
    _$_citiesAtom.context.enforceReadPolicy(_$_citiesAtom);
    _$_citiesAtom.reportObserved();
    return super._cities;
  }

  @override
  set _cities(ObservableList<CityWeather> value) {
    _$_citiesAtom.context.conditionallyRunInAction(() {
      super._cities = value;
      _$_citiesAtom.reportChanged();
    }, _$_citiesAtom, name: '${_$_citiesAtom.name}_set');
  }

  final _$_search_resultAtom = Atom(name: '_City._search_result');

  @override
  ObservableList<CityModel> get _search_result {
    _$_search_resultAtom.context.enforceReadPolicy(_$_search_resultAtom);
    _$_search_resultAtom.reportObserved();
    return super._search_result;
  }

  @override
  set _search_result(ObservableList<CityModel> value) {
    _$_search_resultAtom.context.conditionallyRunInAction(() {
      super._search_result = value;
      _$_search_resultAtom.reportChanged();
    }, _$_search_resultAtom, name: '${_$_search_resultAtom.name}_set');
  }

  final _$_cityweatherAtom = Atom(name: '_City._cityweather');

  @override
  CityWeather get _cityweather {
    _$_cityweatherAtom.context.enforceReadPolicy(_$_cityweatherAtom);
    _$_cityweatherAtom.reportObserved();
    return super._cityweather;
  }

  @override
  set _cityweather(CityWeather value) {
    _$_cityweatherAtom.context.conditionallyRunInAction(() {
      super._cityweather = value;
      _$_cityweatherAtom.reportChanged();
    }, _$_cityweatherAtom, name: '${_$_cityweatherAtom.name}_set');
  }

  final _$_prefferedCitiesAtom = Atom(name: '_City._prefferedCities');

  @override
  ObservableList<CityWeather> get _prefferedCities {
    _$_prefferedCitiesAtom.context.enforceReadPolicy(_$_prefferedCitiesAtom);
    _$_prefferedCitiesAtom.reportObserved();
    return super._prefferedCities;
  }

  @override
  set _prefferedCities(ObservableList<CityWeather> value) {
    _$_prefferedCitiesAtom.context.conditionallyRunInAction(() {
      super._prefferedCities = value;
      _$_prefferedCitiesAtom.reportChanged();
    }, _$_prefferedCitiesAtom, name: '${_$_prefferedCitiesAtom.name}_set');
  }

  final _$fetchDataAsyncAction = AsyncAction('fetchData');

  @override
  Future fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  final _$fetchUsersAsyncAction = AsyncAction('fetchUsers');

  @override
  Future fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  final _$_CityActionController = ActionController(name: '_City');

  @override
  void deleteFromPreffed(CityWeather cityWeather) {
    final _$actionInfo = _$_CityActionController.startAction();
    try {
      return super.deleteFromPreffed(cityWeather);
    } finally {
      _$_CityActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTopreffered(CityWeather city) {
    final _$actionInfo = _$_CityActionController.startAction();
    try {
      return super.addTopreffered(city);
    } finally {
      _$_CityActionController.endAction(_$actionInfo);
    }
  }

  @override
  CityWeather cityDetail(CityWeather city) {
    final _$actionInfo = _$_CityActionController.startAction();
    try {
      return super.cityDetail(city);
    } finally {
      _$_CityActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCities(CityWeather cityWeather) {
    final _$actionInfo = _$_CityActionController.startAction();
    try {
      return super.addCities(cityWeather);
    } finally {
      _$_CityActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'unique_prefferd: ${unique_prefferd.toString()}';
    return '{$string}';
  }
}
