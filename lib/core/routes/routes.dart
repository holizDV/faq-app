library routes;

import 'package:faq_app/features/faq/presentation/bloc/faq_bloc.dart';
import 'package:faq_app/features/faq/presentation/page/home_faq_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/login/login_bloc.dart';
import '../../features/auth/presentation/page/login_page.dart';
import '../service_locator/service_locator.dart';
import '../utils/transitions.dart';

part 'src/app_route.dart';
