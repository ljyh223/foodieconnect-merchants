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
class TranslationsZhTw with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhTw _root = this; // ignore: unused_field

	@override 
	TranslationsZhTw $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhTw(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAuthZhTw auth = _TranslationsAuthZhTw._(_root);
	@override late final _TranslationsCommonZhTw common = _TranslationsCommonZhTw._(_root);
	@override late final _TranslationsMenuZhTw menu = _TranslationsMenuZhTw._(_root);
	@override late final _TranslationsNavigationZhTw navigation = _TranslationsNavigationZhTw._(_root);
	@override late final _TranslationsRestaurantZhTw restaurant = _TranslationsRestaurantZhTw._(_root);
	@override late final _TranslationsStaffZhTw staff = _TranslationsStaffZhTw._(_root);
	@override late final _TranslationsStatisticsZhTw statistics = _TranslationsStatisticsZhTw._(_root);
	@override late final _TranslationsValidationZhTw validation = _TranslationsValidationZhTw._(_root);
}

// Path: auth
class _TranslationsAuthZhTw implements TranslationsAuthEn {
	_TranslationsAuthZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get login => '登錄';
	@override String get logout => '退出';
	@override String get username => '用戶名';
	@override String get password => '密碼';
	@override String get confirmPassword => '確認密碼';
	@override String get changePassword => '修改密碼';
	@override String get forgotPassword => '忘記密碼';
	@override String get loginSuccess => '登錄成功';
	@override String get loginFailed => '登錄失敗';
	@override String get logoutSuccess => '退出成功';
	@override String get invalidCredentials => '用戶名或密碼錯誤';
	@override String get passwordMismatch => '密碼不匹配';
	@override String get passwordChanged => '密碼修改成功';
	@override String get settings => '設置';
	@override String get language => '語言';
	@override String get merchantPlatform => '商家管理平台';
	@override String get rememberMe => '記住我';
	@override String get forgotPasswordQuestion => '忘記密碼？';
	@override String get enterUsername => '請輸入用戶名';
	@override String get enterPassword => '請輸入密碼';
	@override String get usernameMinLength => '用戶名至少{min}個字符';
	@override String get passwordMinLength => '密碼至少{min}個字符';
	@override String get enterUsernameAndPassword => '請輸入用戶名和密碼';
	@override String get resetPasswordContactAdmin => '請聯繫管理員重置密碼';
}

// Path: common
class _TranslationsCommonZhTw implements TranslationsCommonEn {
	_TranslationsCommonZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get save => '保存';
	@override String get cancel => '取消';
	@override String get confirm => '確認';
	@override String get delete => '刪除';
	@override String get edit => '編輯';
	@override String get add => '添加';
	@override String get search => '搜索';
	@override String get filter => '篩選';
	@override String get refresh => '刷新';
	@override String get loading => '加載中...';
	@override String get noData => '暫無數據';
	@override String get loadFailed => '加載失敗';
	@override String get error => '錯誤';
	@override String get success => '成功';
	@override String get warning => '警告';
	@override String get info => '提示';
	@override String get retry => '重試';
	@override String get close => '關閉';
	@override String get ok => '確定';
	@override String get yes => '是';
	@override String get no => '否';
	@override String get imageChanged => '圖片已更改';
	@override String get clickToUploadImage => '點擊上傳圖片';
	@override String get basicInfo => '基本資訊';
	@override String get contactInfo => '聯繫資訊';
	@override String get example => '例如：';
}

