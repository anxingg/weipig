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
//农场相关API
.factory('farmAPI', ['path','$http','$log',function(path,$http,$log) {
    return {
        farmStart:function(param,callback){
			var url = path.getPath();
			$http.get(url + "data/json/farm/farmStart.json").then(function(response) {
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
    };
}])
//猪相关API
.factory('pigAPI', ['path','$http','$log',function(path,$http,$log) {
    return {
        //待配母猪列表
		getWaitBreedList: function(param, callback){
			var url = path.getPath();
			$http.get(url + "data/json/pig/waitBreedList.json").then(function(response) {
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
		},
		//选择猪
		selectPigList: function(param,callback){
			var url = path.getPath();
			$http.get(url + "data/json/pig/selectPigList.json").then(function(response) {
				callback(response.data);
			},function(){
				$log.debug("$http.get error selectPigList");
			});
			/*
			http.post(basePath+ "pig/selectPigList.c",param)
			.success(function(result) {
				callback(result);
			});
			*/
		},
    };
}])
//配种相关API
.factory('breedAPI', ['path','$http','$log',function(path,$http,$log) {
	return {
		//获得配种记录列表
		getBreedList: function(param, callback){
			var url = path.getPath();
			$http.get(url + "data/json/breed/breedlist.json").then(function(response) {
				callback(response.data);
			},function(){
				$log.debug("$http.get error getBreedList");
			});
			/*
			http.post(basePath + "toDone/waitBreedList.c", param)
			.success(function(result){
				callback(result);
			})
			*/
		},
		//根据ID获取配种信息
		findById: function(param, callback){
			var url = path.getPath();
			$http.get(url + "data/json/breed/findById.json").then(function(response) {
				callback(response.data);
			},function(){
				$log.debug("$http.get error findById");
			});
			/*
			http.post(basePath + "breed/findById.c", param)
			.success(function(result){
				callback(result);
			})
			*/
		},
		//新增或更新配种信息
		saveOrUp: function(param, callback){
			callback(1);
			/*
			http.post(basePath + "breed/findById.c", param)
			.success(function(result){
				callback(result);
			})
			*/
		}
	};
}])	
.factory('pigstyAPI', ['path','$http','$log',function(path,$http,$log) {
	return {
		//根据类型获取所在舍
		getPigStyList: function(param, callback){
			var url = path.getPath();
			$http.get(url + "data/json/pigsty/findByTypes.json").then(function(response) {
				callback(response.data);
			},function(){
				$log.debug("$http.get error getPigStyList");
			});
			/*
			http.post(basePath + "pigsty/findByTypes.c", param)
			.success(function(result){
				callback(result);
			})
			*/
		}
	};
}])
//报表相关API
.factory('reportAPI', ['path','$http','$log',function(path,$http,$log) {
    return {
		//农场的待处理数据
		initKeyinIndexData: function(param,callback){
			var url = path.getPath();
			$http.get(url + "data/json/report/initKeyinIndexData.json").then(function(response) {
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
;