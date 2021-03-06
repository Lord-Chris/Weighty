// Mocks generated by Mockito 5.1.0 from annotations
// in weighty/test/auth_serivice_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter/material.dart' as _i6;
import 'package:flutter/services.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weighty/core/_core.dart' as _i7;
import 'package:weighty/services/_services.dart' as _i5;

import 'auth_serivice_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMethodCodec_0 extends _i1.Fake implements _i2.MethodCodec {}

class _FakeBinaryMessenger_1 extends _i1.Fake implements _i2.BinaryMessenger {}

/// A class which mocks [MockMethodChannel].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockMethodChannel extends _i1.Mock implements _i3.MockMethodChannel {
  MockMockMethodChannel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name =>
      (super.noSuchMethod(Invocation.getter(#name), returnValue: '') as String);
  @override
  _i2.MethodCodec get codec => (super.noSuchMethod(Invocation.getter(#codec),
      returnValue: _FakeMethodCodec_0()) as _i2.MethodCodec);
  @override
  _i2.BinaryMessenger get binaryMessenger =>
      (super.noSuchMethod(Invocation.getter(#binaryMessenger),
          returnValue: _FakeBinaryMessenger_1()) as _i2.BinaryMessenger);
  @override
  _i4.Future<T?> invokeMethod<T>(String? method, [dynamic arguments]) =>
      (super.noSuchMethod(Invocation.method(#invokeMethod, [method, arguments]),
          returnValue: Future<T?>.value()) as _i4.Future<T?>);
  @override
  _i4.Future<List<T>?> invokeListMethod<T>(String? method,
          [dynamic arguments]) =>
      (super.noSuchMethod(
          Invocation.method(#invokeListMethod, [method, arguments]),
          returnValue: Future<List<T>?>.value()) as _i4.Future<List<T>?>);
  @override
  _i4.Future<Map<K, V>?> invokeMapMethod<K, V>(String? method,
          [dynamic arguments]) =>
      (super.noSuchMethod(
          Invocation.method(#invokeMapMethod, [method, arguments]),
          returnValue: Future<Map<K, V>?>.value()) as _i4.Future<Map<K, V>?>);
  @override
  void setMethodCallHandler(
          _i4.Future<dynamic> Function(_i2.MethodCall)? handler) =>
      super.noSuchMethod(Invocation.method(#setMethodCallHandler, [handler]),
          returnValueForMissingStub: null);
}

/// A class which mocks [IAuthenticationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationService extends _i1.Mock
    implements _i5.IAuthenticationService {
  @override
  _i4.Future<void> signInAnonymously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> logOut() =>
      (super.noSuchMethod(Invocation.method(#logOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}

/// A class which mocks [INavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i5.INavigationService {
  @override
  _i4.Future<T?>? toNamed<T extends Object?>(String? routeName,
          {Object? arguments}) =>
      (super.noSuchMethod(
              Invocation.method(#toNamed, [routeName], {#arguments: arguments}))
          as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? offNamed<T extends Object?, TO extends Object?>(
          String? routeName,
          {TO? result,
          Object? arguments}) =>
      (super.noSuchMethod(Invocation.method(
              #offNamed, [routeName], {#result: result, #arguments: arguments}))
          as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? offAllNamed<T extends Object?>(
          String? routeName, bool Function(_i6.Route<dynamic>)? predicate,
          {Object? arguments}) =>
      (super.noSuchMethod(Invocation.method(
              #offAllNamed, [routeName, predicate], {#arguments: arguments}))
          as _i4.Future<T?>?);
  @override
  void back<T extends Object?>([T? result]) =>
      super.noSuchMethod(Invocation.method(#back, [result]),
          returnValueForMissingStub: null);
}

/// A class which mocks [IFirestoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreService extends _i1.Mock implements _i5.IFirestoreService {
  @override
  _i4.Future<void> addWeight(_i7.WeightInput? input) =>
      (super.noSuchMethod(Invocation.method(#addWeight, [input]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> updateWeight(_i7.WeightInput? input) =>
      (super.noSuchMethod(Invocation.method(#updateWeight, [input]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteWeight(_i7.WeightInput? input) =>
      (super.noSuchMethod(Invocation.method(#deleteWeight, [input]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Stream<List<_i7.WeightInput>> weightStream() =>
      (super.noSuchMethod(Invocation.method(#weightStream, []),
              returnValue: Stream<List<_i7.WeightInput>>.empty())
          as _i4.Stream<List<_i7.WeightInput>>);
}