// Path: menu
class _TranslationsMenuZhTw implements TranslationsMenuEn {
	_TranslationsMenuZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '菜單管理';
	@override String get items => '菜品列表';
	@override String get categories => '分類管理';
	@override String get addItem => '添加菜品';
	@override String get editItem => '編輯菜品';
	@override String get deleteItem => '刪除菜品';
	@override String get itemName => '菜品名稱';
	@override String get description => '菜品描述';
	@override String get price => '價格';
	@override String get originalPrice => '原價';
	@override String get category => '分類';
	@override String get image => '菜品圖片';
	@override String get available => '可售';
	@override String get unavailable => '售罄';
	@override String get recommended => '推薦';
	@override String get spiceLevel => '辣度';
	@override String get preparationTime => '製作時間';
	@override String get calories => '卡路里';
	@override String get addSuccess => '添加成功';
	@override String get updateSuccess => '更新成功';
	@override String get deleteSuccess => '刪除成功';
	@override String get loadingMenu => '加載菜單中...';
	@override String get noItems => '暫無菜品';
	@override String get retry => '重試';
	@override String get itemAdded => '菜品添加成功';
	@override String get itemAddFailed => '菜品添加失敗';
	@override String get itemUpdated => '菜品更新成功';
	@override String get itemUpdateFailed => '菜品更新失敗';
	@override String get itemEnabled => '菜品已啟用';
	@override String get itemDisabled => '菜品已停售';
	@override String get itemSetAsRecommended => '菜品已設為推薦';
	@override String get itemUnsetAsRecommended => '菜品已取消推薦';
	@override String get operationFailed => '操作失敗，請重試';
	@override String get confirmDelete => '確認刪除';
	@override String get deleteConfirmMessage => '確定要刪除菜品"{name}"嗎？此操作不可恢復。';
	@override String get cancel => '取消';
	@override String get delete => '刪除';
	@override String get itemDeleted => '菜品"{name}"已刪除';
	@override String get deleteFailed => '刪除失敗，請重試';
	@override String get searchItems => '搜索菜品';
	@override String get availableItems => '可售菜品';
	@override String get unavailableItems => '售罄菜品';
	@override String get recommendedItems => '推薦菜品';
	@override String get allItems => '全部菜品';
	@override String get today => '今天';
	@override String get yesterday => '昨天';
	@override String get daysAgo => '天前';
	@override String get edit => '編輯';
	@override String get disable => '停售';
	@override String get enable => '啟用';
	@override String get setAsRecommended => '設為推薦';
	@override String get unsetAsRecommended => '取消推薦';
	@override String get created => '創建: ';
	@override String get editMenuItem => '編輯菜品';
	@override String get addNewMenuItem => '添加新菜品';
	@override String get save => '保存';
	@override String get basicInfo => '基本信息';
	@override String get exampleItemName => '例如：招牌牛肉麵';
	@override String get shortClearName => '簡短清晰的名稱（必填）';
	@override String get enterDescription => '介紹食材、口味、分量等';
	@override String get displayInDetails => '將在點餐詳情頁展示';
	@override String get priceSpecs => '價格與規格';
	@override String get currentPrice => '現價';
	@override String get actualPrice => '實際售價';
	@override String get showOriginalPrice => '展示劃線價';
	@override String get prepTime => '製作時間';
	@override String get minutes => '分鐘';
	@override String get estimatedTime => '預估耗時';
	@override String get caloriesLabel => '熱量';
	@override String get kcal => 'Kcal';
	@override String get imageSettings => '圖片與設置';
	@override String get itemImage => '菜品圖片';
	@override String get uploadClearPhoto => '上傳清晰的菜品照片，有助於提升銷量';
	@override String get clickToChangeImage => '點擊更換圖片';
	@override String get clickToUploadImage => '點擊上傳圖片';
	@override String get supportAlbumCamera => '支持相冊選擇或拍照';
	@override String get imageLoadFailed => '圖片無法加載';
	@override String get onSale => '上架銷售';
	@override String get hideFromCustomers => '關閉後顧客端將不可見';
	@override String get managerRecommended => '店長推薦';
	@override String get displayInRecommendations => '在推薦欄目優先展示';
	@override String get sortOrder => '排序權重';
	@override String get numberGreaterMoreTop => '數字越大越靠前';
	@override String get fillNamePriceCategory => '請填寫名稱、價格並選擇分類';
	@override String get validationFailed => '數據驗證失敗';
	@override String get selectFromAlbum => '從相冊選擇';
	@override String get takePhoto => '拍照';
	@override String get selectCategory => '選擇分類';
	@override String get loadingCategories => '正在加載分類...';
}

// Path: navigation
class _TranslationsNavigationZhTw implements TranslationsNavigationEn {
	_TranslationsNavigationZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get dashboard => '儀表板';
	@override String get restaurant => '餐廳管理';
	@override String get menu => '菜單管理';
	@override String get staff => '員工管理';
	@override String get statistics => '數據統計';
	@override String get profile => '個人中心';
}

