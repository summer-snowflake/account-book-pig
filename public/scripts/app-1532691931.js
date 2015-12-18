!function(){"use strict";angular.module("accountBook",["ngAnimate","ngCookies","ngTouch","ngSanitize","ngMessages","ngAria","ngResource","ui.router","ui.bootstrap","toastr","pascalprecht.translate"])}(),function(){"use strict";function n(){function n(){return e}var e=[{title:"AngularJS",url:"https://angularjs.org/",description:"HTML enhanced for web apps!",logo:"angular.png"},{title:"BrowserSync",url:"http://browsersync.io/",description:"Time-saving synchronised browser testing.",logo:"browsersync.png"},{title:"GulpJS",url:"http://gulpjs.com/",description:"The streaming build system.",logo:"gulp.png"},{title:"Jasmine",url:"http://jasmine.github.io/",description:"Behavior-Driven JavaScript.",logo:"jasmine.png"},{title:"Karma",url:"http://karma-runner.github.io/",description:"Spectacular Test Runner for JavaScript.",logo:"karma.png"},{title:"Protractor",url:"https://github.com/angular/protractor",description:"End to end test framework for AngularJS applications built on top of WebDriverJS.",logo:"protractor.png"},{title:"Bootstrap",url:"http://getbootstrap.com/",description:"Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.",logo:"bootstrap.png"},{title:"Angular UI Bootstrap",url:"http://angular-ui.github.io/bootstrap/",description:"Bootstrap components written in pure AngularJS by the AngularUI Team.",logo:"ui-bootstrap.png"},{title:"Sass (Node)",url:"https://github.com/sass/node-sass",description:"Node.js binding to libsass, the C version of the popular stylesheet preprocessor, Sass.",logo:"node-sass.png"}];this.getTec=n}angular.module("accountBook").service("webDevTec",n)}(),function(){"use strict";function n(){function n(){}var e={restrict:"E",templateUrl:"app/components/navbar/navbar.html",scope:{creationDate:"="},controller:n,controllerAs:"vm",bindToController:!0};return e}angular.module("accountBook").directive("acmeNavbar",n)}(),function(){"use strict";function n(n){function e(){return a}var a=[{name:n.instant("TITLES.LOGIN"),icon:"glyphicon-leaf",url:"login"},{name:n.instant("TITLES.SIGN_UP"),icon:"glyphicon-heart",url:"sign_up"},{name:n.instant("TITLES.RESET_PASSWORD"),icon:"glyphicon-leaf",url:"reset_password"},{name:n.instant("TITLES.RESEND_EMAIL"),icon:"glyphicon-heart",url:"resend_email"}];this.getMenu=e}angular.module("accountBook").service("menuService",n),n.$inject=["$translate"]}(),function(){"use strict";function n(){function n(){this.menus=this.menuData,this.menu_image="assets/images/pig_footprints.gif",this.isSelected=function(n){return this.selected==n},this.mouseEnter=function(n){this.selected=n},this.mouseLeave=function(){this.selected=void 0}}var e={restrict:"C",scope:{menuData:"="},templateUrl:"app/components/menu/menu.html",controller:n,controllerAs:"menu",bindToController:!0};return e}angular.module("accountBook").directive("menuDirective",n)}(),function(){"use strict";function n(n){function e(e,a,t,s){var o,r=n(a[0],{typeSpeed:40,deleteSpeed:40,pauseDelay:800,loop:!0,postfix:" "});a.addClass("acme-malarkey"),angular.forEach(e.extraValues,function(n){r.type(n).pause()["delete"]()}),o=e.$watch("vm.contributors",function(){angular.forEach(s.contributors,function(n){r.type(n.login).pause()["delete"]()})}),e.$on("$destroy",function(){o()})}function a(n,e){function a(){return t().then(function(){n.info("Activated Contributors View")})}function t(){return e.getContributors(10).then(function(n){return s.contributors=n,s.contributors})}var s=this;s.contributors=[],a()}var t={restrict:"E",scope:{extraValues:"="},template:"&nbsp;",link:e,controller:a,controllerAs:"vm"};return a.$inject=["$log","githubContributor"],t}angular.module("accountBook").directive("acmeMalarkey",n),n.$inject=["malarkey"]}(),function(){"use strict";function n(n,e){function a(a){function s(n){return n.data}function o(e){n.error("XHR Failed for getContributors.\n"+angular.toJson(e.data,!0))}return a||(a=30),e.get(t+"/contributors?per_page="+a).then(s)["catch"](o)}var t="https://api.github.com/repos/Swiip/generator-gulp-angular",s={apiHost:t,getContributors:a};return s}angular.module("accountBook").factory("githubContributor",n),n.$inject=["$log","$http"]}(),function(){"use strict";function n(n,e,a){function t(){o(),n(function(){r.classAnimation="rubberBand"},4e3)}function s(){a.info('Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'),r.classAnimation=""}function o(){r.awesomeThings=e.getTec(),angular.forEach(r.awesomeThings,function(n){n.rank=Math.random()})}var r=this;r.awesomeThings=[],r.classAnimation="",r.creationDate=1447644390420,r.showToastr=s,t()}angular.module("accountBook").controller("MainController",n),n.$inject=["$timeout","webDevTec","toastr"]}(),function(){"use strict";function n(n,e,a,t){var s=this;s.menus=a.getMenu(),s.submit=function(){var n={email:s.email,password:s.password,password_confirmation:s.password_confirmation};t.postEmailUserRegistrations(n)["catch"](function(n){s.errors=n.error_messages})}}angular.module("accountBook").controller("SignUpController",n),n.$inject=["$http","$location","menuService","IndexFactory"]}(),function(){"use strict";function n(n){var e=this;e.menus=n.getMenu()}angular.module("accountBook").controller("ResetPasswordController",n),n.$inject=["menuService"]}(),function(){"use strict";function n(n){var e=this;e.menus=n.getMenu()}angular.module("accountBook").controller("ResendEmailController",n),n.$inject=["menuService"]}(),function(){"use strict";function n(n){var e=this;e.menus=n.getMenu()}angular.module("accountBook").controller("LoginController",n),n.$inject=["menuService"]}(),function(){"use strict";function n(n){n.debug("runBlock end")}angular.module("accountBook").run(n),n.$inject=["$log"]}(),function(){"use strict";function n(n,e){n.state("home",{url:"/",templateUrl:"app/main/main.html",controller:"MainController",controllerAs:"main"}).state("login",{url:"/login",templateUrl:"app/account/login.html",controller:"LoginController",controllerAs:"login"}).state("sign_up",{url:"/sign_up",templateUrl:"app/account/sign_up.html",controller:"SignUpController",controllerAs:"sign_up"}).state("reset_password",{url:"/reset_password",templateUrl:"app/account/reset_password.html",controller:"ResetPasswordController",controllerAs:"reset_password"}).state("resend_email",{url:"/resend_email",templateUrl:"app/account/resend_email.html",controller:"ResendEmailController",controllerAs:"resend_email"}).state("menu",{url:"/menu",templateUrl:"app/components/menu/menu.html",controller:"MenuController",controllerAs:"menu"}),e.otherwise("/")}angular.module("accountBook").config(n),n.$inject=["$stateProvider","$urlRouterProvider"]}(),function(){"use strict";function n(n,e,a){var t="",s=a.defer();return{postEmailUserRegistrations:function(a){return n.post(t+"email_user/registrations",a).success(function(n,a,t,s){e.path("/")}).error(function(n,e,a,t){"undefined"!=typeof n&&s.reject(n)}),s.promise}}}angular.module("accountBook").factory("IndexFactory",n),n.$inject=["$http","$location","$q"]}(),function(){"use strict";angular.module("accountBook").constant("malarkey",malarkey).constant("moment",moment)}(),function(){"use strict";function n(n,e,a){e.debugEnabled(!0),a.allowHtml=!0,a.timeOut=3e3,a.positionClass="toast-top-right",a.preventDuplicates=!0,a.progressBar=!0,n.useStaticFilesLoader({prefix:"assets/i18n/locale-",suffix:".json"}),n.preferredLanguage("ja"),n.fallbackLanguage("en"),n.useMissingTranslationHandlerLog(),n.useLocalStorage(),n.useSanitizeValueStrategy("escapeParameters")}angular.module("accountBook").config(n),n.$inject=["$translateProvider","$logProvider","toastrConfig"]}(),angular.module("accountBook").run(["$templateCache",function(n){n.put("app/account/login.html",'<div class="col-md-3"><div class="menu-directive" menu-data="login.menus"></div></div><div class="col-md-9"><div class="panel panel-default"><div class="panel-heading"><span class="glyphicon glyphicon-leaf"></span> {{ \'TITLES.LOGIN\' | translate }}</div><div class="panel-body" id="with-background"><form><div class="form-group"><label for="email">{{ \'LABELS.EMAIL\' | translate }}</label> <input autofocus="" class="form-control" id="email" required="" type="email"></div><div class="form-group"><label for="password">{{ \'LABELS.PASSWORD\' | translate }}</label> <input class="form-control" id="password" required="" type="password"></div><div class="checkbox"><label><input type="checkbox"> {{ \'LABELS.REMEMBER_ME\' | translate }}</label></div><button class="btn btn-default" type="submit">{{ \'BUTTONS.LOGIN\' | translate }}</button></form><hr><p><a ui-sref="reset_password">{{ \'LINKS.FORGOT_PASSWORD\' | translate }}</a></p><p><a ui-sref="resend_email">{{ \'LINKS.RESEND_EMAIL\' | translate }}</a></p></div></div></div>'),n.put("app/account/resend_email.html",'<div class="col-md-3"><div class="menu-directive" menu-data="resend_email.menus"></div></div><div class="col-md-9"><div class="panel panel-default"><div class="panel-heading"><span class="glyphicon glyphicon-leaf"></span> {{ \'TITLES.RESEND_EMAIL\' | translate }}</div><div class="panel-body" id="with-background"><form><div class="form-group"><label for="email">{{ \'LABELS.EMAIL\' | translate }}</label> <input autofocus="" class="form-control" id="email" required="" type="email"></div><button class="btn btn-default" type="submit">{{ \'BUTTONS.SEND\' | translate }}</button></form><hr><p><a ui-sref="reset_password">{{ \'LINKS.FORGOT_PASSWORD\' | translate }}</a></p></div></div></div>'),n.put("app/account/reset_password.html",'<div class="col-md-3"><div class="menu-directive" menu-data="reset_password.menus"></div></div><div class="col-md-9"><div class="panel panel-default"><div class="panel-heading"><span class="glyphicon glyphicon-leaf"></span> {{ \'TITLES.RESET_PASSWORD\' | translate }}</div><div class="panel-body" id="with-background"><form><div class="form-group"><label for="email">{{ \'LABELS.EMAIL\' | translate }}</label> <input autofocus="" class="form-control" id="email" required="" type="email"></div><button class="btn btn-default" type="submit">{{ \'BUTTONS.SEND\' | translate }}</button></form><hr><p><a ui-sref="resend_email">{{ \'LINKS.RESEND_EMAIL\' | translate }}</a></p></div></div></div>'),n.put("app/account/sign_up.html",'<div class="col-md-3"><div class="menu-directive" menu-data="sign_up.menus"></div></div><div class="col-md-9"><div class="panel panel-default"><div class="panel-heading"><span class="glyphicon glyphicon-leaf"></span> {{ \'TITLES.SIGN_UP\' | translate }}</div><div class="panel-body" id="with-background"><div class="alert alert-danger" ng-show="sign_up.errors" role="alert"><button class="close" data-dismiss="alert" type="button">×</button><ul ng-repeat="error in sign_up.errors"><li>{{error}}</li></ul></div><form name="signUpForm" ng-submit="sign_up.submit()" novalidate=""><div class="form-group"><label for="email">{{ \'LABELS.EMAIL\' | translate }}</label> <input autofocus="" class="form-control" id="email" name="email" ng-maxlength="100" ng-model="sign_up.email" required="" type="email"> <span class="errors" ng-messages="signUpForm.email.$error" ng-show="signUpForm.$submitted"><div ng-message="required"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.REQUIRED.EMAIL\' | translate }}</div><div ng-message="email"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.EMAIL\' | translate }}</div><div ng-message="maxlength"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.MAXLENGTH.EMAIL\' | translate }}</div></span></div><div class="form-group"><label for="password">{{ \'LABELS.PASSWORD\' | translate }}</label> <input class="form-control" id="password" name="password" ng-maxlength="72" ng-minlength="4" ng-model="sign_up.password" required="" type="password"> <span class="errors" ng-messages="signUpForm.password.$error" ng-show="signUpForm.$submitted"><div ng-message="required"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.REQUIRED.PASSWORD\' | translate }}</div><div ng-message="maxlength"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.MAXLENGTH.PASSWORD\' | translate }}</div><div ng-message="minlength"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.MINLENGTH.PASSWORD\' | translate }}</div></span></div><div class="form-group"><label for="password_confirmation">{{ \'LABELS.PASSWORD_CONFIRMATION\' | translate }}</label> <input class="form-control" id="password_confirmation" name="password_confirmation" ng-maxlength="72" ng-minlength="4" ng-model="sign_up.password_confirmation" required="" type="password"> <span class="errors" ng-messages="signUpForm.password_confirmation.$error" ng-show="signUpForm.$submitted"><div ng-message="required"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.REQUIRED.PASSWORD\' | translate }}</div><div ng-message="maxlength"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.MAXLENGTH.PASSWORD\' | translate }}</div><div ng-message="minlength"><span class="glyphicon glyphicon-alert"></span> {{ \'ERRORS.MINLENGTH.PASSWORD\' | translate }}</div></span></div><button class="btn btn-default" ng-disabled="signUpForm.$invalid" type="submit">{{ \'BUTTONS.SIGN_UP\' | translate }}</button></form><hr><p><a ui-sref="reset_password">{{ \'LINKS.FORGOT_PASSWORD\' | translate }}</a></p><p><a ui-sref="resend_email">{{ \'LINKS.RESEND_EMAIL\' | translate }}</a></p></div></div></div>'),n.put("app/main/main.html",'<div class="container"><div class="jumbotron text-center"><h1>\'AAAllo, \'Allo!</h1><p class="lead"><img alt="I\'m Yeoman" src="assets/images/yeoman.png"><br>Always a pleasure scaffolding your apps.</p><p class="animated infinite" ng-class="main.classAnimation"><button class="btn btn-lg btn-success" ng-click="main.showToastr()" type="button">Splendid Toastr</button></p><p>With ♥ thanks to the contributions of<acme-malarkey extra-values="[\'Yeoman\', \'Gulp\', \'Angular\']"></acme-malarkey></p></div><div class="row"><div class="col-sm-6 col-md-4" ng-repeat="awesomeThing in main.awesomeThings | orderBy:\'rank\'"><div class="thumbnail"><img alt="{{ awesomeThing.title }}" class="pull-right" ng-src="assets/images/{{ awesomeThing.logo }}"><div class="caption"><h3>{{ awesomeThing.title }}</h3><p>{{ awesomeThing.description }}</p><p><a ng-href="{{awesomeThing.url}}">{{ awesomeThing.url }}</a></p></div></div></div></div></div>'),n.put("app/components/menu/menu.html",'<ul class="list-group"><li class="list-group-item" ng-mouseenter="menu.mouseEnter($index)" ng-mouseleave="menu.mouseLeave()" ng-repeat="menu_field in ::menu.menus"><a ui-sref="{{::menu_field.url}}"><span class="glyphicon {{::menu_field.icon}}"></span> {{::menu_field.name}}</a> <span ng-show="menu.isSelected($index)"><img class="pull-right" ng-src="{{menu.menu_image}}"></span></li></ul>'),n.put("app/components/navbar/navbar.html",'<nav class="navbar navbar-default" role="navigation"><div class="navbar-header"><a class="navbar-brand" ui-sref="home"><img src="assets/images/pig.gif"> <span class="brand-name">{{ \'BRAND_NAME\' | translate }}</span> <span class="glyphicon glyphicon-paperclip"></span></a></div><div class="collapse navbar-collapse"><ul class="nav navbar-nav"><li><a ui-sref="home"><span class="glyphicon glyphicon-home"></span> {{ \'TITLES.HOME\' | translate }}</a></li><li><a><span class="glyphicon glyphicon-stats"></span> {{ \'TITLES.DASHBOARD\' | translate }}</a></li></ul><ul class="nav navbar-nav navbar-right"><li class="dropdown"><a aria-haspopup="" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"><span class="glyphicon glyphicon-cog"></span> {{ \'TITLES.SETTINGS\' | translate }} <span class="caret"></span></a><ul class="dropdown-menu"><li><span class="glyphicon glyphicon-tag"></span> カテゴリ</li></ul></li><li><a ui-sref="login"><span class="glyphicon glyphicon-leaf"></span> {{ \'TITLES.LOGIN\' | translate }}</a></li></ul></div></nav>')}]);
//# sourceMappingURL=../maps/scripts/app-1532691931.js.map
