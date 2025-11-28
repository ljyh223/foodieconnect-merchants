///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsMenuEn menu = TranslationsMenuEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsRestaurantEn restaurant = TranslationsRestaurantEn._(_root);
	late final TranslationsStaffEn staff = TranslationsStaffEn._(_root);
	late final TranslationsStatisticsEn statistics = TranslationsStatisticsEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Change Password'
	String get changePassword => 'Change Password';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'Login Successful'
	String get loginSuccess => 'Login Successful';

	/// en: 'Login Failed'
	String get loginFailed => 'Login Failed';

	/// en: 'Logout Successful'
	String get logoutSuccess => 'Logout Successful';

	/// en: 'Invalid username or password'
	String get invalidCredentials => 'Invalid username or password';

	/// en: 'Passwords do not match'
	String get passwordMismatch => 'Passwords do not match';

	/// en: 'Password changed successfully'
	String get passwordChanged => 'Password changed successfully';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'No Data'
	String get noData => 'No Data';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Warning'
	String get warning => 'Warning';

	/// en: 'Info'
	String get info => 'Info';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';
}

// Path: menu
class TranslationsMenuEn {
	TranslationsMenuEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Menu Management'
	String get title => 'Menu Management';

	/// en: 'Menu Items'
	String get items => 'Menu Items';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'Add Item'
	String get addItem => 'Add Item';

	/// en: 'Edit Item'
	String get editItem => 'Edit Item';

	/// en: 'Delete Item'
	String get deleteItem => 'Delete Item';

	/// en: 'Item Name'
	String get itemName => 'Item Name';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Price'
	String get price => 'Price';

	/// en: 'Original Price'
	String get originalPrice => 'Original Price';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Item Image'
	String get image => 'Item Image';

	/// en: 'Available'
	String get available => 'Available';

	/// en: 'Unavailable'
	String get unavailable => 'Unavailable';

	/// en: 'Recommended'
	String get recommended => 'Recommended';

	/// en: 'Spice Level'
	String get spiceLevel => 'Spice Level';

	/// en: 'Preparation Time'
	String get preparationTime => 'Preparation Time';

	/// en: 'Calories'
	String get calories => 'Calories';

	/// en: 'Add Successful'
	String get addSuccess => 'Add Successful';

	/// en: 'Update Successful'
	String get updateSuccess => 'Update Successful';

	/// en: 'Delete Successful'
	String get deleteSuccess => 'Delete Successful';
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	/// en: 'Restaurant'
	String get restaurant => 'Restaurant';

	/// en: 'Menu'
	String get menu => 'Menu';

	/// en: 'Staff'
	String get staff => 'Staff';

	/// en: 'Statistics'
	String get statistics => 'Statistics';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: restaurant
class TranslationsRestaurantEn {
	TranslationsRestaurantEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Restaurant Management'
	String get title => 'Restaurant Management';

	/// en: 'Restaurant Name'
	String get name => 'Restaurant Name';

	/// en: 'Restaurant Type'
	String get type => 'Restaurant Type';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Address'
	String get address => 'Address';

	/// en: 'Phone'
	String get phone => 'Phone';

	/// en: 'Business Hours'
	String get hours => 'Business Hours';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Closed'
	String get closed => 'Closed';

	/// en: 'Restaurant Image'
	String get image => 'Restaurant Image';

	/// en: 'Update Info'
	String get updateInfo => 'Update Info';

	/// en: 'Update Successful'
	String get updateSuccess => 'Update Successful';

	/// en: 'Update Failed'
	String get updateFailed => 'Update Failed';

	/// en: 'Edit Restaurant Information'
	String get editTitle => 'Edit Restaurant Information';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Select Image'
	String get selectImage => 'Select Image';

	/// en: 'Take Photo'
	String get takePhoto => 'Take Photo';

	/// en: 'Choose from Gallery'
	String get chooseFromGallery => 'Choose from Gallery';

	/// en: 'Remove Image'
	String get removeImage => 'Remove Image';

	/// en: 'Open Time'
	String get openTime => 'Open Time';

	/// en: 'Close Time'
	String get closeTime => 'Close Time';

	/// en: 'Custom Type'
	String get customType => 'Custom Type';

	/// en: 'Please Select'
	String get pleaseSelect => 'Please Select';

	/// en: 'Please Enter'
	String get pleaseEnter => 'Please Enter';

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'Saving...'
	String get saving => 'Saving...';

	/// en: 'Restaurant information updated successfully'
	String get editSuccess => 'Restaurant information updated successfully';

