var mesgCtrls = angular.module('mesgCtrls',[])
mesgCtrls.controller('app',['$cookies','$rootScope','$location', '$scope',function($cookies,$rootScope,$location,$scope){
	$rootScope.goTo = function(path){
		$location.path(path);
	}
	$rootScope.curUser = {
		userId:$cookies.get('userId'),
		userName:$cookies.get('userName'),
		email:$cookies.get('email')
	}
	$rootScope.search = function(){
		$rootScope.$broadcast("search",$scope.keyWord)
	}
	
	$rootScope.href = function(path){
		return window.location.pathname+"#!"+path;
	}
	$rootScope.confirm = function(callback, title){
		if(title===undefined)
		title = "确定要删除么？"
		$rootScope.confirmInfo = {
			title:title,
			callback:callback
		}
		$('#cfmModel').modal();
	}
}])
mesgCtrls.controller('userlistCtrl',['$scope','$http','$routeParams',function($scope,$http,$routeParams){
	$.bootstrapLoading.start();
	$http({
        method:'get',
        url:'api/users'
   }).then(function(data){		
        $scope.userlist = data.data;
        $(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
        bind();
        $.bootstrapLoading.end();
    }).catch(function(){
        console.log('error');
        $.bootstrapLoading.end();
    });
    $scope.getDates = function(date){
        return new Date(date);
    }
	function bind(){
		$('#myModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget)
		var user = button.data('user')
	  	var modal = $(this)
	  	modal.find('.modal-title').text('修改 ' + user.userName + ' 的权限')
	  	modal.find('#can-read').prop("checked",user.permissions&1===1?true:false)
	  	modal.find('#can-write').prop("checked",(user.permissions>>1)&1===1?true:false)
	  	modal.find('#can-delete').prop("checked",(user.permissions>>2)&1===1?true:false)
	  	modal.find('#save-button').one('click',commit(user.userId))
	  	function commit(userId){
	  		return function(){
		  		var p_r = $('#myModal').find('#can-read').prop("checked")?1:0;
		    	var p_w = $('#myModal').find('#can-write').prop("checked")?2:0;
		    	var p_d = $('#myModal').find('#can-delete').prop("checked")?4:0;
		    	var permissions = p_r+p_w+p_d;
		    	$.bootstrapLoading.start({ loadingTips: "更新中...", target: "#myModal .modal-content" });
		    	$http({
			        method:'put',
			        url:'api/users' ,
			        data:{
			        	permissions:permissions,
			        	userId:userId
			        }
			   	}).then(function(data){	
			   		user.permissions = permissions
			   		$.bootstrapLoading.end()
			   		$('#myModal').modal('hide')
			   		$.growl.notice({  
				       message: "修改成功!"				         
				    }); 
			    }).catch(function(){
			    	$.bootstrapLoading.end()
			    	$('#myModal').modal('hide')
			        $.growl.error({  
				       message: "修改失败!"				         
				    });			        
			    });
		    }
	  	}
	})}
}])
mesgCtrls.controller('messageCtrl',['$cookies','$rootScope' ,'$scope','$http','$routeParams','$location',function($cookies, $rootScope,$scope,$http,$routeParams,$location){
	$http.get(`/api/message/${$routeParams.id}`).then(function(data){
		$scope.msg = data.data[0];		
        $scope.replylistAll =data.data;
        if($scope.replylistAll.length>5){
        	$scope.replylist = $scope.replylistAll.slice(1,6);
        	$scope.loadtxt="加载更多";
        	$scope.jsloadshow=true;
        }
        else{
        	$scope.replylist = $scope.replylistAll.slice(1,6);
        	$scope.loadtxt="没有更多了";
        	$scope.jsloadshow=true;
        }
    }).catch(function(){
        console.log('error')
    });
    $scope.loadfn = function(){
        $scope.loadtxt="加载中.....";
        $scope.replylist =$scope.replylistAll
        $scope.loadtxt="没有更多了";
    }
    $scope.getDates = function(date){
        return new Date(date);
    }
    $scope.info = {
        content:'',
        date:new Date().getTime()
    }
    $scope.upCount = function(message){
    	$http.get('/api/message/up/'+message.messageId).then(function(data){
	    	message.upCount++
	   	}).catch(function(){
	   	});
	}
    $scope.$on("search", function(event,msg){
    	var reg =/^\/message\/([0-9]+)\/*$/
    	if($location.path().match(reg) === null)
    		return
		$http.get(`/api/message/${$routeParams.id}/${msg}`).then(function(data){		
	        $scope.replylistAll =data.data.filter(function(cur){
	        	return cur.messageId !== $scope.msg.messageId
	        });
	        if($scope.replylistAll.length>5){
	        	$scope.replylist = $scope.replylistAll.slice(0,5);
	        	$scope.loadtxt="加载更多";
	        	$scope.jsloadshow=true;
	        }
	        else{
	        	$scope.replylist = $scope.replylistAll.slice(0,5);
	        	$scope.loadtxt="没有更多了";
	        	$scope.jsloadshow=true;
	        }
	    }).catch(function(){
	        console.log('error')
	    })
	})
    $scope.dataupdata = function(){
    	param={
    		parentId:$routeParams.id,
    		content:$scope.info.content,          	          	
           	toUser:''
    	}
    	$.bootstrapLoading.start({target: "#commitModal .modal-content"});
		$http.post('/api/message', param, {headers : {'Content-Type':'application/json'},dataType: "json"}).then(function(data){		
	    	$scope.replylist.unshift({
	           	content:param.content,
	           	parentId:param.parentId,
	           	userName:$cookies.get("userName"),
	           	upCount:0,
	           	count:0,
	           	date:new Date().getTime()
       		})
	    	$scope.msg.count++
	    	$.bootstrapLoading.end();
	    	$.growl.notice({  
		       message: "评论成功!"				         
		    });
	    	$('#commitModal').modal('hide')
		    $scope.info = {
		        content:'',
		        date:new Date().getTime()
	    	}
	   }).catch(function(){
	        $.bootstrapLoading.end();
	        $.growl.error({  
		       message: "评论失败!"				         
		    });
	        $('#commitModal').modal('hide')
	    });
	  }
}])
mesgCtrls.controller('messagelistCtrl',['$cookies','$scope','$http', '$location','$rootScope', function($cookies,$scope,$http,$location,$rootScope){
   $http.get('/api/message').then(function(data){
        $scope.messagelistAll =data.data;
        if($scope.messagelistAll.length>5){
        	$scope.messagelist = $scope.messagelistAll.slice(0,5);
        	$scope.loadtxt="加载更多";
        	$scope.jsloadshow=true;
        }
        else{
        	$scope.messagelist = $scope.messagelistAll.slice(0,5);
        	$scope.loadtxt="没有更多了";
        	$scope.jsloadshow=true;
        }
    }).catch(function(){
        console.log('error')
    });
    $scope.loadfn = function(){
        $scope.loadtxt="加载中.....";
        $scope.messagelist =$scope.messagelistAll
        $scope.loadtxt="没有更多了";
    }
    $scope.info = {
        title:"",
        content:'',
        parentId:0,
        date:new Date().getTime()
    }
    $scope.response = {
        title:"",
        content:'',
        parentId:0,
        date:new Date().getTime()
    }
    $scope.getDates = function(date){
        return new Date(date);
    }
    $scope.upCount = function(message){
    	$http.get('/api/message/up/'+message.messageId).then(function(data){
	    	message.upCount++
	   	}).catch(function(){
	   	});
	 }
    $scope.$on("search", function(event,msg){
    	
    	var reg =/^\/message\/*$/
    	if($location.path().match(reg) === null)
    		return 
		$http.get(`/api/message/0/${msg}`).then(function(data){		
	        $scope.messagelistAll =data.data;
	        if($scope.messagelistAll.length>5){
	        	$scope.messagelist = $scope.messagelistAll.slice(0,5);
	        	$scope.loadtxt="加载更多";
	        	$scope.jsloadshow=true;
	        }
	        else{
	        	$scope.messagelist = $scope.messagelistAll.slice(0,5);
	        	$scope.loadtxt="没有更多了";
	        	$scope.jsloadshow=true;
	        }
	    }).catch(function(){
	        console.log('error')
	    })
	})
    $scope.dataupdata = function(parentId){
    	param={
    		parentId:parentId,
    		content:$scope.info.content,
    		title:$scope.info.title,          	          	
           	toUser:''
    	}
    	console.log(param)
    	$.bootstrapLoading.start({target: "#editModal .modal-content"});
		$http.post('/api/message', param, {headers : {'Content-Type':'application/json'},dataType: "json"}).then(function(data){		
	    	$scope.messagelist.unshift({
	           	title:$scope.info.title,
	           	content:$scope.info.content,
	           	parentId:parentId,
	           	userName:$cookies.get("userName"),
	           	upCount:0,
	           	count:0,
	           	date:new Date().getTime()
       		})
	    	$.bootstrapLoading.end();
	    	$.growl.notice({  
		       message: "发表成功!"				         
		    });
	    	$('#editModal').modal('hide')
		    $scope.info = {
		        title:"",
		        content:'',
		        parentId:0,
		        date:new Date().getTime()
	    	}
	   }).catch(function(){
	        $.bootstrapLoading.end();
	        $.growl.error({  
		       message: "发表失败!"				         
		    });
	        $('#editModal').modal('hide')
	    });
	    
    }

}])
mesgCtrls.controller('messageEditCtrl',['$scope','$http',function($scope,$http){
   	$http.get('/api/message').then(function(data){
        $scope.messagelist =data.data;
    }).then(function(){
    	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
    }).catch(function(){
        console.log('error')
    });
    $scope.getDates = function(date){
        return new Date(date);
    }
    $scope.deleteMessage = function(messageId){
    	return function(){
	    	$http.delete(`/api/message/${messageId}`).then(function(data){
	    		$scope.messagelist=$scope.messagelist.filter(function(cur){
	    			return cur.messageId !== messageId
	    		})
	       		$.growl.notice({  
			       message: "删除成功!"				         
			    });
		    }).catch(function(){
		        $.growl.error({  
			       message: "删除失败!"				         
			    });
		    });
	    }
    }
}])
mesgCtrls.controller('messageCommitCtrl',['$scope','$http','$routeParams',function($scope,$http,$routeParams){
   	$http.get('/api/message/'+$routeParams.id).then(function(data){
        $scope.messagelist =data.data.slice(1);
    }).then(function(){
    	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
    }).catch(function(){
        console.log('error')
    });
    $scope.getDates = function(date){
        return new Date(date);
    }
    $scope.deleteMessage = function(messageId){
    	return function(){
	    	$http.delete(`/api/message/${messageId}`).then(function(data){
	    		$scope.messagelist=$scope.messagelist.filter(function(cur){
	    			return cur.messageId !== messageId
	    		})
	       		$.growl.notice({  
			       message: "删除成功!"				         
			    });
		    }).catch(function(){
		        $.growl.error({  
			       message: "删除失败!"				         
			    });
		    });
	    }
    }
}])
mesgCtrls.controller('userDetailCtrl',['$rootScope','$scope','$http',function($rootScope, $scope,$http){
    $scope.getDates = function(date){
        return new Date(date);
    }
    $scope.passRight={
    	color:'red',
    	info:''
    }
    $scope.password=''
    $scope.passwNew=''
    $scope.passwRe=''
    $scope.onchange = function(){
    	if($scope.passwNew === $scope.passwRe){
	    	$scope.passRight={
		    	color:'green',
		    	info:'√ 密码一致'
	    	}
	    }else{
	    	$scope.passRight={
		    	color:'red',
		    	info:'× 密码不一致！！'
	    	}
	    }
    }
    $scope.updatePassword = function(){
    	if($scope.passRight.color === 'red')
    		return
		param = {
			password:$scope.password,
			newPassword:$scope.passwNew,
			userName:$rootScope.curUser.userName,
			userId:$rootScope.curUser.userId
		}
		$.bootstrapLoading.start({target: "#passwordModal .modal-content"});
    	$http.put('/api/user/password',param).then(function(data){
    		if(data.data == false)
    			throw 'error'
    		$scope.passRight={
		    	color:'red',
		    	info:''
		    }
		    $scope.password=''
		    $scope.passwNew=''
		    $scope.passwRe=''
    		$.bootstrapLoading.end();
       		$.growl.notice({  
		       message: "修改成功!"				         
		    });
	    	$('#passwordModal').modal('hide')
	    }).catch(function(){
	    	$.bootstrapLoading.end();
	        $.growl.error({  
		       message: "修改失败!"				         
		    });
		    $('#passwordModal').modal('hide')
	    });
    }
}])