// Path: restaurant
class _TranslationsRestaurantZhTw implements TranslationsRestaurantEn {
	_TranslationsRestaurantZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '餐廳管理';
	@override String get name => '餐廳名稱';
	@override String get type => '餐廳類型';
	@override String get description => '餐廳描述';
	@override String get address => '地址';
	@override String get phone => '聯繫電話';
	@override String get hours => '營業時間';
	@override String get status => '營業狀態';
	@override String get open => '營業中';
	@override String get closed => '已打烊';
	@override String get image => '餐廳圖片';
	@override String get updateInfo => '更新資訊';
	@override String get updateSuccess => '更新成功';
	@override String get updateFailed => '更新失敗';
	@override String get editTitle => '編輯餐廳資訊';
	@override String get save => '保存';
	@override String get cancel => '取消';
	@override String get reset => '重置';
	@override String get edit => '編輯';
	@override String get selectImage => '選擇圖片';
	@override String get takePhoto => '拍照';
	@override String get chooseFromGallery => '從相冊選擇';
	@override String get removeImage => '移除圖片';
	@override String get openTime => '開始時間';
	@override String get closeTime => '結束時間';
	@override String get customType => '自訂類型';
	@override String get pleaseSelect => '請選擇';
	@override String get pleaseEnter => '請輸入';
	@override String get required => '必填';
	@override String get saving => '保存中...';
	@override String get editSuccess => '餐廳資訊更新成功';
	@override String get editFailed => '餐廳資訊更新失敗';
	@override String get imageUploadSuccess => '圖片上傳成功';
	@override String get imageUploadFailed => '圖片上傳失敗';
	@override String get confirmDiscard => '確定要放棄修改嗎？';
	@override String get discard => '放棄';
	@override String get keepEditing => '繼續編輯';
	@override String get infoTitle => '餐廳資訊';
	@override String get loading => '加載餐廳資訊中...';
	@override String get noData => '暫無餐廳資訊';
	@override String get retry => '重試';
	@override String get basicInfo => '基本資訊';
	@override String get restaurantType => '餐廳類型';
	@override String get restaurantAddress => '地址';
	@override String get restaurantPhone => '聯繫電話';
	@override String get businessHours => '營業時間';
	@override String get operatingStatus => '營業狀態';
	@override String get restaurantImage => '餐廳圖片';
	@override String get restaurantDescription => '餐廳描述';
	@override String get reviewInfo => '評價資訊';
	@override String get rating => '評分';
	@override String get reviewCount => '評價數';
	@override String get chatRoomVerificationCode => '聊天室驗證碼';
	@override String get currentCode => '當前驗證碼';
	@override String get loadingCode => '加載中...';
	@override String get modify => '修改';
	@override String get editInfo => '編輯資訊';
	@override String get setClosed => '設置打烊';
	@override String get setOpen => '設置營業';
	@override String get settings => '設置';
	@override String get editVerificationCode => '修改聊天室驗證碼';
	@override String get newCode => '新驗證碼';
	@override String get enterNewCode => '請輸入新的聊天室驗證碼';
	@override String get enterCode => '請輸入驗證碼';
	@override String get codeMinLength => '驗證碼長度不能少於{min}位';
	@override String get codeUpdateSuccess => '驗證碼更新成功';
	@override String get codeUpdateFailed => '驗證碼更新失敗';
	@override String get setOpenSuccess => '已設置營業';
	@override String get setClosedSuccess => '已設置打烊';
	@override String get statusToggleFailed => '狀態切換失敗';
	@override String get selectImageFailed => '選擇圖片失敗';
	@override String get takePhotoFailed => '拍照失敗';
	@override String get uploadingImage => '圖片上傳中...';
	@override String get uploadImageInProgress => '正在上傳圖片...';
}

