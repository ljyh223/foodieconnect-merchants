///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsZhCn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAuthZhCn auth = _TranslationsAuthZhCn._(_root);
	@override late final _TranslationsCommonZhCn common = _TranslationsCommonZhCn._(_root);
	@override late final _TranslationsMenuZhCn menu = _TranslationsMenuZhCn._(_root);
	@override late final _TranslationsNavigationZhCn navigation = _TranslationsNavigationZhCn._(_root);
	@override late final _TranslationsRestaurantZhCn restaurant = _TranslationsRestaurantZhCn._(_root);
	@override late final _TranslationsStaffZhCn staff = _TranslationsStaffZhCn._(_root);
	@override late final _TranslationsStatisticsZhCn statistics = _TranslationsStatisticsZhCn._(_root);
	@override late final _TranslationsValidationZhCn validation = _TranslationsValidationZhCn._(_root);
}

// Path: auth
class _TranslationsAuthZhCn implements TranslationsAuthEn {
	_TranslationsAuthZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get login => '登录';
	@override String get logout => '退出';
	@override String get username => '用户名';
	@override String get password => '密码';
	@override String get confirmPassword => '确认密码';
	@override String get changePassword => '修改密码';
	@override String get forgotPassword => '忘记密码';
	@override String get loginSuccess => '登录成功';
	@override String get loginFailed => '登录失败';
	@override String get logoutSuccess => '退出成功';
	@override String get invalidCredentials => '用户名或密码错误';
	@override String get passwordMismatch => '密码不匹配';
	@override String get passwordChanged => '密码修改成功';
}

// Path: common
class _TranslationsCommonZhCn implements TranslationsCommonEn {
	_TranslationsCommonZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get save => '保存';
	@override String get cancel => '取消';
	@override String get confirm => '确认';
	@override String get delete => '删除';
	@override String get edit => '编辑';
	@override String get add => '添加';
	@override String get search => '搜索';
	@override String get filter => '筛选';
	@override String get refresh => '刷新';
	@override String get loading => '加载中...';
	@override String get noData => '暂无数据';
	@override String get error => '错误';
	@override String get success => '成功';
	@override String get warning => '警告';
	@override String get info => '提示';
	@override String get retry => '重试';
	@override String get close => '关闭';
	@override String get ok => '确定';
	@override String get yes => '是';
	@override String get no => '否';
}

// Path: menu
class _TranslationsMenuZhCn implements TranslationsMenuEn {
	_TranslationsMenuZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '菜单管理';
	@override String get items => '菜品列表';
	@override String get categories => '分类管理';
	@override String get addItem => '添加菜品';
	@override String get editItem => '编辑菜品';
	@override String get deleteItem => '删除菜品';
	@override String get itemName => '菜品名称';
	@override String get description => '菜品描述';
	@override String get price => '价格';
	@override String get originalPrice => '原价';
	@override String get category => '分类';
	@override String get image => '菜品图片';
	@override String get available => '可售';
	@override String get unavailable => '售罄';
	@override String get recommended => '推荐';
	@override String get spiceLevel => '辣度';
	@override String get preparationTime => '制作时间';
	@override String get calories => '卡路里';
	@override String get addSuccess => '添加成功';
	@override String get updateSuccess => '更新成功';
	@override String get deleteSuccess => '删除成功';
}

// Path: navigation
class _TranslationsNavigationZhCn implements TranslationsNavigationEn {
	_TranslationsNavigationZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get dashboard => '仪表盘';
	@override String get restaurant => '餐厅管理';
	@override String get menu => '菜单管理';
	@override String get staff => '员工管理';
	@override String get statistics => '数据统计';
	@override String get profile => '个人中心';
}

// Path: restaurant
class _TranslationsRestaurantZhCn implements TranslationsRestaurantEn {
	_TranslationsRestaurantZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '餐厅管理';
	@override String get name => '餐厅名称';
	@override String get type => '餐厅类型';
	@override String get description => '餐厅描述';
	@override String get address => '地址';
	@override String get phone => '联系电话';
	@override String get hours => '营业时间';
	@override String get status => '营业状态';
	@override String get open => '营业中';
	@override String get closed => '已打烊';
	@override String get image => '餐厅图片';
	@override String get updateInfo => '更新信息';
	@override String get updateSuccess => '更新成功';
	@override String get updateFailed => '更新失败';
}

// Path: staff
class _TranslationsStaffZhCn implements TranslationsStaffEn {
	_TranslationsStaffZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '员工管理';
	@override String get list => '员工列表';
	@override String get addStaff => '添加员工';
	@override String get editStaff => '编辑员工';
	@override String get deleteStaff => '删除员工';
	@override String get name => '姓名';
	@override String get position => '职位';
	@override String get status => '状态';
	@override String get online => '在线';
	@override String get offline => '离线';
	@override String get busy => '忙碌';
	@override String get experience => '经验';
	@override String get rating => '评分';
	@override String get schedule => '排班';
	@override String get addSchedule => '添加排班';
	@override String get editSchedule => '编辑排班';
	@override String get deleteSchedule => '删除排班';
}

