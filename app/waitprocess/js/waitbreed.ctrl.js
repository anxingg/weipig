waitProcessApp
.controller('waitBreedCtrl', function($scope,$stateParams,$log,waitprocess) {
    $log.debug("waitBreedCtrl");
    $scope.title = "待配母猪("+$stateParams.waitBreedNum+")";
    /**
	 * 获得待配母猪记录列表
	 */
    $scope.getList=function(){
	   var param={
			   "pageNum" : $scope.pageNum,
			   "pageSize": $scope.pageSize,
			   "searchType":$scope.controlShow
	   }
	   waitprocess.getWaitBreedList(param,function(result){
		   $scope.result = result;
		   if(result.waitBreedList.length==0){
			   if($scope.pageNum==0){
					$scope.noData = 1;//展示无数据页面
				}else{
					$scope.noMoreData = 0;//隐藏加载更多按钮
				}
		   }else{
			    $scope.aaData = $scope.aaData.concat(result.waitBreedList);//合并数组
			    if(result.waitBreedList.length==$scope.pageSize){
			    	$scope.noMoreData = 1;//显示加载更多按钮
			    }
		   }
	   })
   }
   
	/**
	 * 改变active
	 */
	$scope.chageActive=function(num){
		$scope.pageNum=0;
	    $scope.pageSize=30;
		$scope.noMoreData = 0;
		$scope.noData = 0;
		$scope.aaData = [];
		if(num==1){//断奶待配母猪
			$scope.controlShow=1;
			$scope.weanActive="active";
			$scope.returnActive="";
			$scope.matchedActive="";
			$scope.emptyActive="";
			$scope.abortionActive="";
		}else if(num==2){//返情待配母猪
			$scope.controlShow=2;
			$scope.weanActive="";
			$scope.returnActive="active";
			$scope.matchedActive="";
			$scope.emptyActive="";
			$scope.abortionActive="";
		}else if(num==3){//可配后备母猪
			$scope.controlShow=3;
			$scope.weanActive="";
			$scope.returnActive="";
			$scope.matchedActive="active";
			$scope.emptyActive="";
			$scope.abortionActive="";
		}else if(num==4){//空胎待配母猪
			$scope.controlShow=4;
			$scope.weanActive="";
			$scope.returnActive="";
			$scope.matchedActive="";
			$scope.emptyActive="active";
			$scope.abortionActive="";
		}else if(num==5){//流产后待配母猪
			$scope.controlShow=5;
			$scope.weanActive="";
			$scope.returnActive="";
			$scope.matchedActive="";
			$scope.emptyActive="";
			$scope.abortionActive="active";
		}
		$scope.getList();
	}
	$scope.chageActive(1);
   
   
   /**
    * 加载更多
    */
   $scope.nextList=function(){
	   $scope.pageNum = $scope.pageNum+1;
	   $scope.getList();
   }
});