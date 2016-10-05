pigfarmApp
.controller('PigfarmCtrl', function($scope,$rootScope,
	$stateParams,$state,$log,pigAPI,SessionService,$ionicPlatform,$ionicPopup) {
    $log.debug("pigfarmCtrl");
    $scope.psyNum=6;  //猪舍间数。这个是测试数据，应该从接口获得
    var localUser=SessionService.getLocalUser();
    $scope.pigfarmName=localUser.companyName;
    
    //退出猪厂
    $scope.exitFarm=function(){
        var confirmPopup = $ionicPopup.confirm({
            title: '提示',
            template: '确认要退出本猪厂?',
            scope: $scope,
            buttons: [
            { text: '取消' },
            {
                text: '<b>确定</b>',
                type: 'button-positive',
                onTap: function(e) {
                    $log.debug("确定:"+e);
                    ionic.Platform.exitApp();
                }
            },
            ]
        });
        confirmPopup.then(function(res) {
            $log.debug("then:"+res);
        });
    }
});