// Path: statistics
class _TranslationsStatisticsZhCn implements TranslationsStatisticsEn {
	_TranslationsStatisticsZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '统计';
	@override String get overview => '概览';
	@override String get today => '今日';
	@override String get weekly => '本周';
	@override String get monthly => '本月';
	@override String get yearly => '本年';
	@override String get revenue => '营收';
	@override String get orders => '订单';
	@override String get customers => '顾客';
	@override String get rating => '评分';
	@override String get reviews => '评价';
}

// Path: validation
class _TranslationsValidationZhCn implements TranslationsValidationEn {
	_TranslationsValidationZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get required => '此字段为必填项';
	@override String get email => '请输入有效的邮箱地址';
	@override String get phone => '请输入有效的手机号码';
	@override String get minLength => '最少需要 {min} 个字符';
	@override String get maxLength => '最多只能输入 {max} 个字符';
	@override String get numeric => '请输入数字';
	@override String get positive => '请输入正数';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'auth.login' => '登录',
			'auth.logout' => '退出',
			'auth.username' => '用户名',
			'auth.password' => '密码',
			'auth.confirmPassword' => '确认密码',
			'auth.changePassword' => '修改密码',
			'auth.forgotPassword' => '忘记密码',
			'auth.loginSuccess' => '登录成功',
			'auth.loginFailed' => '登录失败',
			'auth.logoutSuccess' => '退出成功',
			'auth.invalidCredentials' => '用户名或密码错误',
			'auth.passwordMismatch' => '密码不匹配',
			'auth.passwordChanged' => '密码修改成功',
			'common.save' => '保存',
			'common.cancel' => '取消',
			'common.confirm' => '确认',
			'common.delete' => '删除',
			'common.edit' => '编辑',
			'common.add' => '添加',
			'common.search' => '搜索',
			'common.filter' => '筛选',
			'common.refresh' => '刷新',
			'common.loading' => '加载中...',
			'common.noData' => '暂无数据',
			'common.error' => '错误',
			'common.success' => '成功',
			'common.warning' => '警告',
			'common.info' => '提示',
			'common.retry' => '重试',
			'common.close' => '关闭',
			'common.ok' => '确定',
			'common.yes' => '是',
			'common.no' => '否',
			'menu.title' => '菜单管理',
			'menu.items' => '菜品列表',
			'menu.categories' => '分类管理',
			'menu.addItem' => '添加菜品',
			'menu.editItem' => '编辑菜品',
			'menu.deleteItem' => '删除菜品',
			'menu.itemName' => '菜品名称',
			'menu.description' => '菜品描述',
			'menu.price' => '价格',
			'menu.originalPrice' => '原价',
			'menu.category' => '分类',
			'menu.image' => '菜品图片',
			'menu.available' => '可售',
			'menu.unavailable' => '售罄',
			'menu.recommended' => '推荐',
			'menu.spiceLevel' => '辣度',
			'menu.preparationTime' => '制作时间',
			'menu.calories' => '卡路里',
			'menu.addSuccess' => '添加成功',
			'menu.updateSuccess' => '更新成功',
			'menu.deleteSuccess' => '删除成功',
			'navigation.dashboard' => '仪表盘',
			'navigation.restaurant' => '餐厅管理',
			'navigation.menu' => '菜单管理',
			'navigation.staff' => '员工管理',
			'navigation.statistics' => '数据统计',
			'navigation.profile' => '个人中心',
			'restaurant.title' => '餐厅管理',
			'restaurant.name' => '餐厅名称',
			'restaurant.type' => '餐厅类型',
			'restaurant.description' => '餐厅描述',
			'restaurant.address' => '地址',
			'restaurant.phone' => '联系电话',
			'restaurant.hours' => '营业时间',
			'restaurant.status' => '营业状态',
			'restaurant.open' => '营业中',
			'restaurant.closed' => '已打烊',
			'restaurant.image' => '餐厅图片',
			'restaurant.updateInfo' => '更新信息',
			'restaurant.updateSuccess' => '更新成功',
			'restaurant.updateFailed' => '更新失败',
			'staff.title' => '员工管理',
			'staff.list' => '员工列表',
			'staff.addStaff' => '添加员工',
			'staff.editStaff' => '编辑员工',
			'staff.deleteStaff' => '删除员工',
			'staff.name' => '姓名',
			'staff.position' => '职位',
			'staff.status' => '状态',
			'staff.online' => '在线',
			'staff.offline' => '离线',
			'staff.busy' => '忙碌',
			'staff.experience' => '经验',
			'staff.rating' => '评分',
			'staff.schedule' => '排班',
			'staff.addSchedule' => '添加排班',
			'staff.editSchedule' => '编辑排班',
			'staff.deleteSchedule' => '删除排班',
			'statistics.title' => '统计',
			'statistics.overview' => '概览',
			'statistics.today' => '今日',
			'statistics.weekly' => '本周',
			'statistics.monthly' => '本月',
			'statistics.yearly' => '本年',
			'statistics.revenue' => '营收',
			'statistics.orders' => '订单',
			'statistics.customers' => '顾客',
			'statistics.rating' => '评分',
			'statistics.reviews' => '评价',
			'validation.required' => '此字段为必填项',
			'validation.email' => '请输入有效的邮箱地址',
			'validation.phone' => '请输入有效的手机号码',
			'validation.minLength' => '最少需要 {min} 个字符',
			'validation.maxLength' => '最多只能输入 {max} 个字符',
			'validation.numeric' => '请输入数字',
			'validation.positive' => '请输入正数',
			_ => null,
		};
	}
}
