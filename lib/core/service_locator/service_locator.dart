library service_locator;

import 'package:dio/dio.dart';
import 'package:faq_app/core/service_locator/src/auth_locator.dart';
import 'package:faq_app/core/service_locator/src/faq_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_method.dart';
import '../network/local_storage.dart';

part '../service_locator/src/locator.dart';
