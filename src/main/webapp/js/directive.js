var listDirective = angular.module('listDirective',[])
listDirective.directive('list',function(){
    return {
        restrict:"AE",
        templateUrl:'tpls/list.html',
        replace:true
    }
});
listDirective.directive('loadmore',function(){
    return {
        restrict:"AE",
        template:'<div ng-show="jsloadshow" class="text-center" ng-click="loadfn()" ng-bind="loadtxt"></div>',
        replace:true
    }
});
listDirective.directive('mynav',function(){
	return {
    	restrict:"AE",
        templateUrl:'tpls/mynav.html',
        controller:[ '$cookies',"$scope", "$rootScope", function ($cookies, $scope, $rootScope) {   		 
    		var auth = $cookies.get('auth');
    		$scope.nav1 = auth.search('ROLE_ADMIN')===-1?false:true
    		$scope.nav2 = auth.search('ROLE_CAN_DELETE')===-1?false:true
        }],
        replace:true
       }
});

listDirective.directive('editmodal',function(){
	return {
    	restrict:"AE",
        templateUrl:'tpls/editmodal.html',
        replace:true
       }
});

listDirective.directive('commitmodal',function(){
	return {
    	restrict:"AE",
        templateUrl:'tpls/commitmodal.html',
        replace:true
       }
});

listDirective.directive('confirm',function(){
	return {
    	restrict:"AE",
        templateUrl:'tpls/confirmmodal.html',
        replace:true
       }
});
listDirective.directive('passwmodal',function(){
	return {
    	restrict:"AE",
        templateUrl:'tpls/modipasswmodal.html',
        replace:true
       }
});


var formDirective = angular.module('formDirective',[])
formDirective.directive('formmy',function(){

    return {

        restrict:"AE",
        templateUrl:'tpls/form.html',
//      controller:[ '$cookies',"$scope", "$rootScope", function ($cookies, $scope, $rootScope) {   		 
//  		$(function(){$('.summernote').each(function() {
//				console.log(1)
//				var $this = $(this);
//				var placeholder = $this.attr("placeholder") || '';
//				var url = $this.attr("action") || '';
//				$this.summernote({
//					lang: 'zh-CN',
//					placeholder: placeholder,
//					minHeight: 300,
//					dialogsFade: true, // Add fade effect on dialogs
//					dialogsInBody: true, // Dialogs can be placed in body, not in
//					// summernote.
//					disableDragAndDrop: false, // default false You can disable drag
//					// and drop
//					callbacks: {
//						onImageUpload: function(files) {
//							var $files = $(files);
//							$files.each(function() {
//								var file = this;
//								var data = new FormData();
//								data.append("file", file);
//								$.ajax({
//									data: data,
//									type: "POST",
//									url: url,
//									cache: false,
//									contentType: false,
//									processData: false,
//									success: function(response) {										
//										$this.summernote('insertImage', imageUrl, function($image) {});
//										$.growl.notice({  
//									       message: "上传成功!"				         
//									    });
//									},
//									error: function(){
//										$.growl.error({  
//									       message: "上传失败!"				         
//									   });										
//									}
//								});
//							});
//						}
//					}
//				});
//			});
//			})
//      }],
        
        replace:true

    }
})
 
var messageDetail = angular.module('messageDetail',[])
messageDetail.directive('msg',function(){

    return {

        restrict:"AE",
        templateUrl:'tpls/msgandreply.html',
        replace:true

    }
})
messageDetail.directive('replyform',function(){

    return {
        restrict:"AE",
        templateUrl:'tpls/replyform.html',
        replace:true

    }
})
var userlist = angular.module('userlist',[])
userlist.directive('modal',function(){
    return {
        restrict:"AE",
        templateUrl:'tpls/modal.html',
        replace:true

    }
})
