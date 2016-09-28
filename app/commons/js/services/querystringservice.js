'use strict';
 
// This service reads data from the query string into a filter object.
commonApp.service('QueryStringService', function ($location) {
    this.getQueryString = function(url,param) {
        var reg = new RegExp("(^|&)" + param + "=([^&]*)(&|$)", "i");
        var r = url.substr(1).match(reg);  //获取url中"?"符后的字符串并正则匹配
        var context = "";  
        if (r != null)  
            context = r[2];  
        reg = null;  
        r = null;  
        context=(context == null || context == "" || context == "undefined" ? "" : context);
        context=decodeURI(context);
        return context;
    }
    this.getFilters = function(filterObj) {
        var url = window.location.search;
        var value;
        for (var param in filterObj) {
            value=this.getQueryString(url,param);
            if(value!="")
                filterObj[param] = value;
        }
        return filterObj;
    };
});