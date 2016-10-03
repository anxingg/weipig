breedApp
.controller('breedlistCtrl', function($scope,$rootScope,
	$stateParams,$state,$log,pigAPI,breedAPI) {
    $log.debug("breedlistCtrl");
    //初始化参数
	$scope.pageNum = 0;
	$scope.pageSize = 5;
	$scope.aaData = [];
	$scope.noMoreData = 0;
	$scope.noData = 0;
	$scope.roleCode="user";  //这个是我自己加的，用来测试使用的
	$scope.earNo="";
	/**
	 * 查询列表
	 * */
	$scope.getList = function(){
		var param = {
				"earNo":$scope.earNo,
				"pageNum":$scope.pageNum,
				"pageSize":$scope.pageSize
		}
		breedAPI.getBreedList(param,function(result){
			$log.debug("breedAPI.getBreedList:$scope.aaData="+$scope.aaData+",result="+result);
			if(result==0){//异常
				layer.msg('网络异常!',{"time":1000});
			}else if(result==-1){//无数据
				if($scope.pageNum==0){
					$scope.noData = 1;//展示无数据页面
				}else{
					$scope.noMoreData = 0;//隐藏加载更多按钮
				}
			}else{
				if(result.length==$scope.pageSize){
					$scope.noMoreData = 1;//显示加载更多按钮
				}else{
					$scope.noMoreData = 0;
				}
				$scope.aaData = $scope.aaData.concat(result);//合并数组
			}
		})
	}
	
	/**
	 * 下一页
	 * */
	$scope.nextList = function(){
		$scope.pageNum = $scope.pageNum+1;
		$scope.getList();
	}
	
	/**
	 * 查询
	 * */
	$scope.search = function(){
		$scope.pageNum = 0;
		$scope.aaData = [];
		$scope.noMoreData = 0;
		$scope.noData = 0;
		$scope.getList();
	}
	
	/**
	 * 返回上一页
	 * */
	$scope.goBack = function(){
		window.history.back();
	} 
	/**
	 * 新增修改
	 * */
	$scope.gotoAddOrUp = function(id){
		if(id){
			$state.go("breedAddOrUp", {
				"id": id});
		}else{
			$state.go("breedAddOrUp");
		}
	}
	$scope.earNoChange = function(earNo){
		$log.debug("earNoChange scope.earNo="+$scope.earNo);
		$scope.earNo=earNo;
		$scope.pageNum = 0;
		$scope.aaData = [];
		$scope.noMoreData = 0;
		$scope.noData = 0;
		$scope.getList();
	};
	$scope.getList(); 
})
.controller('breedAddOrUpCtrl',
	["$scope",'$rootScope',"$stateParams","$state","$log","pigAPI","pigstyAPI","breedAPI","$ionicModal",
	function(scope,$rootScope,$stateParams,$state,$log,pigAPI,pigstyAPI,breedAPI,$ionicModal) {
    $log.debug("breedAddOrUpCtrl scope.modelReqCode="+scope.modelReqCode);
	if(scope.modelReqCode!=undefined)
	{
		$log.debug("breedAddOrUpCtrl scope.modelRet.earNo："
			+scope.modelRet.earNo);
	}
	//初始化参数
	scope.id = $stateParams.id;

	//初始化所在舍(分娩舍1/配怀舍2/保育舍3/育肥舍4/混合舍5/公猪舍6)
	pigstyAPI.getPigStyList({"types":"2,5"}, function(result){
		scope.optData = result;
		if(!scope.id){//新增下拉选选中第一个
			scope.pigstyId=scope.optData[0].id;
		}
	});
	
	if(scope.id){
		breedAPI.findById({"id":scope.id}, function(result){
			//alert(JSON.stringify(result));
			scope.selectPigData.pigId = result.sowId;
			scope.selectPigData.earNo = result.sowEarNo;
			scope.selectPigData1.pigId = result.oneBoar;
			scope.selectPigData1.earNo = result.oneBoarEarNo;
			scope.selectPigData2.pigId = result.twoBoar;
			scope.selectPigData2.earNo = result.twoBoarEarNo;
			scope.selectPigData3.pigId = result.threeBoar;
			scope.selectPigData3.earNo = result.threeBoarEarNo;
			scope.pigstyId = result.pigstyId;
			$("#breedDate").val(result.breedDate);
		})
	}
	
	/**
	 * 返回上一页
	 * */
	scope.goBack = function(){
		window.history.back();
	}
	
	/**
	 * 新增、修改
	 * */
	scope.save = function(){
		if(!scope.selectPigData.pigId){
			layer.msg('请选择母猪!',{"time":1000});
			return;
		}
		if(!$("#breedDate").val()){
			layer.msg('请选择配种日期!',{"time":1000});
			return;
		}
		if(scope.compare($("#breedDate").val())){
			layer.msg('配种时间是未来日期，不能保存!',{"time":1000});
			return;
		}
		if(!scope.pigstyId){
			layer.msg('请选择所在舍!',{"time":1000});
			return;
		}
		if(!scope.selectPigData1.pigId){
			layer.msg('请选择一配公猪!',{"time":1000});
			return;
		}
		var param = {
			"id":scope.id,
			"breedDate":$("#breedDate").val()+" 00:00:00",
			"pigstyId":scope.pigstyId,
			"sowId":scope.selectPigData.pigId,
			"oneBoar":scope.selectPigData1.pigId,
			"twoBoar":scope.selectPigData2.pigId,
			"threeBoar":scope.selectPigData3.pigId
		}
		
		breedAPI.saveOrUp(param, function(result){
			if(result==1){
				layer.msg('保存成功!',{"time":1000});
				window.history.back();
			}else if(result==-1){
				layer.msg('种猪本时间不能进行配种!',{"time":2000});
			}else{
				layer.msg('保存失败!',{"time":1000});
			}
		})
	}
	
	/**选择种猪初始化开始*/
	scope.selectPigData=[];
	scope.selectPigData1=[];
	scope.selectPigData2=[];
	scope.selectPigData3=[];
	scope.selectPig0 = function(){
		scope.modelReqCode="selectPig0";
		scope.selectType=1;
		scope.openModal();
	}
	scope.selectPig1 = function(){
		scope.modelReqCode="selectPig1";
		scope.selectType=6;
		scope.openModal();
	}
	scope.selectPig2 = function(){
		scope.modelReqCode="selectPig2";
		scope.selectType=6;
		scope.openModal();
	}
	scope.selectPig3 = function(){
		scope.modelReqCode="selectPig3";
		scope.selectType=6;
		scope.openModal();
	}
	/**
	 * 比较时间和当前时间的大小
	 * */
	scope.compare = function(time){
		var nyr = time.split("-");
		var date = new Date();
		if(nyr[0]!=date.getFullYear()){
			return nyr[0] > date.getFullYear();
		}
		var month = '';//月
		if(nyr[1].substring(0,1)=='0'){
			month = nyr[1].substring(1,2);
		}else{
			month = nyr[1];
		}
		if(month!=date.getMonth()+1){
			return month > (date.getMonth()+1);
		}
		var day = '';//日
		if(nyr[2].substring(0,1)=='0'){
			day = nyr[2].substring(1,2);
		}else{
			day = nyr[2];
		}
		return day > date.getDate();
	}

	//earNoChange
	scope.earNoChange = function(earNo){
		$log.debug("earNoChange scope.earNo="+scope.earNo);
		scope.earNo=earNo;
		var param = {"earNo":scope.earNo,"selectType":scope.selectType};
		pigAPI.selectPigList(param, function(result){
			scope.pigListData = result.mapList;
		});
	};
	scope.selectPig = function(pig){
		scope.modelRet=pig;
		scope.closeModal();
	};
	
	$ionicModal.fromTemplateUrl('breed/templates/selectpig.html', {
		scope: scope,
      	animation: 'slide-in-up'
    }).then(function(modal) {
 	     scope.modal = modal;
    });
	scope.openModal = function() {
		$log.debug("openModal");
		scope.earNoChange("");
     	scope.modal.show();
   	};
   	scope.closeModal = function() {
		$log.debug("closeModal");
     	scope.modal.hide();
   	};
   	//当我们用完模型时，清除它！
   scope.$on('$destroy', function() {
     	scope.modal.remove();
   });
   // 当隐藏模型时执行动作
   scope.$on('modal.hidden', function() {
	   $log.debug("modal.hide scope.modelRet="+scope.modelRet);
	   if(scope.modelRet!=undefined){
			// 执行动作
			if(scope.modelReqCode=="selectPig0")//母猪
			{
				scope.selectPigData.pigId = scope.modelRet.pigId;
				scope.selectPigData.earNo = scope.modelRet.earNo;
			}
			else if(scope.modelReqCode=="selectPig1")
			{
				scope.selectPigData1.pigId = scope.modelRet.pigId;
				scope.selectPigData1.earNo = scope.modelRet.earNo;
			}
			else if(scope.modelReqCode=="selectPig2")
			{

				scope.selectPigData2.pigId = scope.modelRet.pigId;
				scope.selectPigData2.earNo = scope.modelRet.earNo;
			}
			else if(scope.modelReqCode=="selectPig3")
			{
				scope.selectPigData3.pigId = scope.modelRet.pigId;
				scope.selectPigData3.earNo = scope.modelRet.earNo;
			}
			scope.modelRet=undefined;
	   }
   });
   // 当移动模型时执行动作
   scope.$on('modal.removed', function() {
     // 执行动作
   });
}])
;