class EndPoints {
  static const domain = 'https://building.bytes-sa.com';
  static const baseUrl = '$domain/api/v1';
  static const storageUrl = 'https://tashira.infinitybridge.org/storage/';

  //Auth
  static const login = '/general/login';
  static const attendanceCheckIn = '/employee/attendance';
  static const attendanceCheckOut = '/employee/checkout';
  static const getProfileData = '/developer/clients';
  static const updateImage = '/client/save-image';

  static const register = '/client/register';
  static const editProfile = '/client/edit-profile';
  static const changePassword = '/client/change-password';
  static const forgetPassword = '/client/forget-password';

  // Home
  static const getAllBlogs = '/client/get-all-blogs';

  // search
  static const projectDistricts = '/client/project_districts';
  static const features = '/client/features';
  static const realtyTypes = '/client/realty_types';
  static const paymentMethod = '/client/payment-method';

  //Auth
  static const sliders = '/client/sliders';
  static const commonQuestions = '/client/faqs';
  static const contacts = '/client/contacts';
  static const socialMedia = '/client/social-media';

  // Favorite
  static const updateFavoriteProject = '/client/update-favorite-project/';
  static const updateFavoriteUnit = '/client/update-favorite-unit/';

  static const complaints = '/client/complaints';
  static const units = '/client/units';
  static const unitsNoAuth = '/client/get-all-units';

  static const myEstateRental = '/client/units?filter[client_id]=1';
  static const projects = '/client/projects';
  static const projectsNoAuth = '/client/get-all-projects';
  static const oneProjectData = '/client/projects';
  static const allNotification = '/client/get-all-notifications';
  static const allUnReaddNotification = '/client/get-all-unread-notifications';
  static const markAllReaddNotification = '/client/mark-all-notifications';

  // home
  static const interestProject = '/client/update-interest-project/';
  static const interestEstates = '/client/update-interest-unit/';

  //unit
  static const unit = '/client/units?filter[project_id]=';

  // more
  static const getOrders = '/developer/order-requests/';
  static const postOrder = '/developer/order-request';
  static const getOrderType = '/developer/orders?type';
  static const getVacationType = '/developer/vacation';
  static const addVacation = '/employee/vacation-request';

  static const getHolidays = '/developer/public-vacation';
  static const getVacations = '/employee/vacation-request';

  // task

  static const postEvent = '/developer/event';
  static const postTask = '/developer/task';
  static const eventType = '/developer/event-type';
  static const event = '/developer/event';
  static const getEvents = '/developer/public-vacation';
  static const getTask = '/developer/task';
  static const getEmployee = '/developer/employee';
  static const getClients = '/developer/clients';
  static const getUnitsByClient = '/developer/get-units-by-client';
  static const addClient = '/developer/clients';
  static const postTaskDone = '/developer/task';
  static const getMeeting = '/developer/events-type';
  static const getPaymentMethods = '/developer/payment-method';
}
