AdminFactory = ($location, $q, localStorageService, $http, $translate, IndexService, toastr) ->
  'ngInject'
  host = if $location.host() == 'localhost' then 'http://localhost:3001/' else ''

  return {
    getUser: (user_id) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.get host + 'admin/users/' + user_id, login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    getUsers: (offset) ->
      IndexService.loading = true
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.get host + 'admin/users?offset=' + offset, login_headers
        .success((data) ->
          defer.resolve data
          IndexService.loading = false
          return
        ).error (data) ->
          defer.reject data
          IndexService.loading = false
          return
      return defer.promise

    getFeedbacks: (offset) ->
      IndexService.loading = true
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.get host + 'admin/feedbacks?offset=' + offset, login_headers
        .success((data) ->
          defer.resolve data
          IndexService.loading = false
          return
        ).error (data) ->
          defer.reject data
          IndexService.loading = false
          return
      return defer.promise

    getUserFeedbacks: (user_id) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.get host + 'admin/users/' + user_id + '/feedbacks', login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    patchFeedbackCheck: (feedback_id) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.patch host + 'admin/feedbacks/' + feedback_id + '/check', '', login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    getNotices: (offset) ->
      IndexService.loading = true
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.get host + 'admin/notices?offset=' + offset, login_headers
        .success((data) ->
          defer.resolve data
          IndexService.loading = false
          return
        ).error (data) ->
          defer.reject data
          IndexService.loading = false
          return
      return defer.promise

    postNotice: (params) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.post host + 'admin/notices', params, login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    getMessages: (offset) ->
      IndexService.loading = true
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.get host + 'admin/messages?offset=' + offset, login_headers
        .success((data) ->
          defer.resolve data
          IndexService.loading = false
          return
        ).error (data) ->
          defer.reject data
          IndexService.loading = false
          return
      return defer.promise

    postMessage: (user_id, params) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.post host + 'admin/users/' + user_id + '/messages', params, login_headers
        .success((data) ->
          defer.resolve data
          toastr.success $translate.instant('MESSAGES.SEND_MESSAGE')
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    postMessageSendMail: (message_id) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.post host + 'admin/messages/' + message_id + '/send_mail', '', login_headers
        .success((data) ->
          defer.resolve data
          toastr.success $translate.instant('MESSAGES.SEND_MESSAGE')
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    patchMessage: (message_id, params) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.patch host + 'admin/messages/' + message_id, params, login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    deleteMessage: (message_id) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.delete host + 'admin/messages/' + message_id, login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    patchNotice: (notice_id, params) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.patch host + 'admin/notices/' + notice_id, params, login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise

    deleteNotice: (notice_id) ->
      defer = $q.defer()
      token = localStorageService.get('access_token')
      login_headers = {
        headers: { Authorization: 'Token token=' + token }
      }
      $http.delete host + 'admin/notices/' + notice_id, login_headers
        .success((data) ->
          defer.resolve data
          return
        ).error (data) ->
          defer.reject data
          return
      return defer.promise
  }

angular.module 'newAccountBook'
  .factory 'AdminFactory', AdminFactory
