paymentsGlyphiconDirective = () ->
  directive =
    restrict: 'E'
    scope:
      payments: '='
    templateUrl: 'app/components/records/payments_glyphicon/payments_glyphicon.html'
    controller: 'PaymentsGlyphiconController'
    controllerAs: 'vm'
    bindToController: true
    transclude: true

angular.module 'newAccountBook'
  .directive('paymentsGlyphiconDirective', paymentsGlyphiconDirective)