	/// en: 'Failed to update restaurant information'
	String get editFailed => 'Failed to update restaurant information';

	/// en: 'Image uploaded successfully'
	String get imageUploadSuccess => 'Image uploaded successfully';

	/// en: 'Failed to upload image'
	String get imageUploadFailed => 'Failed to upload image';

	/// en: 'Are you sure you want to discard changes?'
	String get confirmDiscard => 'Are you sure you want to discard changes?';

	/// en: 'Discard'
	String get discard => 'Discard';

	/// en: 'Keep Editing'
	String get keepEditing => 'Keep Editing';
}

// Path: staff
class TranslationsStaffEn {
	TranslationsStaffEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Staff Management'
	String get title => 'Staff Management';

	/// en: 'Staff List'
	String get list => 'Staff List';

	/// en: 'Add Staff'
	String get addStaff => 'Add Staff';

	/// en: 'Edit Staff'
	String get editStaff => 'Edit Staff';

	/// en: 'Delete Staff'
	String get deleteStaff => 'Delete Staff';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Position'
	String get position => 'Position';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Online'
	String get online => 'Online';

	/// en: 'Offline'
	String get offline => 'Offline';

	/// en: 'Busy'
	String get busy => 'Busy';

	/// en: 'Experience'
	String get experience => 'Experience';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	/// en: 'Add Schedule'
	String get addSchedule => 'Add Schedule';

	/// en: 'Edit Schedule'
	String get editSchedule => 'Edit Schedule';

	/// en: 'Delete Schedule'
	String get deleteSchedule => 'Delete Schedule';
}

// Path: statistics
class TranslationsStatisticsEn {
	TranslationsStatisticsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Statistics'
	String get title => 'Statistics';

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'This Week'
	String get weekly => 'This Week';

	/// en: 'This Month'
	String get monthly => 'This Month';

	/// en: 'This Year'
	String get yearly => 'This Year';

	/// en: 'Revenue'
	String get revenue => 'Revenue';

	/// en: 'Orders'
	String get orders => 'Orders';

	/// en: 'Customers'
	String get customers => 'Customers';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Reviews'
	String get reviews => 'Reviews';
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'This field is required'
	String get required => 'This field is required';

	/// en: 'Please enter a valid email address'
	String get email => 'Please enter a valid email address';

	/// en: 'Please enter a valid phone number'
	String get phone => 'Please enter a valid phone number';

	/// en: 'Minimum {min} characters required'
	String get minLength => 'Minimum {min} characters required';

	/// en: 'Maximum {max} characters allowed'
	String get maxLength => 'Maximum {max} characters allowed';

	/// en: 'Please enter numbers only'
	String get numeric => 'Please enter numbers only';