// Path: staff
class _TranslationsStaffZhTw implements TranslationsStaffEn {
	_TranslationsStaffZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '員工管理';
	@override String get list => '員工列表';
	@override String get addStaff => '添加員工';
	@override String get editStaff => '編輯員工';
	@override String get deleteStaff => '刪除員工';
	@override String get name => '姓名';
	@override String get position => '職位';
	@override String get status => '狀態';
	@override String get online => '在線';
	@override String get offline => '離線';
	@override String get busy => '忙碌';
	@override String get experience => '經驗';
	@override String get rating => '評分';
	@override String get schedule => '排班';
	@override String get addSchedule => '添加排班';
	@override String get editSchedule => '編輯排班';
	@override String get deleteSchedule => '刪除排班';
	@override String get loadingStaffList => '加載員工列表中...';
	@override String get totalStaff => '總員工';
	@override String get onlineStaff => '在線';
	@override String get offlineStaff => '離線';
	@override String get busyStaff => '忙碌';
	@override String get setAsOffline => '設為離線';
	@override String get setAsOnline => '設為在線';
	@override String get updateRating => '更新評分';
	@override String get confirmOperation => '確認操作';
	@override String confirmStatusChange({required Object staffName, required Object newStatus}) => '確定要將 ${staffName} 的狀態設置為 ${newStatus} 嗎？';
	@override String get cancel => '取消';
	@override String get confirm => '確定';
	@override String get updateRatingTitle => '更新評分';
	@override String setNewRating({required Object staffName}) => '為 ${staffName} 設置新評分：';
	@override String get ratingInputHint => '評分 (0.0-5.0)';
	@override String get validRatingRequired => '請輸入有效的評分 (0.0-5.0)';
	@override String get noStaffInfo => '暫無員工信息';
	@override String get retry => '重試';
	@override String get unknownStatus => '未知狀態';
	@override String get unknown => '未知';
	@override String get statusOnline => '在線';
	@override String get statusOffline => '離線';
	@override String get statusBusy => '忙碌';
}

// Path: statistics
class _TranslationsStatisticsZhTw implements TranslationsStatisticsEn {
	_TranslationsStatisticsZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '統計';
	@override String get overview => '概覽';
	@override String get today => '今日';
	@override String get weekly => '本周';
	@override String get monthly => '本月';
	@override String get yearly => '本年';
	@override String get revenue => '營收';
	@override String get orders => '訂單';
	@override String get customers => '顧客';
	@override String get rating => '評分';
	@override String get reviews => '評價';
}

// Path: validation
class _TranslationsValidationZhTw implements TranslationsValidationEn {
	_TranslationsValidationZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get required => '此字段為必填項';
	@override String get email => '請輸入有效的郵箱地址';
	@override String get phone => '請輸入有效的手機號碼';
	@override String get minLength => '最少需要 {min} 個字符';
	@override String get maxLength => '最多只能輸入 {max} 個字符';
	@override String get numeric => '請輸入數字';
	@override String get positive => '請輸入正數';
}

