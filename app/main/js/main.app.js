// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.services' is found in services.js
// 'starter.controllers' is found in controllers.js
angular.module('main', ['ionic','config','common.app',
  'produce.app','waitProcess.app','starter.controllers', 'starter.services','weipig.api'])
.config(function(ENV,$stateProvider, $urlRouterProvider,$logProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js

  $stateProvider

  // setup an abstract state for the tabs directive
  .state('tab', {
    url: '/tab',
    abstract: true,
    templateUrl: 'main/templates/tabs.html'
  })

  // Each tab has its own nav history stack:

  .state('tab.produce', {
    url: '/produce',
    views: {
      'tab-produce': {
        templateUrl: 'produce/templates/tab-produce.html',
        controller: 'ProduceCtrl'
      }
    }
  })

  .state('tab.chats', {
      url: '/chats',
      views: {
        'tab-chats': {
          templateUrl: 'templates/tab-chats.html',
          controller: 'ChatsCtrl'
        }
      }
    })
    .state('tab.chat-detail', {
      url: '/chats/:chatId',
      views: {
        'tab-chats': {
          templateUrl: 'templates/chat-detail.html',
          controller: 'ChatDetailCtrl'
        }
      }
    })

  .state('tab.account', {
    url: '/account',
    views: {
      'tab-account': {
        templateUrl: 'templates/tab-account.html',
        controller: 'AccountCtrl'
      }
    }
  })
  //待配母猪
  .state('waitbreed', {
    //url: '/waitbreed/:companyId/:userId',
    url: '/waitbreed/:companyId/:userId?waitBreedNum',
    templateUrl: "waitprocess/templates/waitbreed.html",
    controller: "waitBreedCtrl"
  })
  ;

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/tab/produce');
});
