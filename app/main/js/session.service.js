'use strict';
 
// js session
mainApp.service('SessionService', function ($location) {
    this.localUser={openId:""};
    this.getLocalUser = function() {
        if((this.localUser.openId==null)
            ||(this.localUser.openId==undefined)
            ||(this.localUser.openId==""))
        {
            this.localUser=angular.fromJson(window.sessionStorage['localUser']);
        }
        return this.localUser;
    };
    this.setLocalUser = function(user) {
        this.localUser=user;
        window.sessionStorage['localUser']=angular.toJson(user);
    };
});