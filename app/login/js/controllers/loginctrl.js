loginApp.controller('LoginCtrl', function($scope,$state,$stateParams,$log,QueryStringService,farm) {
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //
  //$scope.$on('$ionicView.enter', function(e) {
  //});
  $scope.filters = { openId: '123', userName: '王永刚' };
  QueryStringService.getFilters($scope.filters);
  $scope.openId = $scope.filters.openId;
  $scope.userName = $scope.filters.userName;

  //$scope.openId = "123";
  //$scope.userName = "wyg";
  $log.debug("$scope.openId="+$scope.openId+",$scope.userName="+$scope.userName);

  $scope.init = function(){
    var data={
		  "openId":$scope.openId,
			"userName":$scope.userName,
			"_clientType":"wap"
		}; 
		farm.farmStart(data,function(result){
			$scope.isHasCompany = result.isHasCompany;
			if($scope.isHasCompany=="0"){
				//alert("您还未有加入任何猪场!");
			}
      		else{
				$scope.companyId = result.companyId;//当前猪场Id
				$scope.companyState = result.companyState;//当前猪场状态
				$scope.companyName = result.companyName;//当前猪场名称
				$scope.userId = result.userId;//当前用户角色
				$scope.userState = result.userState;//当前用户状态
				$scope.roleName = result.roleName;//当前用户角色
				$scope.companyList = result.companyList;//猪场列表
			}
		});
	};
	/**
	 * 选择猪场
	 */
	$scope.selectCompany = function(companyId){
		/*
		$('.animate_tip').trigger("click");
		var data={
				"openId":$scope.openId,
				"userName.":$scope.userName,
				"companyId":companyId,
				"_clientType":"wap"
			}; 
			startIndexService.selectPigFarm(data,function(result){
					$scope.companyId = result.companyId;//当前猪场Id
					$scope.companyState = result.companyState;//当前猪场状态
					$scope.companyName = result.companyName;//当前猪场名称
					$scope.userId = result.userId;//当前用户角色
					$scope.userState = result.userState;//当前用户状态
					$scope.roleName = result.roleName;//当前用户角色
			});
			*/
	}
	/**
	 * 进入猪场
	 */
	$scope.enterPigFarm = function(companyId){
		$log.debug("enterPigFarm:"+companyId);
		
		var data={
			"openId":$scope.openId,
			"userId":$scope.userId,
			"companyId":companyId,
			"_clientType":"wap"
		}; 
		farm.enterPigFarm(data,function(result){
			if(result==1){
				$state.go("tab.produce", {
					"companyId": $scope.filters.companyId,
					"userId": $scope.filters.userId,
					"openId":$scope.openId,
					"companyName": $scope.companyName
				});
			}else{
				layer.msg('系统异常,请稍后重试!',{"time":1000});
			}
		});
	}
	/**
	 * 创建猪场
	 */
	$scope.createPigFarm = function(){
		window.location.href = basePath+"logined/pig/farm/create_farm.jsp?_clientType=wap&openId="+$scope.openId+"&userName="+encodeURI(encodeURI($scope.userName));
	}
	
	/**
	 * 创建猪场
	 */
	$scope.joinPigFarm = function(){
		window.location.href = basePath+"logined/pig/farm/join_farm.jsp?_clientType=wap&openId="+$scope.openId+"&userName="+encodeURI(encodeURI($scope.userName));
	}
	/**
	 * 退出猪场
	 */
	$scope.quitPigFarm = function(){
		/*
		layer.confirm("确定要退出猪场吗?", {
			  btn: ['确定','取消'] //按钮
			}, function(){
				var data = {"openId":$scope.openId,"companyId":$scope.companyId};
				startIndexService.quitPigFarm(data,function(result){
					if(result==1){
						layer.msg('操作成功!', {icon: 1,"time":1000});
						$scope.startIndex();//启动开始页面
					}else{
						layer.msg('系统异常,请稍后重试!',{"time":1000});
					}
				});
			 
			}, function(){
		});
		*/
	}
	/**
	 * 删除猪场
	 */
	$scope.cancelPigFarm = function(){
		/*
		layer.confirm("确定要删除猪场吗?", {
			  btn: ['确定','取消'] //按钮
			}, function(){
				var data = {"companyId":$scope.companyId};
				startIndexService.cancelPigFarm(data,function(result){
					if(result==1){
						layer.msg('操作成功!', {icon: 1,"time":1000});
						$scope.startIndex();//启动开始页面
					}else{
						layer.msg('系统异常,请稍后重试!',{"time":1000});
					}
				});
			 
			}, function(){
		});
		*/
	}
	
	$scope.init();//启动开始页面
})
