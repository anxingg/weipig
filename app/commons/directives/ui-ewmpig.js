/*
   二维码扫描 
 */
(function(){
	"use strict"
    angular.module("ui-ewmpig", [])
	.directive("ewmpig", function($http, $location,$log){
		return {
			template: '<em class="ewm" ng-click="scanQRCode()"></em><input ng-model="earNo" type="text" placeholder="输入耳号搜索"/>',
			restrict: "E",
			scope: {
				earNo: "=", //输入框内容
				earNoChange: "&"  //输入改变
			},
			link: function(scope, ele, attrs) {
				scope.$watch("earNo", function(newVal, oldVal) {
					$log.debug("ewmpig earNo changed newVal="+newVal+",oldVal="+oldVal);
					if(newVal!=oldVal)
						scope.earNoChange(newVal);
				});
				scope.scanQRCode = function(){
					var startTime = new Date().getTime();
					var absurl = $location.absUrl();
					var param = {
							"_clientType":"wap",
							"pageurl":absurl,
							"createTimestamp": Math.round(startTime/1000)
					}
					
					$http({
						 url:basePath+'wx/wxConfig.c',
						 method:'post',
						 data: param
						 }).success(function(data,header,config,status){ 
			                // 初始化配置信息
			                wx.config({
			          	      debug: false,
			          	      appId: data.appId,
			          	      timestamp: data.timestamp,
			          	      nonceStr: data.nonceStr,
			          	      signature: data.signature,
			          	      jsApiList: [       
			          	         'scanQRCode'
			          	      ]
			          	    });
			  
			                // 调用微信扫描接口
			                wx.scanQRCode({
			  			      needResult: 1,
			  			      desc: 'scanQRCode desc',
			  			      success: function (res) { 
								scope.$apply(function(){
									if ("scanQRCode:ok" == res.errMsg){ 
									    scope.earNo=res.resultStr;
			  			            }
								});
			  			        
			  			      }
			  			    });
			                
						}).error(function(data,header,config,status){
						 //处理响应失败
						});
				} 
			}
		}
	});
})();