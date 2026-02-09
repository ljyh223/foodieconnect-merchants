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

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Merchant Management Platform'
	String get merchantPlatform => 'Merchant Management Platform';

	/// en: 'Remember Me'
	String get rememberMe => 'Remember Me';

	/// en: 'Forgot Password?'
	String get forgotPasswordQuestion => 'Forgot Password?';

	/// en: 'Enter Username'
	String get enterUsername => 'Enter Username';

	/// en: 'Enter Password'
	String get enterPassword => 'Enter Password';

	/// en: 'Username must be at least {min} characters'
	String get usernameMinLength => 'Username must be at least {min} characters';

	/// en: 'Password must be at least {min} characters'
	String get passwordMinLength => 'Password must be at least {min} characters';

	/// en: 'Please enter username and password'
	String get enterUsernameAndPassword => 'Please enter username and password';

	/// en: 'Please contact admin to reset password'
	String get resetPasswordContactAdmin => 'Please contact admin to reset password';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Registration successful, please login'
	String get registerSuccess => 'Registration successful, please login';

	/// en: 'Registration failed'
	String get registerFailed => 'Registration failed';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Phone (optional)'
	String get phone => 'Phone (optional)';

	/// en: 'Restaurant ID'
	String get restaurantId => 'Restaurant ID';

	/// en: 'Role'
	String get role => 'Role';

	/// en: 'Admin'
	String get roleAdmin => 'Admin';

	/// en: 'Manager'
	String get roleManager => 'Manager';

	/// en: 'Staff'
	String get roleStaff => 'Staff';

	/// en: 'Please enter email'
	String get enterEmail => 'Please enter email';

	/// en: 'Please enter name'
	String get enterName => 'Please enter name';

	/// en: 'Please enter restaurant ID'
	String get enterRestaurantId => 'Please enter restaurant ID';

	/// en: 'Please confirm password'
	String get enterConfirmPassword => 'Please confirm password';

	/// en: 'Password must contain both letters and numbers'
	String get passwordContentLetterNumber => 'Password must contain both letters and numbers';

	/// en: 'Don't have an account?'
	String get noAccount => 'Don\'t have an account?';

	/// en: 'Register now'
	String get registerNow => 'Register now';

	/// en: 'Already have an account?'
	String get hasAccount => 'Already have an account?';

	/// en: 'Go to login'
	String get goToLogin => 'Go to login';

	/// en: 'Are you sure you want to logout?'
	String get logoutConfirm => 'Are you sure you want to logout?';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Restaurant Name'
	String get restaurantName => 'Restaurant Name';

	/// en: 'Restaurant Type'
	String get restaurantType => 'Restaurant Type';

	/// en: 'Restaurant Address'
	String get restaurantAddress => 'Restaurant Address';

	/// en: 'Restaurant Image (optional)'
	String get restaurantImage => 'Restaurant Image (optional)';

	/// en: 'Please enter restaurant name'
	String get enterRestaurantName => 'Please enter restaurant name';

	/// en: 'Please enter restaurant type'
	String get enterRestaurantType => 'Please enter restaurant type';

	/// en: 'Please enter restaurant address'
	String get enterRestaurantAddress => 'Please enter restaurant address';

	/// en: 'Account Information'
	String get accountInfo => 'Account Information';

	/// en: 'Personal Information'
	String get personalInfo => 'Personal Information';

	/// en: 'Restaurant Information'
	String get restaurantInfo => 'Restaurant Information';
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

	/// en: 'No data available'
	String get noData => 'No data available';

	/// en: 'Load failed'
	String get loadFailed => 'Load failed';

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

	/// en: 'Image changed'
	String get imageChanged => 'Image changed';

	/// en: 'Click to upload image'
	String get clickToUploadImage => 'Click to upload image';

	/// en: 'Basic Information'
	String get basicInfo => 'Basic Information';

	/// en: 'Contact Information'
	String get contactInfo => 'Contact Information';

	/// en: 'Example: '
	String get example => 'Example: ';
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

	/// en: 'Loading menu...'
	String get loadingMenu => 'Loading menu...';

	/// en: 'No items available'
	String get noItems => 'No items available';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Item added successfully'
	String get itemAdded => 'Item added successfully';

	/// en: 'Failed to add item'
	String get itemAddFailed => 'Failed to add item';

	/// en: 'Item updated successfully'
	String get itemUpdated => 'Item updated successfully';

	/// en: 'Failed to update item'
	String get itemUpdateFailed => 'Failed to update item';

	/// en: 'Item enabled'
	String get itemEnabled => 'Item enabled';

	/// en: 'Item disabled'
	String get itemDisabled => 'Item disabled';

	/// en: 'Item set as recommended'
	String get itemSetAsRecommended => 'Item set as recommended';

	/// en: 'Item removed from recommended'
	String get itemUnsetAsRecommended => 'Item removed from recommended';

	/// en: 'Operation failed, please retry'
	String get operationFailed => 'Operation failed, please retry';

	/// en: 'Confirm Delete'
	String get confirmDelete => 'Confirm Delete';

	/// en: 'Are you sure you want to delete item "{name}"? This operation cannot be undone.'
	String get deleteConfirmMessage => 'Are you sure you want to delete item "{name}"? This operation cannot be undone.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Item "{name}" deleted'
	String get itemDeleted => 'Item "{name}" deleted';

	/// en: 'Failed to delete item, please retry'
	String get deleteFailed => 'Failed to delete item, please retry';

	/// en: 'Search items'
	String get searchItems => 'Search items';

	/// en: 'Available items'
	String get availableItems => 'Available items';

	/// en: 'Unavailable items'
	String get unavailableItems => 'Unavailable items';

	/// en: 'Recommended items'
	String get recommendedItems => 'Recommended items';

	/// en: 'All items'
	String get allItems => 'All items';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: 'days ago'
	String get daysAgo => 'days ago';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Disable'
	String get disable => 'Disable';

	/// en: 'Enable'
	String get enable => 'Enable';

	/// en: 'Set as recommended'
	String get setAsRecommended => 'Set as recommended';

	/// en: 'Remove from recommended'
	String get unsetAsRecommended => 'Remove from recommended';

	/// en: 'Created: '
	String get created => 'Created: ';

	/// en: 'Edit Menu Item'
	String get editMenuItem => 'Edit Menu Item';

	/// en: 'Add New Menu Item'
	String get addNewMenuItem => 'Add New Menu Item';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Basic Information'
	String get basicInfo => 'Basic Information';

	/// en: 'e.g., Signature Beef Noodle'
	String get exampleItemName => 'e.g., Signature Beef Noodle';

	/// en: 'Short and clear name (required)'
	String get shortClearName => 'Short and clear name (required)';

	/// en: 'Describe ingredients, taste, portion, etc.'
	String get enterDescription => 'Describe ingredients, taste, portion, etc.';

	/// en: 'Will be displayed in order details page'
	String get displayInDetails => 'Will be displayed in order details page';

	/// en: 'Price and Specifications'
	String get priceSpecs => 'Price and Specifications';

	/// en: 'Current Price'
	String get currentPrice => 'Current Price';

	/// en: 'Actual selling price'
	String get actualPrice => 'Actual selling price';

	/// en: 'Show original price'
	String get showOriginalPrice => 'Show original price';

	/// en: 'Preparation Time'
	String get prepTime => 'Preparation Time';

	/// en: 'minutes'
	String get minutes => 'minutes';

	/// en: 'Estimated time'
	String get estimatedTime => 'Estimated time';

	/// en: 'Calories'
	String get caloriesLabel => 'Calories';

	/// en: 'Kcal'
	String get kcal => 'Kcal';

	/// en: 'Image and Settings'
	String get imageSettings => 'Image and Settings';

	/// en: 'Item Image'
	String get itemImage => 'Item Image';

	/// en: 'Upload clear photos to boost sales'
	String get uploadClearPhoto => 'Upload clear photos to boost sales';

	/// en: 'Click to change image'
	String get clickToChangeImage => 'Click to change image';

	/// en: 'Click to upload image'
	String get clickToUploadImage => 'Click to upload image';

	/// en: 'Supports album selection or camera'
	String get supportAlbumCamera => 'Supports album selection or camera';

	/// en: 'Image failed to load'
	String get imageLoadFailed => 'Image failed to load';

	/// en: 'On Sale'
	String get onSale => 'On Sale';

	/// en: 'Will be hidden from customers when turned off'
	String get hideFromCustomers => 'Will be hidden from customers when turned off';

	/// en: 'Manager Recommended'
	String get managerRecommended => 'Manager Recommended';

	/// en: 'Will be prioritized in recommended section'
	String get displayInRecommendations => 'Will be prioritized in recommended section';

	/// en: 'Sort Order'
	String get sortOrder => 'Sort Order';

	/// en: 'Larger numbers appear first'
	String get numberGreaterMoreTop => 'Larger numbers appear first';

	/// en: 'Please fill in name, price and select category'
	String get fillNamePriceCategory => 'Please fill in name, price and select category';

	/// en: 'Data validation failed'
	String get validationFailed => 'Data validation failed';

	/// en: 'Select from Album'
	String get selectFromAlbum => 'Select from Album';

	/// en: 'Take Photo'
	String get takePhoto => 'Take Photo';

	/// en: 'Select Category'
	String get selectCategory => 'Select Category';

	/// en: 'Loading categories...'
	String get loadingCategories => 'Loading categories...';
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

	/// en: 'Chat'
	String get chat => 'Chat';
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

	/// en: 'Restaurant Information'
	String get infoTitle => 'Restaurant Information';

	/// en: 'Loading restaurant information...'
	String get loading => 'Loading restaurant information...';

	/// en: 'No restaurant information'
	String get noData => 'No restaurant information';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Basic Information'
	String get basicInfo => 'Basic Information';

	/// en: 'Restaurant Type'
	String get restaurantType => 'Restaurant Type';

	/// en: 'Address'
	String get restaurantAddress => 'Address';

	/// en: 'Phone'
	String get restaurantPhone => 'Phone';

	/// en: 'Business Hours'
	String get businessHours => 'Business Hours';

	/// en: 'Operating Status'
	String get operatingStatus => 'Operating Status';

	/// en: 'Restaurant Image'
	String get restaurantImage => 'Restaurant Image';

	/// en: 'Restaurant Description'
	String get restaurantDescription => 'Restaurant Description';

	/// en: 'Review Information'
	String get reviewInfo => 'Review Information';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Review Count'
	String get reviewCount => 'Review Count';

	/// en: 'Chat Room Verification Code'
	String get chatRoomVerificationCode => 'Chat Room Verification Code';

	/// en: 'Current Code'
	String get currentCode => 'Current Code';

	/// en: 'Loading...'
	String get loadingCode => 'Loading...';

	/// en: 'Modify'
	String get modify => 'Modify';

	/// en: 'Edit Info'
	String get editInfo => 'Edit Info';

	/// en: 'Set Closed'
	String get setClosed => 'Set Closed';

	/// en: 'Set Open'
	String get setOpen => 'Set Open';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Edit Chat Room Verification Code'
	String get editVerificationCode => 'Edit Chat Room Verification Code';

	/// en: 'New Code'
	String get newCode => 'New Code';

	/// en: 'Please enter new verification code'
	String get enterNewCode => 'Please enter new verification code';

	/// en: 'Please enter verification code'
	String get enterCode => 'Please enter verification code';

	/// en: 'Verification code must be at least {min} characters'
	String get codeMinLength => 'Verification code must be at least {min} characters';

	/// en: 'Verification code updated successfully'
	String get codeUpdateSuccess => 'Verification code updated successfully';

	/// en: 'Failed to update verification code'
	String get codeUpdateFailed => 'Failed to update verification code';

	/// en: 'Set to Open'
	String get setOpenSuccess => 'Set to Open';

	/// en: 'Set to Closed'
	String get setClosedSuccess => 'Set to Closed';

	/// en: 'Failed to toggle status'
	String get statusToggleFailed => 'Failed to toggle status';

	/// en: 'Failed to select image'
	String get selectImageFailed => 'Failed to select image';

	/// en: 'Failed to take photo'
	String get takePhotoFailed => 'Failed to take photo';

	/// en: 'Uploading image...'
	String get uploadingImage => 'Uploading image...';

	/// en: 'Uploading image...'
	String get uploadImageInProgress => 'Uploading image...';
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

	/// en: 'Please enter a rating between 0.0 and 5.0'
	String get ratingHelper => 'Please enter a rating between 0.0 and 5.0';

	/// en: 'Staff'
	String get defaultPosition => 'Staff';

	/// en: 'Unknown Experience'
	String get defaultExperience => 'Unknown Experience';

	/// en: 'Unknown Staff'
	String get unknownStaff => 'Unknown Staff';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	/// en: 'Add Schedule'
	String get addSchedule => 'Add Schedule';

	/// en: 'Edit Schedule'
	String get editSchedule => 'Edit Schedule';

	/// en: 'Delete Schedule'
	String get deleteSchedule => 'Delete Schedule';

	/// en: 'Loading staff list...'
	String get loadingStaffList => 'Loading staff list...';

	/// en: 'Total Staff'
	String get totalStaff => 'Total Staff';

	/// en: 'Online'
	String get onlineStaff => 'Online';

	/// en: 'Offline'
	String get offlineStaff => 'Offline';

	/// en: 'Busy'
	String get busyStaff => 'Busy';

	/// en: 'Set Offline'
	String get setAsOffline => 'Set Offline';

	/// en: 'Set Online'
	String get setAsOnline => 'Set Online';

	/// en: 'Update Rating'
	String get updateRating => 'Update Rating';

	/// en: 'Confirm Operation'
	String get confirmOperation => 'Confirm Operation';

	/// en: 'Are you sure you want to set ${staffName}'s status to ${newStatus}?'
	String confirmStatusChange({required Object staffName, required Object newStatus}) => 'Are you sure you want to set ${staffName}\'s status to ${newStatus}?';

	/// en: 'Confirm Delete'
	String get confirmDelete => 'Confirm Delete';

	/// en: 'Are you sure you want to delete staff ${staffName}? This operation cannot be undone.'
	String confirmDeleteMessage({required Object staffName}) => 'Are you sure you want to delete staff ${staffName}? This operation cannot be undone.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Update Rating'
	String get updateRatingTitle => 'Update Rating';

	/// en: 'Set new rating for ${staffName}:'
	String setNewRating({required Object staffName}) => 'Set new rating for ${staffName}:';

	/// en: 'Rating (0.0-5.0)'
	String get ratingInputHint => 'Rating (0.0-5.0)';

	/// en: 'Please enter staff name'
	String get nameRequired => 'Please enter staff name';

	/// en: 'Please enter a valid rating (0.0-5.0)'
	String get validRatingRequired => 'Please enter a valid rating (0.0-5.0)';

	/// en: 'No staff information available'
	String get noStaffInfo => 'No staff information available';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Staff created successfully'
	String get staffCreated => 'Staff created successfully';

	/// en: 'Staff updated successfully'
	String get staffUpdated => 'Staff updated successfully';

	/// en: 'Staff deleted successfully'
	String get staffDeleted => 'Staff deleted successfully';

	/// en: 'Failed to create staff'
	String get createFailed => 'Failed to create staff';

	/// en: 'Failed to update staff'
	String get updateFailed => 'Failed to update staff';

	/// en: 'Failed to delete staff'
	String get deleteFailed => 'Failed to delete staff';

	/// en: 'Unknown Status'
	String get unknownStatus => 'Unknown Status';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'Online'
	String get statusOnline => 'Online';

	/// en: 'Offline'
	String get statusOffline => 'Offline';

	/// en: 'Busy'
	String get statusBusy => 'Busy';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Create Staff'
	String get createStaff => 'Create Staff';
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

	/// en: 'Username must be between 3-50 characters'
	String get usernameLength => 'Username must be between 3-50 characters';

	/// en: 'Username can only contain letters, numbers, and underscores'
	String get usernameFormat => 'Username can only contain letters, numbers, and underscores';

	/// en: 'Password must be between 6-20 characters'
	String get passwordLength => 'Password must be between 6-20 characters';

	/// en: 'Password must contain both letters and numbers'
	String get passwordFormat => 'Password must contain both letters and numbers';

	/// en: 'Name must be between 2-100 characters'
	String get nameLength => 'Name must be between 2-100 characters';

	/// en: 'Please enter a valid phone number'
	String get phoneFormat => 'Please enter a valid phone number';

	/// en: 'Please enter a valid restaurant ID'
	String get restaurantIdFormat => 'Please enter a valid restaurant ID';
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
			'auth.settings' => 'Settings',
			'auth.language' => 'Language',
			'auth.merchantPlatform' => 'Merchant Management Platform',
			'auth.rememberMe' => 'Remember Me',
			'auth.forgotPasswordQuestion' => 'Forgot Password?',
			'auth.enterUsername' => 'Enter Username',
			'auth.enterPassword' => 'Enter Password',
			'auth.usernameMinLength' => 'Username must be at least {min} characters',
			'auth.passwordMinLength' => 'Password must be at least {min} characters',
			'auth.enterUsernameAndPassword' => 'Please enter username and password',
			'auth.resetPasswordContactAdmin' => 'Please contact admin to reset password',
			'auth.register' => 'Register',
			'auth.registerSuccess' => 'Registration successful, please login',
			'auth.registerFailed' => 'Registration failed',
			'auth.email' => 'Email',
			'auth.name' => 'Name',
			'auth.phone' => 'Phone (optional)',
			'auth.restaurantId' => 'Restaurant ID',
			'auth.role' => 'Role',
			'auth.roleAdmin' => 'Admin',
			'auth.roleManager' => 'Manager',
			'auth.roleStaff' => 'Staff',
			'auth.enterEmail' => 'Please enter email',
			'auth.enterName' => 'Please enter name',
			'auth.enterRestaurantId' => 'Please enter restaurant ID',
			'auth.enterConfirmPassword' => 'Please confirm password',
			'auth.passwordContentLetterNumber' => 'Password must contain both letters and numbers',
			'auth.noAccount' => 'Don\'t have an account?',
			'auth.registerNow' => 'Register now',
			'auth.hasAccount' => 'Already have an account?',
			'auth.goToLogin' => 'Go to login',
			'auth.logoutConfirm' => 'Are you sure you want to logout?',
			'auth.cancel' => 'Cancel',
			'auth.confirm' => 'Confirm',
			'auth.restaurantName' => 'Restaurant Name',
			'auth.restaurantType' => 'Restaurant Type',
			'auth.restaurantAddress' => 'Restaurant Address',
			'auth.restaurantImage' => 'Restaurant Image (optional)',
			'auth.enterRestaurantName' => 'Please enter restaurant name',
			'auth.enterRestaurantType' => 'Please enter restaurant type',
			'auth.enterRestaurantAddress' => 'Please enter restaurant address',
			'auth.accountInfo' => 'Account Information',
			'auth.personalInfo' => 'Personal Information',
			'auth.restaurantInfo' => 'Restaurant Information',
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
			'common.noData' => 'No data available',
			'common.loadFailed' => 'Load failed',
			'common.error' => 'Error',
			'common.success' => 'Success',
			'common.warning' => 'Warning',
			'common.info' => 'Info',
			'common.retry' => 'Retry',
			'common.close' => 'Close',
			'common.ok' => 'OK',
			'common.yes' => 'Yes',
			'common.no' => 'No',
			'common.imageChanged' => 'Image changed',
			'common.clickToUploadImage' => 'Click to upload image',
			'common.basicInfo' => 'Basic Information',
			'common.contactInfo' => 'Contact Information',
			'common.example' => 'Example: ',
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
			'menu.loadingMenu' => 'Loading menu...',
			'menu.noItems' => 'No items available',
			'menu.retry' => 'Retry',
			'menu.itemAdded' => 'Item added successfully',
			'menu.itemAddFailed' => 'Failed to add item',
			'menu.itemUpdated' => 'Item updated successfully',
			'menu.itemUpdateFailed' => 'Failed to update item',
			'menu.itemEnabled' => 'Item enabled',
			'menu.itemDisabled' => 'Item disabled',
			'menu.itemSetAsRecommended' => 'Item set as recommended',
			'menu.itemUnsetAsRecommended' => 'Item removed from recommended',
			'menu.operationFailed' => 'Operation failed, please retry',
			'menu.confirmDelete' => 'Confirm Delete',
			'menu.deleteConfirmMessage' => 'Are you sure you want to delete item "{name}"? This operation cannot be undone.',
			'menu.cancel' => 'Cancel',
			'menu.delete' => 'Delete',
			'menu.itemDeleted' => 'Item "{name}" deleted',
			'menu.deleteFailed' => 'Failed to delete item, please retry',
			'menu.searchItems' => 'Search items',
			'menu.availableItems' => 'Available items',
			'menu.unavailableItems' => 'Unavailable items',
			'menu.recommendedItems' => 'Recommended items',
			'menu.allItems' => 'All items',
			'menu.today' => 'Today',
			'menu.yesterday' => 'Yesterday',
			'menu.daysAgo' => 'days ago',
			'menu.edit' => 'Edit',
			'menu.disable' => 'Disable',
			'menu.enable' => 'Enable',
			'menu.setAsRecommended' => 'Set as recommended',
			'menu.unsetAsRecommended' => 'Remove from recommended',
			'menu.created' => 'Created: ',
			'menu.editMenuItem' => 'Edit Menu Item',
			'menu.addNewMenuItem' => 'Add New Menu Item',
			'menu.save' => 'Save',
			'menu.basicInfo' => 'Basic Information',
			'menu.exampleItemName' => 'e.g., Signature Beef Noodle',
			'menu.shortClearName' => 'Short and clear name (required)',
			'menu.enterDescription' => 'Describe ingredients, taste, portion, etc.',
			'menu.displayInDetails' => 'Will be displayed in order details page',
			'menu.priceSpecs' => 'Price and Specifications',
			'menu.currentPrice' => 'Current Price',
			'menu.actualPrice' => 'Actual selling price',
			'menu.showOriginalPrice' => 'Show original price',
			'menu.prepTime' => 'Preparation Time',
			'menu.minutes' => 'minutes',
			'menu.estimatedTime' => 'Estimated time',
			'menu.caloriesLabel' => 'Calories',
			'menu.kcal' => 'Kcal',
			'menu.imageSettings' => 'Image and Settings',
			'menu.itemImage' => 'Item Image',
			'menu.uploadClearPhoto' => 'Upload clear photos to boost sales',
			'menu.clickToChangeImage' => 'Click to change image',
			'menu.clickToUploadImage' => 'Click to upload image',
			'menu.supportAlbumCamera' => 'Supports album selection or camera',
			'menu.imageLoadFailed' => 'Image failed to load',
			'menu.onSale' => 'On Sale',
			'menu.hideFromCustomers' => 'Will be hidden from customers when turned off',
			'menu.managerRecommended' => 'Manager Recommended',
			'menu.displayInRecommendations' => 'Will be prioritized in recommended section',
			'menu.sortOrder' => 'Sort Order',
			'menu.numberGreaterMoreTop' => 'Larger numbers appear first',
			'menu.fillNamePriceCategory' => 'Please fill in name, price and select category',
			'menu.validationFailed' => 'Data validation failed',
			'menu.selectFromAlbum' => 'Select from Album',
			'menu.takePhoto' => 'Take Photo',
			'menu.selectCategory' => 'Select Category',
			'menu.loadingCategories' => 'Loading categories...',
			'navigation.dashboard' => 'Dashboard',
			'navigation.restaurant' => 'Restaurant',
			'navigation.menu' => 'Menu',
			'navigation.staff' => 'Staff',
			'navigation.statistics' => 'Statistics',
			'navigation.profile' => 'Profile',
			'navigation.chat' => 'Chat',
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
			'restaurant.infoTitle' => 'Restaurant Information',
			'restaurant.loading' => 'Loading restaurant information...',
			'restaurant.noData' => 'No restaurant information',
			'restaurant.retry' => 'Retry',
			'restaurant.basicInfo' => 'Basic Information',
			'restaurant.restaurantType' => 'Restaurant Type',
			'restaurant.restaurantAddress' => 'Address',
			'restaurant.restaurantPhone' => 'Phone',
			'restaurant.businessHours' => 'Business Hours',
			'restaurant.operatingStatus' => 'Operating Status',
			'restaurant.restaurantImage' => 'Restaurant Image',
			'restaurant.restaurantDescription' => 'Restaurant Description',
			'restaurant.reviewInfo' => 'Review Information',
			'restaurant.rating' => 'Rating',
			'restaurant.reviewCount' => 'Review Count',
			'restaurant.chatRoomVerificationCode' => 'Chat Room Verification Code',
			'restaurant.currentCode' => 'Current Code',
			'restaurant.loadingCode' => 'Loading...',
			'restaurant.modify' => 'Modify',
			'restaurant.editInfo' => 'Edit Info',
			'restaurant.setClosed' => 'Set Closed',
			'restaurant.setOpen' => 'Set Open',
			'restaurant.settings' => 'Settings',
			'restaurant.editVerificationCode' => 'Edit Chat Room Verification Code',
			'restaurant.newCode' => 'New Code',
			'restaurant.enterNewCode' => 'Please enter new verification code',
			'restaurant.enterCode' => 'Please enter verification code',
			'restaurant.codeMinLength' => 'Verification code must be at least {min} characters',
			'restaurant.codeUpdateSuccess' => 'Verification code updated successfully',
			'restaurant.codeUpdateFailed' => 'Failed to update verification code',
			'restaurant.setOpenSuccess' => 'Set to Open',
			'restaurant.setClosedSuccess' => 'Set to Closed',
			'restaurant.statusToggleFailed' => 'Failed to toggle status',
			'restaurant.selectImageFailed' => 'Failed to select image',
			'restaurant.takePhotoFailed' => 'Failed to take photo',
			'restaurant.uploadingImage' => 'Uploading image...',
			'restaurant.uploadImageInProgress' => 'Uploading image...',
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
			'staff.ratingHelper' => 'Please enter a rating between 0.0 and 5.0',
			'staff.defaultPosition' => 'Staff',
			'staff.defaultExperience' => 'Unknown Experience',
			'staff.unknownStaff' => 'Unknown Staff',
			'staff.schedule' => 'Schedule',
			'staff.addSchedule' => 'Add Schedule',
			'staff.editSchedule' => 'Edit Schedule',
			'staff.deleteSchedule' => 'Delete Schedule',
			'staff.loadingStaffList' => 'Loading staff list...',
			'staff.totalStaff' => 'Total Staff',
			'staff.onlineStaff' => 'Online',
			'staff.offlineStaff' => 'Offline',
			'staff.busyStaff' => 'Busy',
			'staff.setAsOffline' => 'Set Offline',
			'staff.setAsOnline' => 'Set Online',
			'staff.updateRating' => 'Update Rating',
			'staff.confirmOperation' => 'Confirm Operation',
			'staff.confirmStatusChange' => ({required Object staffName, required Object newStatus}) => 'Are you sure you want to set ${staffName}\'s status to ${newStatus}?',
			'staff.confirmDelete' => 'Confirm Delete',
			'staff.confirmDeleteMessage' => ({required Object staffName}) => 'Are you sure you want to delete staff ${staffName}? This operation cannot be undone.',
			'staff.cancel' => 'Cancel',
			'staff.confirm' => 'Confirm',
			'staff.save' => 'Save',
			'staff.updateRatingTitle' => 'Update Rating',
			'staff.setNewRating' => ({required Object staffName}) => 'Set new rating for ${staffName}:',
			'staff.ratingInputHint' => 'Rating (0.0-5.0)',
			'staff.nameRequired' => 'Please enter staff name',
			'staff.validRatingRequired' => 'Please enter a valid rating (0.0-5.0)',
			'staff.noStaffInfo' => 'No staff information available',
			'staff.retry' => 'Retry',
			'staff.staffCreated' => 'Staff created successfully',
			'staff.staffUpdated' => 'Staff updated successfully',
			'staff.staffDeleted' => 'Staff deleted successfully',
			'staff.createFailed' => 'Failed to create staff',
			'staff.updateFailed' => 'Failed to update staff',
			'staff.deleteFailed' => 'Failed to delete staff',
			'staff.unknownStatus' => 'Unknown Status',
			'staff.unknown' => 'Unknown',
			'staff.statusOnline' => 'Online',
			'staff.statusOffline' => 'Offline',
			'staff.statusBusy' => 'Busy',
			'staff.delete' => 'Delete',
			'staff.createStaff' => 'Create Staff',
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
			'validation.usernameLength' => 'Username must be between 3-50 characters',
			'validation.usernameFormat' => 'Username can only contain letters, numbers, and underscores',
			'validation.passwordLength' => 'Password must be between 6-20 characters',
			'validation.passwordFormat' => 'Password must contain both letters and numbers',
			'validation.nameLength' => 'Name must be between 2-100 characters',
			'validation.phoneFormat' => 'Please enter a valid phone number',
			'validation.restaurantIdFormat' => 'Please enter a valid restaurant ID',
			_ => null,
		};
	}
}
