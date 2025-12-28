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
	@override String get settings => '设置';
	@override String get language => '语言';
	@override String get merchantPlatform => '商家管理平台';
	@override String get rememberMe => '记住我';
	@override String get forgotPasswordQuestion => '忘记密码？';
	@override String get enterUsername => '请输入用户名';
	@override String get enterPassword => '请输入密码';
	@override String get usernameMinLength => '用户名至少{min}个字符';
	@override String get passwordMinLength => '密码至少{min}个字符';
	@override String get enterUsernameAndPassword => '请输入用户名和密码';
	@override String get resetPasswordContactAdmin => '请联系管理员重置密码';
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
	@override String get loadFailed => '加载失败';
	@override String get error => '错误';
	@override String get success => '成功';
	@override String get warning => '警告';
	@override String get info => '提示';
	@override String get retry => '重试';
	@override String get close => '关闭';
	@override String get ok => '确定';
	@override String get yes => '是';
	@override String get no => '否';
	@override String get imageChanged => '图片已更改';
	@override String get clickToUploadImage => '点击上传图片';
	@override String get basicInfo => '基本信息';
	@override String get contactInfo => '联系信息';
	@override String get example => '例如：';
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
	@override String get loadingMenu => '加载菜单中...';
	@override String get noItems => '暂无菜品';
	@override String get retry => '重试';
	@override String get itemAdded => '菜品添加成功';
	@override String get itemAddFailed => '菜品添加失败';
	@override String get itemUpdated => '菜品更新成功';
	@override String get itemUpdateFailed => '菜品更新失败';
	@override String get itemEnabled => '菜品已启用';
	@override String get itemDisabled => '菜品已停售';
	@override String get itemSetAsRecommended => '菜品已设为推荐';
	@override String get itemUnsetAsRecommended => '菜品已取消推荐';
	@override String get operationFailed => '操作失败，请重试';
	@override String get confirmDelete => '确认删除';
	@override String get deleteConfirmMessage => '确定要删除菜品"{name}"吗？此操作不可恢复。';
	@override String get cancel => '取消';
	@override String get delete => '删除';
	@override String get itemDeleted => '菜品"{name}"已删除';
	@override String get deleteFailed => '删除失败，请重试';
	@override String get searchItems => '搜索菜品';
	@override String get availableItems => '可售菜品';
	@override String get unavailableItems => '售罄菜品';
	@override String get recommendedItems => '推荐菜品';
	@override String get allItems => '全部菜品';
	@override String get today => '今天';
	@override String get yesterday => '昨天';
	@override String get daysAgo => '天前';
	@override String get edit => '编辑';
	@override String get disable => '停售';
	@override String get enable => '启用';
	@override String get setAsRecommended => '设为推荐';
	@override String get unsetAsRecommended => '取消推荐';
	@override String get created => '创建: ';
	@override String get editMenuItem => '编辑菜品';
	@override String get addNewMenuItem => '添加新菜品';
	@override String get save => '保存';
	@override String get basicInfo => '基本信息';
	@override String get exampleItemName => '例如：招牌牛肉面';
	@override String get shortClearName => '简短清晰的名称（必填）';
	@override String get enterDescription => '介绍食材、口味、分量等';
	@override String get displayInDetails => '将在点餐详情页展示';
	@override String get priceSpecs => '价格与规格';
	@override String get currentPrice => '现价';
	@override String get actualPrice => '实际售价';
	@override String get showOriginalPrice => '展示划线价';
	@override String get prepTime => '制作时间';
	@override String get minutes => '分钟';
	@override String get estimatedTime => '预估耗时';
	@override String get caloriesLabel => '热量';
	@override String get kcal => 'Kcal';
	@override String get imageSettings => '图片与设置';
	@override String get itemImage => '菜品图片';
	@override String get uploadClearPhoto => '上传清晰的菜品照片，有助于提升销量';
	@override String get clickToChangeImage => '点击更换图片';
	@override String get clickToUploadImage => '点击上传图片';
	@override String get supportAlbumCamera => '支持相册选择或拍照';
	@override String get imageLoadFailed => '图片无法加载';
	@override String get onSale => '上架销售';
	@override String get hideFromCustomers => '关闭后顾客端将不可见';
	@override String get managerRecommended => '店长推荐';
	@override String get displayInRecommendations => '在推荐栏目优先展示';
	@override String get sortOrder => '排序权重';
	@override String get numberGreaterMoreTop => '数字越大越靠前';
	@override String get fillNamePriceCategory => '请填写名称、价格并选择分类';
	@override String get validationFailed => '数据验证失败';
	@override String get selectFromAlbum => '从相册选择';
	@override String get takePhoto => '拍照';
	@override String get selectCategory => '选择分类';
	@override String get loadingCategories => '正在加载分类...';
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
	@override String get chat => '聊天室';
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
	@override String get editTitle => '编辑餐厅信息';
	@override String get save => '保存';
	@override String get cancel => '取消';
	@override String get reset => '重置';
	@override String get edit => '编辑';
	@override String get selectImage => '选择图片';
	@override String get takePhoto => '拍照';
	@override String get chooseFromGallery => '从相册选择';
	@override String get removeImage => '移除图片';
	@override String get openTime => '开始时间';
	@override String get closeTime => '结束时间';
	@override String get customType => '自定义类型';
	@override String get pleaseSelect => '请选择';
	@override String get pleaseEnter => '请输入';
	@override String get required => '必填';
	@override String get saving => '保存中...';
	@override String get editSuccess => '餐厅信息更新成功';
	@override String get editFailed => '餐厅信息更新失败';
	@override String get imageUploadSuccess => '图片上传成功';
	@override String get imageUploadFailed => '图片上传失败';
	@override String get confirmDiscard => '确定要放弃修改吗？';
	@override String get discard => '放弃';
	@override String get keepEditing => '继续编辑';
	@override String get infoTitle => '餐厅信息';
	@override String get loading => '加载餐厅信息中...';
	@override String get noData => '暂无餐厅信息';
	@override String get retry => '重试';
	@override String get basicInfo => '基本信息';
	@override String get restaurantType => '餐厅类型';
	@override String get restaurantAddress => '地址';
	@override String get restaurantPhone => '联系电话';
	@override String get businessHours => '营业时间';
	@override String get operatingStatus => '营业状态';
	@override String get restaurantImage => '餐厅图片';
	@override String get restaurantDescription => '餐厅描述';
	@override String get reviewInfo => '评价信息';
	@override String get rating => '评分';
	@override String get reviewCount => '评价数';
	@override String get chatRoomVerificationCode => '聊天室验证码';
	@override String get currentCode => '当前验证码';
	@override String get loadingCode => '加载中...';
	@override String get modify => '修改';
	@override String get editInfo => '编辑信息';
	@override String get setClosed => '设置打烊';
	@override String get setOpen => '设置营业';
	@override String get settings => '设置';
	@override String get editVerificationCode => '修改聊天室验证码';
	@override String get newCode => '新验证码';
	@override String get enterNewCode => '请输入新的聊天室验证码';
	@override String get enterCode => '请输入验证码';
	@override String get codeMinLength => '验证码长度不能少于{min}位';
	@override String get codeUpdateSuccess => '验证码更新成功';
	@override String get codeUpdateFailed => '验证码更新失败';
	@override String get setOpenSuccess => '已设置营业';
	@override String get setClosedSuccess => '已设置打烊';
	@override String get statusToggleFailed => '状态切换失败';
	@override String get selectImageFailed => '选择图片失败';
	@override String get takePhotoFailed => '拍照失败';
	@override String get uploadingImage => '图片上传中...';
	@override String get uploadImageInProgress => '正在上传图片...';
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
	@override String get experience => '工作经验';
	@override String get rating => '评分';
	@override String get schedule => '排班';
	@override String get addSchedule => '添加排班';
	@override String get editSchedule => '编辑排班';
	@override String get deleteSchedule => '删除排班';
	@override String get loadingStaffList => '加载员工列表中...';
	@override String get totalStaff => '总员工';
	@override String get onlineStaff => '在线';
	@override String get offlineStaff => '离线';
	@override String get busyStaff => '忙碌';
	@override String get setAsOffline => '设为离线';
	@override String get setAsOnline => '设为在线';
	@override String get updateRating => '更新评分';
	@override String get confirmOperation => '确认操作';
	@override String confirmStatusChange({required Object staffName, required Object newStatus}) => '确定要将 ${staffName} 的状态设置为 ${newStatus} 吗？';
	@override String get cancel => '取消';
	@override String get confirm => '确定';
	@override String get updateRatingTitle => '更新评分';
	@override String setNewRating({required Object staffName}) => '为 ${staffName} 设置新评分：';
	@override String get ratingInputHint => '评分 (0.0-5.0)';
	@override String get validRatingRequired => '请输入有效的评分 (0.0-5.0)';
	@override String get noStaffInfo => '暂无员工信息';
	@override String get retry => '重试';
	@override String get unknownStatus => '未知状态';
	@override String get unknown => '未知';
	@override String get statusOnline => '在线';
	@override String get statusOffline => '离线';
	@override String get statusBusy => '忙碌';
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
			'auth.settings' => '设置',
			'auth.language' => '语言',
			'auth.merchantPlatform' => '商家管理平台',
			'auth.rememberMe' => '记住我',
			'auth.forgotPasswordQuestion' => '忘记密码？',
			'auth.enterUsername' => '请输入用户名',
			'auth.enterPassword' => '请输入密码',
			'auth.usernameMinLength' => '用户名至少{min}个字符',
			'auth.passwordMinLength' => '密码至少{min}个字符',
			'auth.enterUsernameAndPassword' => '请输入用户名和密码',
			'auth.resetPasswordContactAdmin' => '请联系管理员重置密码',
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
			'common.loadFailed' => '加载失败',
			'common.error' => '错误',
			'common.success' => '成功',
			'common.warning' => '警告',
			'common.info' => '提示',
			'common.retry' => '重试',
			'common.close' => '关闭',
			'common.ok' => '确定',
			'common.yes' => '是',
			'common.no' => '否',
			'common.imageChanged' => '图片已更改',
			'common.clickToUploadImage' => '点击上传图片',
			'common.basicInfo' => '基本信息',
			'common.contactInfo' => '联系信息',
			'common.example' => '例如：',
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
			'menu.loadingMenu' => '加载菜单中...',
			'menu.noItems' => '暂无菜品',
			'menu.retry' => '重试',
			'menu.itemAdded' => '菜品添加成功',
			'menu.itemAddFailed' => '菜品添加失败',
			'menu.itemUpdated' => '菜品更新成功',
			'menu.itemUpdateFailed' => '菜品更新失败',
			'menu.itemEnabled' => '菜品已启用',
			'menu.itemDisabled' => '菜品已停售',
			'menu.itemSetAsRecommended' => '菜品已设为推荐',
			'menu.itemUnsetAsRecommended' => '菜品已取消推荐',
			'menu.operationFailed' => '操作失败，请重试',
			'menu.confirmDelete' => '确认删除',
			'menu.deleteConfirmMessage' => '确定要删除菜品"{name}"吗？此操作不可恢复。',
			'menu.cancel' => '取消',
			'menu.delete' => '删除',
			'menu.itemDeleted' => '菜品"{name}"已删除',
			'menu.deleteFailed' => '删除失败，请重试',
			'menu.searchItems' => '搜索菜品',
			'menu.availableItems' => '可售菜品',
			'menu.unavailableItems' => '售罄菜品',
			'menu.recommendedItems' => '推荐菜品',
			'menu.allItems' => '全部菜品',
			'menu.today' => '今天',
			'menu.yesterday' => '昨天',
			'menu.daysAgo' => '天前',
			'menu.edit' => '编辑',
			'menu.disable' => '停售',
			'menu.enable' => '启用',
			'menu.setAsRecommended' => '设为推荐',
			'menu.unsetAsRecommended' => '取消推荐',
			'menu.created' => '创建: ',
			'menu.editMenuItem' => '编辑菜品',
			'menu.addNewMenuItem' => '添加新菜品',
			'menu.save' => '保存',
			'menu.basicInfo' => '基本信息',
			'menu.exampleItemName' => '例如：招牌牛肉面',
			'menu.shortClearName' => '简短清晰的名称（必填）',
			'menu.enterDescription' => '介绍食材、口味、分量等',
			'menu.displayInDetails' => '将在点餐详情页展示',
			'menu.priceSpecs' => '价格与规格',
			'menu.currentPrice' => '现价',
			'menu.actualPrice' => '实际售价',
			'menu.showOriginalPrice' => '展示划线价',
			'menu.prepTime' => '制作时间',
			'menu.minutes' => '分钟',
			'menu.estimatedTime' => '预估耗时',
			'menu.caloriesLabel' => '热量',
			'menu.kcal' => 'Kcal',
			'menu.imageSettings' => '图片与设置',
			'menu.itemImage' => '菜品图片',
			'menu.uploadClearPhoto' => '上传清晰的菜品照片，有助于提升销量',
			'menu.clickToChangeImage' => '点击更换图片',
			'menu.clickToUploadImage' => '点击上传图片',
			'menu.supportAlbumCamera' => '支持相册选择或拍照',
			'menu.imageLoadFailed' => '图片无法加载',
			'menu.onSale' => '上架销售',
			'menu.hideFromCustomers' => '关闭后顾客端将不可见',
			'menu.managerRecommended' => '店长推荐',
			'menu.displayInRecommendations' => '在推荐栏目优先展示',
			'menu.sortOrder' => '排序权重',
			'menu.numberGreaterMoreTop' => '数字越大越靠前',
			'menu.fillNamePriceCategory' => '请填写名称、价格并选择分类',
			'menu.validationFailed' => '数据验证失败',
			'menu.selectFromAlbum' => '从相册选择',
			'menu.takePhoto' => '拍照',
			'menu.selectCategory' => '选择分类',
			'menu.loadingCategories' => '正在加载分类...',
			'navigation.dashboard' => '仪表盘',
			'navigation.restaurant' => '餐厅管理',
			'navigation.menu' => '菜单管理',
			'navigation.staff' => '员工管理',
			'navigation.statistics' => '数据统计',
			'navigation.profile' => '个人中心',
			'navigation.chat' => '聊天室',
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
			'restaurant.editTitle' => '编辑餐厅信息',
			'restaurant.save' => '保存',
			'restaurant.cancel' => '取消',
			'restaurant.reset' => '重置',
			'restaurant.edit' => '编辑',
			'restaurant.selectImage' => '选择图片',
			'restaurant.takePhoto' => '拍照',
			'restaurant.chooseFromGallery' => '从相册选择',
			'restaurant.removeImage' => '移除图片',
			'restaurant.openTime' => '开始时间',
			'restaurant.closeTime' => '结束时间',
			'restaurant.customType' => '自定义类型',
			'restaurant.pleaseSelect' => '请选择',
			'restaurant.pleaseEnter' => '请输入',
			'restaurant.required' => '必填',
			'restaurant.saving' => '保存中...',
			'restaurant.editSuccess' => '餐厅信息更新成功',
			'restaurant.editFailed' => '餐厅信息更新失败',
			'restaurant.imageUploadSuccess' => '图片上传成功',
			'restaurant.imageUploadFailed' => '图片上传失败',
			'restaurant.confirmDiscard' => '确定要放弃修改吗？',
			'restaurant.discard' => '放弃',
			'restaurant.keepEditing' => '继续编辑',
			'restaurant.infoTitle' => '餐厅信息',
			'restaurant.loading' => '加载餐厅信息中...',
			'restaurant.noData' => '暂无餐厅信息',
			'restaurant.retry' => '重试',
			'restaurant.basicInfo' => '基本信息',
			'restaurant.restaurantType' => '餐厅类型',
			'restaurant.restaurantAddress' => '地址',
			'restaurant.restaurantPhone' => '联系电话',
			'restaurant.businessHours' => '营业时间',
			'restaurant.operatingStatus' => '营业状态',
			'restaurant.restaurantImage' => '餐厅图片',
			'restaurant.restaurantDescription' => '餐厅描述',
			'restaurant.reviewInfo' => '评价信息',
			'restaurant.rating' => '评分',
			'restaurant.reviewCount' => '评价数',
			'restaurant.chatRoomVerificationCode' => '聊天室验证码',
			'restaurant.currentCode' => '当前验证码',
			'restaurant.loadingCode' => '加载中...',
			'restaurant.modify' => '修改',
			'restaurant.editInfo' => '编辑信息',
			'restaurant.setClosed' => '设置打烊',
			'restaurant.setOpen' => '设置营业',
			'restaurant.settings' => '设置',
			'restaurant.editVerificationCode' => '修改聊天室验证码',
			'restaurant.newCode' => '新验证码',
			'restaurant.enterNewCode' => '请输入新的聊天室验证码',
			'restaurant.enterCode' => '请输入验证码',
			'restaurant.codeMinLength' => '验证码长度不能少于{min}位',
			'restaurant.codeUpdateSuccess' => '验证码更新成功',
			'restaurant.codeUpdateFailed' => '验证码更新失败',
			'restaurant.setOpenSuccess' => '已设置营业',
			'restaurant.setClosedSuccess' => '已设置打烊',
			'restaurant.statusToggleFailed' => '状态切换失败',
			'restaurant.selectImageFailed' => '选择图片失败',
			'restaurant.takePhotoFailed' => '拍照失败',
			'restaurant.uploadingImage' => '图片上传中...',
			'restaurant.uploadImageInProgress' => '正在上传图片...',
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
			'staff.experience' => '工作经验',
			'staff.rating' => '评分',
			'staff.schedule' => '排班',
			'staff.addSchedule' => '添加排班',
			'staff.editSchedule' => '编辑排班',
			'staff.deleteSchedule' => '删除排班',
			'staff.loadingStaffList' => '加载员工列表中...',
			'staff.totalStaff' => '总员工',
			'staff.onlineStaff' => '在线',
			'staff.offlineStaff' => '离线',
			'staff.busyStaff' => '忙碌',
			'staff.setAsOffline' => '设为离线',
			'staff.setAsOnline' => '设为在线',
			'staff.updateRating' => '更新评分',
			'staff.confirmOperation' => '确认操作',
			'staff.confirmStatusChange' => ({required Object staffName, required Object newStatus}) => '确定要将 ${staffName} 的状态设置为 ${newStatus} 吗？',
			'staff.cancel' => '取消',
			'staff.confirm' => '确定',
			'staff.updateRatingTitle' => '更新评分',
			'staff.setNewRating' => ({required Object staffName}) => '为 ${staffName} 设置新评分：',
			'staff.ratingInputHint' => '评分 (0.0-5.0)',
			'staff.validRatingRequired' => '请输入有效的评分 (0.0-5.0)',
			'staff.noStaffInfo' => '暂无员工信息',
			'staff.retry' => '重试',
			'staff.unknownStatus' => '未知状态',
			'staff.unknown' => '未知',
			'staff.statusOnline' => '在线',
			'staff.statusOffline' => '离线',
			'staff.statusBusy' => '忙碌',
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
