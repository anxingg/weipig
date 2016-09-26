'use strict';

axcomponent
.directive('axmenuContent',[function(){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                console.log("axmenuContent");
            }
    };
}])
/** 
* 内容区域，将会随着菜单的展开缩进
*/
.directive('axmenuHide',[function(){
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                    iElm.on("click", function(event) {
                        console.log("axmenuHide");
                        var wrapper = $("[axmenu-wrapper]");
                        $('[axmenu-content]').animate({left:"0"},150,function(){
                            wrapper.hide();
                        });
                        $('img').animate({marginLeft:"0"},150);
                });
            }
    };
}])
/**
 * 菜单按钮
 */
.directive('axmenuShow',[function(){
    console.log("axmenuShow");
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                iElm.on("click", function(event) {
                    var wrapper = $("[axmenu-wrapper]");
                    console.log("wrapper="+wrapper);
                    if(wrapper.is(':hidden')){
                        wrapper.show();
                        $('[axmenu-content]').animate({left:"-70%"},150);
                        $('img').animate({marginLeft:"-70%"},150);
                    }
                    else{
                        $('[axmenu-content]').animate({left:"0"},150,function(){
                            wrapper.hide();
                        });
                        $('img').animate({marginLeft:"0"},150);
                    }
                });
            }
    };
}])
/**
 * 菜单项包围的DIV 
 */
.directive('axmenuWrapper',[function(){
    console.log("axMenuWrapper");
    return {
            scope: false,
            restrict: 'A',
            replace: false,
            link: function(scope, iElm, iAttrs, controller) {
                console.log("axMenuWrapper");
            }
    };
}]);