/// The flat map containing all translations for locale <zh-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhTw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'auth.login' => '登錄',
			'auth.logout' => '退出',
			'auth.username' => '用戶名',
			'auth.password' => '密碼',
			'auth.confirmPassword' => '確認密碼',
			'auth.changePassword' => '修改密碼',
			'auth.forgotPassword' => '忘記密碼',
			'auth.loginSuccess' => '登錄成功',
			'auth.loginFailed' => '登錄失敗',
			'auth.logoutSuccess' => '退出成功',
			'auth.invalidCredentials' => '用戶名或密碼錯誤',
			'auth.passwordMismatch' => '密碼不匹配',
			'auth.passwordChanged' => '密碼修改成功',
			'auth.settings' => '設置',
			'auth.language' => '語言',
			'auth.merchantPlatform' => '商家管理平台',
			'auth.rememberMe' => '記住我',
			'auth.forgotPasswordQuestion' => '忘記密碼？',
			'auth.enterUsername' => '請輸入用戶名',
			'auth.enterPassword' => '請輸入密碼',
			'auth.usernameMinLength' => '用戶名至少{min}個字符',
			'auth.passwordMinLength' => '密碼至少{min}個字符',
			'auth.enterUsernameAndPassword' => '請輸入用戶名和密碼',
			'auth.resetPasswordContactAdmin' => '請聯繫管理員重置密碼',
			'common.save' => '保存',
			'common.cancel' => '取消',
			'common.confirm' => '確認',
			'common.delete' => '刪除',
			'common.edit' => '編輯',
			'common.add' => '添加',
			'common.search' => '搜索',
			'common.filter' => '篩選',
			'common.refresh' => '刷新',
			'common.loading' => '加載中...',
			'common.noData' => '暫無數據',
			'common.loadFailed' => '加載失敗',
			'common.error' => '錯誤',
			'common.success' => '成功',
			'common.warning' => '警告',
			'common.info' => '提示',
			'common.retry' => '重試',
			'common.close' => '關閉',
			'common.ok' => '確定',
			'common.yes' => '是',
			'common.no' => '否',
			'common.imageChanged' => '圖片已更改',
			'common.clickToUploadImage' => '點擊上傳圖片',
			'common.basicInfo' => '基本資訊',
			'common.contactInfo' => '聯繫資訊',
			'common.example' => '例如：',
			'menu.title' => '菜單管理',
			'menu.items' => '菜品列表',
			'menu.categories' => '分類管理',
			'menu.addItem' => '添加菜品',
			'menu.editItem' => '編輯菜品',
			'menu.deleteItem' => '刪除菜品',
			'menu.itemName' => '菜品名稱',
			'menu.description' => '菜品描述',
			'menu.price' => '價格',
			'menu.originalPrice' => '原價',
			'menu.category' => '分類',
			'menu.image' => '菜品圖片',
			'menu.available' => '可售',
			'menu.unavailable' => '售罄',
			'menu.recommended' => '推薦',
			'menu.spiceLevel' => '辣度',
			'menu.preparationTime' => '製作時間',
			'menu.calories' => '卡路里',
			'menu.addSuccess' => '添加成功',
			'menu.updateSuccess' => '更新成功',
			'menu.deleteSuccess' => '刪除成功',
			'menu.loadingMenu' => '加載菜單中...',
			'menu.noItems' => '暫無菜品',
			'menu.retry' => '重試',
			'menu.itemAdded' => '菜品添加成功',
			'menu.itemAddFailed' => '菜品添加失敗',
			'menu.itemUpdated' => '菜品更新成功',
			'menu.itemUpdateFailed' => '菜品更新失敗',
			'menu.itemEnabled' => '菜品已啟用',
			'menu.itemDisabled' => '菜品已停售',
			'menu.itemSetAsRecommended' => '菜品已設為推薦',
			'menu.itemUnsetAsRecommended' => '菜品已取消推薦',
			'menu.operationFailed' => '操作失敗，請重試',
			'menu.confirmDelete' => '確認刪除',
			'menu.deleteConfirmMessage' => '確定要刪除菜品"{name}"嗎？此操作不可恢復。',
			'menu.cancel' => '取消',
			'menu.delete' => '刪除',
			'menu.itemDeleted' => '菜品"{name}"已刪除',
			'menu.deleteFailed' => '刪除失敗，請重試',
			'menu.searchItems' => '搜索菜品',
			'menu.availableItems' => '可售菜品',
			'menu.unavailableItems' => '售罄菜品',
			'menu.recommendedItems' => '推薦菜品',
			'menu.allItems' => '全部菜品',
			'menu.today' => '今天',
			'menu.yesterday' => '昨天',
			'menu.daysAgo' => '天前',
			'menu.edit' => '編輯',
			'menu.disable' => '停售',
			'menu.enable' => '啟用',
			'menu.setAsRecommended' => '設為推薦',
			'menu.unsetAsRecommended' => '取消推薦',
			'menu.created' => '創建: ',
			'menu.editMenuItem' => '編輯菜品',
			'menu.addNewMenuItem' => '添加新菜品',
			'menu.save' => '保存',
			'menu.basicInfo' => '基本信息',
			'menu.exampleItemName' => '例如：招牌牛肉麵',
			'menu.shortClearName' => '簡短清晰的名稱（必填）',
			'menu.enterDescription' => '介紹食材、口味、分量等',
			'menu.displayInDetails' => '將在點餐詳情頁展示',
			'menu.priceSpecs' => '價格與規格',
			'menu.currentPrice' => '現價',
			'menu.actualPrice' => '實際售價',
			'menu.showOriginalPrice' => '展示劃線價',
			'menu.prepTime' => '製作時間',
			'menu.minutes' => '分鐘',
			'menu.estimatedTime' => '預估耗時',
			'menu.caloriesLabel' => '熱量',
			'menu.kcal' => 'Kcal',
			'menu.imageSettings' => '圖片與設置',
			'menu.itemImage' => '菜品圖片',
			'menu.uploadClearPhoto' => '上傳清晰的菜品照片，有助於提升銷量',
			'menu.clickToChangeImage' => '點擊更換圖片',
			'menu.clickToUploadImage' => '點擊上傳圖片',
			'menu.supportAlbumCamera' => '支持相冊選擇或拍照',
			'menu.imageLoadFailed' => '圖片無法加載',
			'menu.onSale' => '上架銷售',
			'menu.hideFromCustomers' => '關閉後顧客端將不可見',
			'menu.managerRecommended' => '店長推薦',
			'menu.displayInRecommendations' => '在推薦欄目優先展示',
			'menu.sortOrder' => '排序權重',
			'menu.numberGreaterMoreTop' => '數字越大越靠前',
			'menu.fillNamePriceCategory' => '請填寫名稱、價格並選擇分類',
			'menu.validationFailed' => '數據驗證失敗',
			'menu.selectFromAlbum' => '從相冊選擇',
			'menu.takePhoto' => '拍照',
			'menu.selectCategory' => '選擇分類',
			'menu.loadingCategories' => '正在加載分類...',
			'navigation.dashboard' => '儀表板',
			'navigation.restaurant' => '餐廳管理',
			'navigation.menu' => '菜單管理',
			'navigation.staff' => '員工管理',
			'navigation.statistics' => '數據統計',
			'navigation.profile' => '個人中心',
			'restaurant.title' => '餐廳管理',
			'restaurant.name' => '餐廳名稱',
			'restaurant.type' => '餐廳類型',
			'restaurant.description' => '餐廳描述',
			'restaurant.address' => '地址',
			'restaurant.phone' => '聯繫電話',
			'restaurant.hours' => '營業時間',
			'restaurant.status' => '營業狀態',
			'restaurant.open' => '營業中',
			'restaurant.closed' => '已打烊',
			'restaurant.image' => '餐廳圖片',
			'restaurant.updateInfo' => '更新資訊',
			'restaurant.updateSuccess' => '更新成功',
			'restaurant.updateFailed' => '更新失敗',
			'restaurant.editTitle' => '編輯餐廳資訊',
			'restaurant.save' => '保存',
			'restaurant.cancel' => '取消',
			'restaurant.reset' => '重置',
			'restaurant.edit' => '編輯',
			'restaurant.selectImage' => '選擇圖片',
			'restaurant.takePhoto' => '拍照',
			'restaurant.chooseFromGallery' => '從相冊選擇',
			'restaurant.removeImage' => '移除圖片',
			'restaurant.openTime' => '開始時間',
			'restaurant.closeTime' => '結束時間',
			'restaurant.customType' => '自訂類型',
			'restaurant.pleaseSelect' => '請選擇',
			'restaurant.pleaseEnter' => '請輸入',
			'restaurant.required' => '必填',
			'restaurant.saving' => '保存中...',
			'restaurant.editSuccess' => '餐廳資訊更新成功',
			'restaurant.editFailed' => '餐廳資訊更新失敗',
			'restaurant.imageUploadSuccess' => '圖片上傳成功',
			'restaurant.imageUploadFailed' => '圖片上傳失敗',
			'restaurant.confirmDiscard' => '確定要放棄修改嗎？',
			'restaurant.discard' => '放棄',
			'restaurant.keepEditing' => '繼續編輯',
			'restaurant.infoTitle' => '餐廳資訊',
			'restaurant.loading' => '加載餐廳資訊中...',
			'restaurant.noData' => '暫無餐廳資訊',
			'restaurant.retry' => '重試',
			'restaurant.basicInfo' => '基本資訊',
			'restaurant.restaurantType' => '餐廳類型',
			'restaurant.restaurantAddress' => '地址',
			'restaurant.restaurantPhone' => '聯繫電話',
			'restaurant.businessHours' => '營業時間',
			'restaurant.operatingStatus' => '營業狀態',
			'restaurant.restaurantImage' => '餐廳圖片',
			'restaurant.restaurantDescription' => '餐廳描述',
			'restaurant.reviewInfo' => '評價資訊',
			'restaurant.rating' => '評分',
			'restaurant.reviewCount' => '評價數',
			'restaurant.chatRoomVerificationCode' => '聊天室驗證碼',
			'restaurant.currentCode' => '當前驗證碼',
			'restaurant.loadingCode' => '加載中...',
			'restaurant.modify' => '修改',
			'restaurant.editInfo' => '編輯資訊',
			'restaurant.setClosed' => '設置打烊',
			'restaurant.setOpen' => '設置營業',
			'restaurant.settings' => '設置',
			'restaurant.editVerificationCode' => '修改聊天室驗證碼',
			'restaurant.newCode' => '新驗證碼',
			'restaurant.enterNewCode' => '請輸入新的聊天室驗證碼',
			'restaurant.enterCode' => '請輸入驗證碼',
			'restaurant.codeMinLength' => '驗證碼長度不能少於{min}位',
			'restaurant.codeUpdateSuccess' => '驗證碼更新成功',
			'restaurant.codeUpdateFailed' => '驗證碼更新失敗',
			'restaurant.setOpenSuccess' => '已設置營業',
			'restaurant.setClosedSuccess' => '已設置打烊',
			'restaurant.statusToggleFailed' => '狀態切換失敗',
			'restaurant.selectImageFailed' => '選擇圖片失敗',
			'restaurant.takePhotoFailed' => '拍照失敗',
			'restaurant.uploadingImage' => '圖片上傳中...',
			'restaurant.uploadImageInProgress' => '正在上傳圖片...',
			'staff.title' => '員工管理',
			'staff.list' => '員工列表',
			'staff.addStaff' => '添加員工',
			'staff.editStaff' => '編輯員工',
			'staff.deleteStaff' => '刪除員工',
			'staff.name' => '姓名',
			'staff.position' => '職位',
			'staff.status' => '狀態',
			'staff.online' => '在線',
			'staff.offline' => '離線',
			'staff.busy' => '忙碌',
			'staff.experience' => '經驗',
			'staff.rating' => '評分',
			'staff.schedule' => '排班',
			'staff.addSchedule' => '添加排班',
			'staff.editSchedule' => '編輯排班',
			'staff.deleteSchedule' => '刪除排班',
			'staff.loadingStaffList' => '加載員工列表中...',
			'staff.totalStaff' => '總員工',
			'staff.onlineStaff' => '在線',
			'staff.offlineStaff' => '離線',
			'staff.busyStaff' => '忙碌',
			'staff.setAsOffline' => '設為離線',
			'staff.setAsOnline' => '設為在線',
			'staff.updateRating' => '更新評分',
			'staff.confirmOperation' => '確認操作',
			'staff.confirmStatusChange' => ({required Object staffName, required Object newStatus}) => '確定要將 ${staffName} 的狀態設置為 ${newStatus} 嗎？',
			'staff.cancel' => '取消',
			'staff.confirm' => '確定',
			'staff.updateRatingTitle' => '更新評分',
			'staff.setNewRating' => ({required Object staffName}) => '為 ${staffName} 設置新評分：',
			'staff.ratingInputHint' => '評分 (0.0-5.0)',
			'staff.validRatingRequired' => '請輸入有效的評分 (0.0-5.0)',
			'staff.noStaffInfo' => '暫無員工信息',
			'staff.retry' => '重試',
			'staff.unknownStatus' => '未知狀態',
			'staff.unknown' => '未知',
			'staff.statusOnline' => '在線',
			'staff.statusOffline' => '離線',
			'staff.statusBusy' => '忙碌',
			'statistics.title' => '統計',
			'statistics.overview' => '概覽',
			'statistics.today' => '今日',
			'statistics.weekly' => '本周',
			'statistics.monthly' => '本月',
			'statistics.yearly' => '本年',
			'statistics.revenue' => '營收',
			'statistics.orders' => '訂單',
			'statistics.customers' => '顧客',
			'statistics.rating' => '評分',
			'statistics.reviews' => '評價',
			'validation.required' => '此字段為必填項',
			'validation.email' => '請輸入有效的郵箱地址',
			'validation.phone' => '請輸入有效的手機號碼',
			'validation.minLength' => '最少需要 {min} 個字符',
			'validation.maxLength' => '最多只能輸入 {max} 個字符',
			'validation.numeric' => '請輸入數字',
			'validation.positive' => '請輸入正數',
			_ => null,
		};
	}
}
