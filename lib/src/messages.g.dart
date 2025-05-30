// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v22.4.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

/// Possible outcomes of an authentication attempt.
enum AuthResult {
  /// The user authenticated successfully.
  success,

  /// The user failed to successfully authenticate.
  failure,

  /// The authentication system was not available.
  errorNotAvailable,

  /// No biometrics are enrolled.
  errorNotEnrolled,

  /// No passcode is set.
  errorPasscodeNotSet,
}

/// Pigeon equivalent of the subset of BiometricType used by iOS.
enum AuthBiometric {
  face,
  fingerprint,
}

/// Pigeon version of IOSAuthMessages, plus the authorization reason.
///
/// See auth_messages_ios.dart for details.
class AuthStrings {
  AuthStrings({
    required this.reason,
    required this.lockOut,
    this.goToSettingsButton,
    this.goToSettingsDescription,
    required this.cancelButton,
    this.localizedFallbackTitle,
  });

  String reason;

  String lockOut;

  String? goToSettingsButton;

  String? goToSettingsDescription;

  String cancelButton;

  String? localizedFallbackTitle;

  Object encode() {
    return <Object?>[
      reason,
      lockOut,
      goToSettingsButton,
      goToSettingsDescription,
      cancelButton,
      localizedFallbackTitle,
    ];
  }

  static AuthStrings decode(Object result) {
    result as List<Object?>;
    return AuthStrings(
      reason: result[0]! as String,
      lockOut: result[1]! as String,
      goToSettingsButton: result[2] as String?,
      goToSettingsDescription: result[3] as String?,
      cancelButton: result[4]! as String,
      localizedFallbackTitle: result[5] as String?,
    );
  }
}

class AuthOptions {
  AuthOptions({
    required this.biometricOnly,
    required this.sticky,
    required this.useErrorDialogs,
  });

  bool biometricOnly;

  bool sticky;

  bool useErrorDialogs;

  Object encode() {
    return <Object?>[
      biometricOnly,
      sticky,
      useErrorDialogs,
    ];
  }

  static AuthOptions decode(Object result) {
    result as List<Object?>;
    return AuthOptions(
      biometricOnly: result[0]! as bool,
      sticky: result[1]! as bool,
      useErrorDialogs: result[2]! as bool,
    );
  }
}

class AuthResultDetails {
  AuthResultDetails({
    required this.result,
    this.errorMessage,
    this.errorDetails,
  });

  /// The result of authenticating.
  AuthResult result;

  /// A system-provided error message, if any.
  String? errorMessage;

  /// System-provided error details, if any.
  String? errorDetails;

  Object encode() {
    return <Object?>[
      result,
      errorMessage,
      errorDetails,
    ];
  }

  static AuthResultDetails decode(Object result) {
    result as List<Object?>;
    return AuthResultDetails(
      result: result[0]! as AuthResult,
      errorMessage: result[1] as String?,
      errorDetails: result[2] as String?,
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    } else if (value is AuthResult) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    } else if (value is AuthBiometric) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else if (value is AuthStrings) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is AuthOptions) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is AuthResultDetails) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : AuthResult.values[value];
      case 130:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : AuthBiometric.values[value];
      case 131:
        return AuthStrings.decode(readValue(buffer)!);
      case 132:
        return AuthOptions.decode(readValue(buffer)!);
      case 133:
        return AuthResultDetails.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class LocalAuthApi {
  /// Constructor for [LocalAuthApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  LocalAuthApi(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  /// Returns true if this device supports authentication.
  Future<bool> isDeviceSupported() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.isDeviceSupported$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Returns true if this device can support biometric authentication, whether
  /// any biometrics are enrolled or not.
  Future<bool> deviceCanSupportBiometrics() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.deviceCanSupportBiometrics$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Returns the biometric types that are enrolled, and can thus be used
  /// without additional setup.
  Future<List<AuthBiometric>> getEnrolledBiometrics() async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.getEnrolledBiometrics$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<AuthBiometric>();
    }
  }

  /// Attempts to authenticate the user with the provided [options], and using
  /// [strings] for any UI.
  Future<AuthResultDetails> authenticate(
      AuthOptions options, AuthStrings strings) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.authenticate$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList = await pigeonVar_channel
        .send(<Object?>[options, strings]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as AuthResultDetails?)!;
    }
  }
}