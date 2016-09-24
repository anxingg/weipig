angular.module('weipig.api', ['ionic'])
.factory('path',[function(){
	return {
		getPath:function (){
			var url = "";
			if (ionic.Platform.isAndroid()) {
				url = "/android_asset/www/";
			}
			return url;
		}
	}
}])
.factory('farm', ['path','$http',function(path,$http) {
    return {
        farmStart:function(param,callback){
			var url = path.getPath();
			$http.get(url + "data/json/messages.json").then(function(response) {});
			/*
				http.post(basePath+"pigFarm/farmStart.c",param)
				.success(function(result){
					callback(result);
				});
			*/
		}
    };
}]);