var app = angular.module('myApp',[]);


app.directive('mymenu',function(){
	var directive = {};
	
	directive.restrict = 'A';
	
	directive.scope = {
			run : "&run"
	}
	
	directive.link = function($scope, element, attributes) {
		
		var commenu = ' <div class="tab-naver"><ul><li class="one"><a href="#videos-container" id="videos"  class="microtabber maincolor2hover shortcut-link" microtabber run="loadBlog()" >Videos</a></li>'
					+'<li class="two"><a href="#channel-container" id="channel"  class="microtabber maincolor2hover shortcut-link" microtabber run="loadBlog()" >Channels</a></li>'
					+'<li class="three"><a href="#about-container" id="about"  class="microtabber maincolor2hover shortcut-link" microtabber run="loadBlog()" >About</a></li>'
					+'<hr></ul></div>';
		element.html(commenu)
		var container = element.find('.microtabber');
		container.click(function(e){
        	e.preventDefault();
        	var hrstyle = element.find('hr');
        	var id = ( $(this).attr('id')) ;
        	if(id === 'videos'){
        		hrstyle.css({'margin-left':'0%'});
        	}else if(id === 'channel'){
        		hrstyle.css({'margin-left':'25%'});
        	}else if(id === 'about'){
        		hrstyle.css({'margin-left':'50%'});
        	}else{
        		hrstyle.css({'margin-left':'0%'});
        	}
        	var div = ( $(this).attr('href')) ;
        	div = jQuery(div);
        	div.siblings('.microcollapse').hide();
        	div.css('display','block');
        	var position = div.position();
       	 $('html, body').animate({scrollTop:160}, 'slow');
		});
	};
    return directive;
});

app.directive('tableclicks',function(){
	alert("cused");
var directive = {};
	
	directive.restrict = 'A';
	
	directive.scope = {
			run : "&run"
	}
	
	directive.link = function($scope, element, attributes) {
		alert("cused");
		$('.acpub').on('click',function(){
			alert("cl");
		});
	}
	return directive;
})