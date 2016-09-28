'use strict';

axcomponent
.directive('axmenuContent',['$log',function($log){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                $log.debug("axmenuContent");
            }
    };
}])
/** 
* 内容区域，将会随着菜单的展开缩进
*/
.directive('axmenuHide',['$log',function($log){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                    iElm.on("click", function(event) {
                        $log.debug("axmenuHide");
                        var wrapper = $("[axmenu-wrapper]");
                        $('[axmenu-content]').animate({left:"0"},150,function(){
                            wrapper.hide();
                        });
                });
            }
    };
}])
/**
 * 菜单按钮
 */
.directive('axmenuShow',['$log',function($log){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                iElm.on("click", function(event) {
                    var wrapper = $("[axmenu-wrapper]");
                    $log.debug("wrapper="+wrapper);
                    if(wrapper.is(':hidden')){
                        wrapper.show();
                        $('[axmenu-content]').animate({left:"-70%"},150);
                    }
                    else{
                        $('[axmenu-content]').animate({left:"0"},150,function(){
                            wrapper.hide();
                        });
                    }
                });
            }
    };
}])
/**
 * 菜单项包围的DIV 
 */
.directive('axmenuWrapper',['$log',function($log){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                $log.debug("axMenuWrapper");
            }
    };
}]);