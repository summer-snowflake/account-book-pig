ModalPlacesController = (SettingsFactory, category_id, $modal) ->
  'ngInject'
  vm = this

  SettingsFactory.getCategoryPlaces(category_id).then (res) ->
    vm.places = res.places

  return

angular.module 'newAccountBook'
  .controller('ModalPlacesController', ModalPlacesController)
