angular.module('weipig.api', ['ionic','config'])
.factory('path',[function(){
	return {
		getPath:function (){
			var url = "";
			if (ionic.Platform.isAndroid()) {
				//url = "/android_asset/www/";
			}
			return url;
		}
	}
}])
.factory('farm', ['path','$http','$log',function(path,$http,$log) {
    return {
        farmStart:function(param,callback){
			var url = path.getPath();
			$http.get(url + "data/json/farmStart.json").then(function(response) {
				$log.debug("farm response.data.openId="+response.data.openId
					+",response.data.isHasCompany="+response.data.isHasCompany);
				callback(response.data);
			},function(){
				$log.debug("$http.get error farmStart");
			});
			/*
				http.post(basePath+"pigFarm/farmStart.c",param)
				.success(function(result){
					callback(result);
				});
			*/
		},
		enterPigFarm:function(param,callback){
			callback(1);
			/*
			http.post(basePath+"pigFarm/enterPigFarm.c",param)
			.success(function(result){
				callback(result);
			})
			*/
		},
		initKeyinIndexData: function(param,callback){
			var url = path.getPath();
			$http.get(url + "data/json/initKeyinIndexData.json").then(function(response) {
				callback(response.data);
			},function(){
				$log.debug("$http.get error initKeyinIndexData");
			});
			/*
			http.post(basePath+ "pigFarm/initKeyinIndexData.c",param)
			.success(function(result) {
				callback(result);
			});
			*/
		}
    };
}])
.factory('waitprocess', ['path','$http','$log',function(path,$http,$log) {
    return {
        //待配母猪列表
		getWaitBreedList: function(param, callback){
			var url = path.getPath();
			$http.get(url + "data/json/waitBreedList.json").then(function(response) {
				callback(response.data);
			},function(){
				$log.debug("$http.get error getWaitBreedList");
			});
			/*
			http.post(basePath + "toDone/waitBreedList.c", param)
			.success(function(result){
				callback(result);
			})
			*/
		}
    };
}]);