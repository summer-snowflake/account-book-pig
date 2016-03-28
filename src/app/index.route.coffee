angular.module 'newAccountBook'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'error',
        url: '/errors/{id:400|403|404}'
        templateUrl: 'app/components/errors/error.html'
        controllerAs: 'error'
        controller: 'InputErrorsController'
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controllerAs: 'main'
        controller: 'MainController'
      .state 'login',
        url: '/login'
        templateUrl: 'app/account/login.html'
        controllerAs: 'login'
        controller: 'LoginController'
      .state 'sign_up',
        url: '/sign_up'
        templateUrl: 'app/account/sign_up.html'
        controllerAs: 'sign_up'
        controller: 'SignUpController'
      .state 'resend_email',
        url: '/resend_email'
        templateUrl: 'app/account/resend_email.html'
        controllerAs: 'resend_email'
        controller: 'ResendEmailController'
      .state 'reset_password',
        url: '/reset_password'
        templateUrl: 'app/account/reset_password.html'
        controllerAs: 'reset_password'
        controller: 'ResetPasswordController'
      .state 'edit_password',
        url: '/edit_password'
        templateUrl: 'app/account/edit_password.html'
        controllerAs: 'edit_password'
        controller: 'EditPasswordController'
      .state 'mypage',
        url: '/mypage'
        templateUrl: 'app/user/mypage.html'
        controllerAs: 'mypage'
        controller: 'MypageController'
      .state 'notice',
        url: '/notices/:id',
        templateUrl: 'app/user/notice.html'
        controllerAs: 'notice'
        controller: 'NoticeController'
      .state 'message',
        url: '/messages/:id',
        templateUrl: 'app/user/message.html'
        controllerAs: 'message'
        controller: 'MessageController'
      .state 'profile',
        url: '/profile'
        templateUrl: 'app/user/profile.html'
        controllerAs: 'profile'
        controller: 'ProfileController'
      .state 'list',
        url: '/list'
        templateUrl: 'app/records/list.html'
        controllerAs: 'list'
        controller: 'RecordsController'
      .state 'terms',
        url: '/terms'
        templateUrl: 'app/components/footer/terms.html'
        controllerAs: 'terms'
        controller: 'TermsController'
      .state 'categories',
        url: '/categories'
        templateUrl: 'app/settings/categories.html'
        controllerAs: 'categories'
        controller: 'CategoriesController'
      .state 'places',
        url: '/places'
        templateUrl: 'app/settings/places.html'
        controllerAs: 'places'
        controller: 'PlacesController'
      .state 'new_record',
        url: '/records/new'
        templateUrl: 'app/records/new.html'
        controllerAs: 'new_record'
        controller: 'NewRecordController'
      .state 'admin_users',
        url: '/admin/users'
        templateUrl: 'app/admin/users.html'
        controllerAs: 'admin_users'
        controller: 'UsersController'
      .state 'admin_feedbacks',
        url: '/admin/feedbacks'
        templateUrl: 'app/admin/feedbacks.html'
        controllerAs: 'admin_feedbacks'
        controller: 'FeedbacksController'
      .state 'admin_notices',
        url: '/admin/notices'
        templateUrl: 'app/admin/notices.html'
        controllerAs: 'admin_notices'
        controller: 'NoticesController'
      .state 'admin_messages',
        url: '/admin/messages'
        templateUrl: 'app/admin/messages.html'
        controllerAs: 'admin_messages'
        controller: 'MessagesController'

    $urlRouterProvider.otherwise '/'
