produceApp

.controller('ProduceCtrl', function($scope,$state,$stateParams,$log,QueryStringService,farm) {
    $log.debug("ProduceCtrl");
	/*
    QueryStringService.getFilters($scope.filters);
	*/
	$scope.filters = { openId: '', userId: '' , companyId: '' ,companyName: '' };
	$scope.filters.companyId=$stateParams.companyId;
	$scope.filters.userId=$stateParams.userId;
	$scope.filters.openId=$stateParams.openId;
	$scope.filters.companyName=$stateParams.companyName;
    $log.debug("$scope.openId="+$scope.filters.openId+",$scope.companyName="+$scope.filters.companyName);
    /**
	 * 初始化Index数据
	 */
	$scope.initKeyinIndexData = function(){
		var param = {};
		farm.initKeyinIndexData(param,function(result){
            $log.debug(result);
			$scope.waitBreedNum = result.waitBreedNum;
			$scope.waitDeliveryNum = result.waitDeliveryNum;
			$scope.waitWeanNum = result.waitWeanNum;
            $log.debug("$scope.waitBreedNum="+$scope.waitBreedNum);
		});
	}
	
	$scope.initKeyinIndexData();
	
	/**
	 * 进入猪场首页
	 */
	$scope.pigFarm = function(){
		window.location.href = basePath+"logined/pig/farm/index.jsp";
	}
	
	/**
	 * 进入种猪首页
	 */
	$scope.boar = function(){
		window.location.href = basePath+"logined/pig/boar/boar_list.jsp";
	}
	
	/**
	 * 进入分析
	 */
	$scope.analysis = function(){
		window.location.href = basePath+"logined/pig/report/analysis.jsp";
	}
	
	/**
	 * 进入配种页面
	 */
	$scope.gotoBreed = function(){
		window.location.href = basePath+"logined/pig/keyin/breedList.jsp";
	}
	
	/**
	 * 进入妊检页面
	 */
	$scope.gotoCheck = function(){
		window.location.href = basePath+"logined/pig/keyin/checkList.jsp";
	}
	
	/**
	 * 进入分娩页面
	 */
	$scope.gotoDelivery = function(){
		window.location.href = basePath+"logined/pig/keyin/deliveryList.jsp";
	}
	
	/**
	 * 进入断奶页面
	 */
	$scope.gotoWean = function(){
		window.location.href = basePath+"logined/pig/keyin/weanList.jsp";
	}
	
	/**
	 * 进入采精页面
	 * */
	$scope.gotoCollect = function(){
		window.location.href = basePath+"logined/pig/keyin/collectList.jsp";
	}
	
	/**
	 * 进入肉猪转舍页面
	 * */
	$scope.gotoHogMove = function(){
		window.location.href = basePath+"logined/pig/keyin/hogMoveList.jsp";
	}
	
	/**
	 * 进入肉猪盘点页面
	 */
	$scope.gotoHogCheck = function(){
		window.location.href = basePath+"logined/pig/keyin/hogCheck.jsp";
	}
	/**
	 * 进入肉猪离群页面
	 */
	$scope.gotoHogLeave = function(){
		window.location.href = basePath+"logined/pig/keyin/hogLeaveList.jsp";
	}
	/**
	 * 进入种猪离群页面
	 */
	$scope.gotoBoarLeave = function(){
		window.location.href = basePath+"logined/pig/keyin/boarLeaveList.jsp";
	}
	/**
	 * 进入待产母猪页面
	 */
	$scope.gotowaitDelivery = function(){
		window.location.href = basePath+"logined/pig/report/waitDelivery.jsp?waitDeliveryNum="+scope.waitDeliveryNum;
	}
	/**
	 * 进入待断奶母猪页面
	 */
	$scope.gotowaitWean = function(){
		window.location.href = basePath+"logined/pig/report/waitWeanList.jsp?waitWeanNum="+scope.waitWeanNum;
	}
	/**
	 * 进入待配母猪页面
	 */
	$scope.gotowaitBreed = function(){
		$state.go("waitbreed", {
			"companyId": $scope.filters.companyId,
			"userId": $scope.filters.userId,
            "waitBreedNum": $scope.waitBreedNum
        });
	}
});