	/// en: 'Please enter a positive number'
	String get positive => 'Please enter a positive number';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'auth.login' => 'Login',
			'auth.logout' => 'Logout',
			'auth.username' => 'Username',
			'auth.password' => 'Password',
			'auth.confirmPassword' => 'Confirm Password',
			'auth.changePassword' => 'Change Password',
			'auth.forgotPassword' => 'Forgot Password',
			'auth.loginSuccess' => 'Login Successful',
			'auth.loginFailed' => 'Login Failed',
			'auth.logoutSuccess' => 'Logout Successful',
			'auth.invalidCredentials' => 'Invalid username or password',
			'auth.passwordMismatch' => 'Passwords do not match',
			'auth.passwordChanged' => 'Password changed successfully',
			'common.save' => 'Save',
			'common.cancel' => 'Cancel',
			'common.confirm' => 'Confirm',
			'common.delete' => 'Delete',
			'common.edit' => 'Edit',
			'common.add' => 'Add',
			'common.search' => 'Search',
			'common.filter' => 'Filter',
			'common.refresh' => 'Refresh',
			'common.loading' => 'Loading...',
			'common.noData' => 'No Data',
			'common.error' => 'Error',
			'common.success' => 'Success',
			'common.warning' => 'Warning',
			'common.info' => 'Info',
			'common.retry' => 'Retry',
			'common.close' => 'Close',
			'common.ok' => 'OK',
			'common.yes' => 'Yes',
			'common.no' => 'No',
			'menu.title' => 'Menu Management',
			'menu.items' => 'Menu Items',
			'menu.categories' => 'Categories',
			'menu.addItem' => 'Add Item',
			'menu.editItem' => 'Edit Item',
			'menu.deleteItem' => 'Delete Item',
			'menu.itemName' => 'Item Name',
			'menu.description' => 'Description',
			'menu.price' => 'Price',
			'menu.originalPrice' => 'Original Price',
			'menu.category' => 'Category',
			'menu.image' => 'Item Image',
			'menu.available' => 'Available',
			'menu.unavailable' => 'Unavailable',
			'menu.recommended' => 'Recommended',
			'menu.spiceLevel' => 'Spice Level',
			'menu.preparationTime' => 'Preparation Time',
			'menu.calories' => 'Calories',
			'menu.addSuccess' => 'Add Successful',
			'menu.updateSuccess' => 'Update Successful',
			'menu.deleteSuccess' => 'Delete Successful',
			'navigation.dashboard' => 'Dashboard',
			'navigation.restaurant' => 'Restaurant',
			'navigation.menu' => 'Menu',
			'navigation.staff' => 'Staff',
			'navigation.statistics' => 'Statistics',
			'navigation.profile' => 'Profile',
			'restaurant.title' => 'Restaurant Management',
			'restaurant.name' => 'Restaurant Name',
			'restaurant.type' => 'Restaurant Type',
			'restaurant.description' => 'Description',
			'restaurant.address' => 'Address',
			'restaurant.phone' => 'Phone',
			'restaurant.hours' => 'Business Hours',
			'restaurant.status' => 'Status',
			'restaurant.open' => 'Open',
			'restaurant.closed' => 'Closed',
			'restaurant.image' => 'Restaurant Image',
			'restaurant.updateInfo' => 'Update Info',
			'restaurant.updateSuccess' => 'Update Successful',
			'restaurant.updateFailed' => 'Update Failed',
			'restaurant.editTitle' => 'Edit Restaurant Information',
			'restaurant.save' => 'Save',
			'restaurant.cancel' => 'Cancel',
			'restaurant.reset' => 'Reset',
			'restaurant.edit' => 'Edit',
			'restaurant.selectImage' => 'Select Image',
			'restaurant.takePhoto' => 'Take Photo',
			'restaurant.chooseFromGallery' => 'Choose from Gallery',
			'restaurant.removeImage' => 'Remove Image',
			'restaurant.openTime' => 'Open Time',
			'restaurant.closeTime' => 'Close Time',
			'restaurant.customType' => 'Custom Type',
			'restaurant.pleaseSelect' => 'Please Select',
			'restaurant.pleaseEnter' => 'Please Enter',
			'restaurant.required' => 'Required',
			'restaurant.saving' => 'Saving...',
			'restaurant.editSuccess' => 'Restaurant information updated successfully',
			'restaurant.editFailed' => 'Failed to update restaurant information',
			'restaurant.imageUploadSuccess' => 'Image uploaded successfully',
			'restaurant.imageUploadFailed' => 'Failed to upload image',
			'restaurant.confirmDiscard' => 'Are you sure you want to discard changes?',
			'restaurant.discard' => 'Discard',
			'restaurant.keepEditing' => 'Keep Editing',
			'staff.title' => 'Staff Management',
			'staff.list' => 'Staff List',
			'staff.addStaff' => 'Add Staff',
			'staff.editStaff' => 'Edit Staff',
			'staff.deleteStaff' => 'Delete Staff',
			'staff.name' => 'Name',
			'staff.position' => 'Position',
			'staff.status' => 'Status',
			'staff.online' => 'Online',
			'staff.offline' => 'Offline',
			'staff.busy' => 'Busy',
			'staff.experience' => 'Experience',
			'staff.rating' => 'Rating',
			'staff.schedule' => 'Schedule',
			'staff.addSchedule' => 'Add Schedule',
			'staff.editSchedule' => 'Edit Schedule',
			'staff.deleteSchedule' => 'Delete Schedule',
			'statistics.title' => 'Statistics',
			'statistics.overview' => 'Overview',
			'statistics.today' => 'Today',
			'statistics.weekly' => 'This Week',
			'statistics.monthly' => 'This Month',
			'statistics.yearly' => 'This Year',
			'statistics.revenue' => 'Revenue',
			'statistics.orders' => 'Orders',
			'statistics.customers' => 'Customers',
			'statistics.rating' => 'Rating',
			'statistics.reviews' => 'Reviews',
			'validation.required' => 'This field is required',
			'validation.email' => 'Please enter a valid email address',
			'validation.phone' => 'Please enter a valid phone number',
			'validation.minLength' => 'Minimum {min} characters required',
			'validation.maxLength' => 'Maximum {max} characters allowed',
			'validation.numeric' => 'Please enter numbers only',
			'validation.positive' => 'Please enter a positive number',
			_ => null,
		};
	}
}
