loginApp.directive('notouch',[function(){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                var htmlEl = angular.element(document.querySelector('body'));
                htmlEl.on("touchstart", function(event) {});
            }
    };
}]);