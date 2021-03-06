NewNoticeController = ($uibModalInstance, AdminFactory, IndexService) ->
  'ngInject'
  vm = this
  vm.date_picker_open = true
  vm.post_at = new Date()

  vm.cancel = () ->
    $uibModalInstance.dismiss()

  vm.submit = () ->
    IndexService.sending = true
    params =
      post_at: vm.post_at
      title: vm.title
      content: vm.content
    AdminFactory.postNotice(params).then((res) ->
      $uibModalInstance.close()
      IndexService.sending = false
    ).catch (res) ->
      IndexService.sending = false

  return

angular.module 'newAccountBook'
  .controller('NewNoticeController', NewNoticeController)
