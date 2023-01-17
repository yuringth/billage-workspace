<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	*, *::after, *::before {
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box;
	}
	
	*::after, *::before {
	  content: '';
	}
	
	body {
	  font-size: 100%;
	  font-family: "Open Sans", sans-serif;
	  color: #4e5359;
	  background-color: white;
	}
	body::after {
	  /* overlay layer visible on small devices when the right panel slides in */
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(78, 83, 89, 0.8);
	  visibility: hidden;
	  opacity: 0;
	  -webkit-transition: opacity .3s 0s, visibility 0s .3s;
	  -moz-transition: opacity .3s 0s, visibility 0s .3s;
	  transition: opacity .3s 0s, visibility 0s .3s;
	}
	body.cd-overlay::after {
	  visibility: visible;
	  opacity: 1;
	  -webkit-transition: opacity .3s 0s, visibility 0s 0s;
	  -moz-transition: opacity .3s 0s, visibility 0s 0s;
	  transition: opacity .3s 0s, visibility 0s 0s;
	}
	@media only screen and (min-width: 768px) {
	  body::after {
	    display: none;
	  }
	}
	
	a {
	  color: #a9c056;
	  text-decoration: none;
	}
	
	header {
	  position: relative;
	  height: 180px;
	  line-height: 180px;
	  text-align: center;
	  background-color: #a9c056;
	}
	header h1 {
	  color: #ffffff;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  font-size: 20px;
	  font-size: 1.25rem;
	}
	@media only screen and (min-width: 1024px) {
	  header {
	    height: 240px;
	    line-height: 240px;
	  }
	  header h1 {
	    font-size: 36px;
	    font-size: 2.25rem;
	    font-weight: 300;
	  }
	}
	
	.cd-faq {
	  width: 90%;
	  max-width: 1024px;
	  margin: 2em auto;
	  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
	  overflow: hidden;
	  *zoom: 1;
	}
	@media only screen and (min-width: 768px) {
	  .cd-faq {
	    position: relative;
	    margin: 4em auto;
	    box-shadow: none;
	  }
	}
	
	.cd-faq-categories a {
	  position: relative;
	  display: block;
	  overflow: hidden;
	  height: 50px;
	  line-height: 50px;
	  padding: 0 28px 0 16px;
	  background-color: #4e5359;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  color: #ffffff;
	  white-space: nowrap;
	  border-bottom: 1px solid #555b61;
	  text-overflow: ellipsis;
	}
	.cd-faq-categories a::before, .cd-faq-categories a::after {
	  /* plus icon on the right */
	  position: absolute;
	  top: 50%;
	  right: 16px;
	  display: inline-block;
	  height: 1px;
	  width: 10px;
	  background-color: #7f868e;
	}
	.cd-faq-categories a::after {
	  -moz-transform: rotate(90deg);
	  -ms-transform: rotate(90deg);
	  -webkit-transform: rotate(90deg);
	  transform: rotate(90deg);
	}
	.cd-faq-categories li:last-child a {
	  border-bottom: none;
	}
	@media only screen and (min-width: 768px) {
	  .cd-faq-categories {
	    width: 20%;
	    float: left;
	    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
	  }
	  .cd-faq-categories a {
	    font-size: 13px;
	    font-size: 0.8125rem;
	    font-weight: 600;
	    padding-left: 24px;
	    padding: 0 24px;
	    -moz-transition: background 0.2s, padding 0.2s;
	    -o-transition: background 0.2s, padding 0.2s;
	    -webkit-transition: background 0.2s, padding 0.2s;
	    transition: background 0.2s, padding 0.2s;
	  }
	  .cd-faq-categories a::before, .cd-faq-categories a::after {
	    display: none;
	  }
	  .no-touch .cd-faq-categories a:hover {
	    background: #555b61;
	  }
	  .no-js .cd-faq-categories {
	    width: 100%;
	    margin-bottom: 2em;
	  }
	}
	@media only screen and (min-width: 1024px) {
	  .cd-faq-categories {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 210px;
	    z-index: 2;
	  }
	  .cd-faq-categories a::before {
	    /* decorative rectangle on the left visible for the selected item */
	    display: block;
	    top: 0;
	    right: auto;
	    left: 0;
	    height: 100%;
	    width: 3px;
	    background-color: #a9c056;
	    opacity: 0;
	    -moz-transition: opacity 0.2s;
	    -o-transition: opacity 0.2s;
	    -webkit-transition: opacity 0.2s;
	    transition: opacity 0.2s;
	  }
	  .cd-faq-categories .selected {
	    background: #42464b !important;
	  }
	  .cd-faq-categories .selected::before {
	    opacity: 1;
	  }
	  .cd-faq-categories.is-fixed {
	    /* top and left value assigned in jQuery */
	    position: fixed;
	  }
	  .no-js .cd-faq-categories {
	    position: relative;
	  }
	}
	
	.cd-faq-items {
	  position: fixed;
	  height: 100%;
	  width: 90%;
	  top: 0;
	  right: 0;
	  background: #ffffff;
	  padding: 0 5% 1em;
	  overflow: auto;
	  -webkit-overflow-scrolling: touch;
	  z-index: 1;
	  -webkit-backface-visibility: hidden;
	  backface-visibility: hidden;
	  -moz-transform: translateZ(0) translateX(100%);
	  -ms-transform: translateZ(0) translateX(100%);
	  -webkit-transform: translateZ(0) translateX(100%);
	  transform: translateZ(0) translateX(100%);
	  -webkit-transition: -webkit-transform .3s;
	  -moz-transition: -moz-transform .3s;
	  transition: transform .3s;
	}
	.cd-faq-items.slide-in {
	  -moz-transform: translateZ(0) translateX(0%);
	  -ms-transform: translateZ(0) translateX(0%);
	  -webkit-transform: translateZ(0) translateX(0%);
	  transform: translateZ(0) translateX(0%);
	}
	.no-js .cd-faq-items {
	  position: static;
	  height: auto;
	  width: 100%;
	  -moz-transform: translateX(0);
	  -ms-transform: translateX(0);
	  -webkit-transform: translateX(0);
	  transform: translateX(0);
	}
	@media only screen and (min-width: 768px) {
	  .cd-faq-items {
	    position: static;
	    height: auto;
	    width: 78%;
	    float: right;
	    overflow: visible;
	    -moz-transform: translateZ(0) translateX(0);
	    -ms-transform: translateZ(0) translateX(0);
	    -webkit-transform: translateZ(0) translateX(0);
	    transform: translateZ(0) translateX(0);
	    padding: 0;
	    background: transparent;
	  }
	}
	@media only screen and (min-width: 1024px) {
	  .cd-faq-items {
	    float: none;
	    width: 100%;
	    padding-left: 220px;
	  }
	  .no-js .cd-faq-items {
	    padding-left: 0;
	  }
	}
	
	.cd-close-panel {
	  position: fixed;
	  top: 5px;
	  right: -100%;
	  display: block;
	  height: 40px;
	  width: 40px;
	  overflow: hidden;
	  text-indent: 100%;
	  white-space: nowrap;
	  z-index: 2;
	  /* Force Hardware Acceleration in WebKit */
	  -moz-transform: translateZ(0);
	  -ms-transform: translateZ(0);
	  -webkit-transform: translateZ(0);
	  transform: translateZ(0);
	  -webkit-backface-visibility: hidden;
	  backface-visibility: hidden;
	  -moz-transition: right 0.4s;
	  -o-transition: right 0.4s;
	  -webkit-transition: right 0.4s;
	  transition: right 0.4s;
	}
	.cd-close-panel::before, .cd-close-panel::after {
	  /* close icon in CSS */
	  position: absolute;
	  top: 16px;
	  left: 12px;
	  display: inline-block;
	  height: 3px;
	  width: 18px;
	  background: #6c7d8e;
	}
	.cd-close-panel::before {
	  -moz-transform: rotate(45deg);
	  -ms-transform: rotate(45deg);
	  -webkit-transform: rotate(45deg);
	  transform: rotate(45deg);
	}
	.cd-close-panel::after {
	  -moz-transform: rotate(-45deg);
	  -ms-transform: rotate(-45deg);
	  -webkit-transform: rotate(-45deg);
	  transform: rotate(-45deg);
	}
	.cd-close-panel.move-left {
	  right: 2%;
	}
	@media only screen and (min-width: 768px) {
	  .cd-close-panel {
	    display: none;
	  }
	}
	
	.cd-faq-group {
	  /* hide group not selected */
	  display: none;
	}
	.cd-faq-group.selected {
	  display: block;
	}
	.cd-faq-group .cd-faq-title {
	  background: transparent;
	  box-shadow: none;
	  margin: 1em 0;
	}
	.no-touch .cd-faq-group .cd-faq-title:hover {
	  box-shadow: none;
	}
	.cd-faq-group .cd-faq-title h2 {
	  text-transform: uppercase;
	  font-size: 12px;
	  font-size: 0.75rem;
	  font-weight: 700;
	  color: #bbbbc7;
	}
	.no-js .cd-faq-group {
	  display: block;
	}
	@media only screen and (min-width: 768px) {
	  .cd-faq-group {
	    /* all groups visible */
	    display: block;
	  }
	  .cd-faq-group > li {
	    background: #ffffff;
	    margin-bottom: 6px;
	    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
	    -moz-transition: box-shadow 0.2s;
	    -o-transition: box-shadow 0.2s;
	    -webkit-transition: box-shadow 0.2s;
	    transition: box-shadow 0.2s;
	  }
	  .no-touch .cd-faq-group > li:hover {
	    box-shadow: 0 1px 10px rgba(108, 125, 142, 0.3);
	  }
	  .cd-faq-group .cd-faq-title {
	    margin: 2em 0 1em;
	  }
	  .cd-faq-group:first-child .cd-faq-title {
	    margin-top: 0;
	  }
	}
	
	.cd-faq-trigger {
	  position: relative;
	  display: block;
	  margin: 1.6em 0 .4em;
	  line-height: 1.2;
	}
	@media only screen and (min-width: 768px) {
	  .cd-faq-trigger {
	    font-size: 24px;
	    font-size: 1.5rem;
	    font-weight: 300;
	    margin: 0;
	    padding: 24px 72px 24px 24px;
	  }
	  .cd-faq-trigger::before, .cd-faq-trigger::after {
	    /* arrow icon on the right */
	    position: absolute;
	    right: 24px;
	    top: 50%;
	    height: 2px;
	    width: 13px;
	    background: #cfdca0;
	    -webkit-backface-visibility: hidden;
	    backface-visibility: hidden;
	    -moz-transition-property: -moz-transform;
	    -o-transition-property: -o-transform;
	    -webkit-transition-property: -webkit-transform;
	    transition-property: transform;
	    -moz-transition-duration: 0.2s;
	    -o-transition-duration: 0.2s;
	    -webkit-transition-duration: 0.2s;
	    transition-duration: 0.2s;
	  }
	  .cd-faq-trigger::before {
	    -moz-transform: rotate(45deg);
	    -ms-transform: rotate(45deg);
	    -webkit-transform: rotate(45deg);
	    transform: rotate(45deg);
	    right: 32px;
	  }
	  .cd-faq-trigger::after {
	    -moz-transform: rotate(-45deg);
	    -ms-transform: rotate(-45deg);
	    -webkit-transform: rotate(-45deg);
	    transform: rotate(-45deg);
	  }
	  .content-visible .cd-faq-trigger::before {
	    -moz-transform: rotate(-45deg);
	    -ms-transform: rotate(-45deg);
	    -webkit-transform: rotate(-45deg);
	    transform: rotate(-45deg);
	  }
	  .content-visible .cd-faq-trigger::after {
	    -moz-transform: rotate(45deg);
	    -ms-transform: rotate(45deg);
	    -webkit-transform: rotate(45deg);
	    transform: rotate(45deg);
	  }
	}
	
	.cd-faq-content p {
	  font-size: 14px;
	  font-size: 0.875rem;
	  line-height: 1.4;
	  color: #6c7d8e;
	}
	@media only screen and (min-width: 768px) {
	  .cd-faq-content {
	    display: none;
	    padding: 0 24px 30px;
	  }
	  .cd-faq-content p {
	    line-height: 1.6;
	  }
	  .no-js .cd-faq-content {
	    display: block;
	  }
	}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<section class="cd-faq">
	  <ul class="cd-faq-categories">
	  	<li><a>FAQ(자주묻는질문)</a></li>
	    <li><a class="selected" href="#basics">모임</a></li>
	    <li><a href="#mobile">연재/공모전</a></li>
	    <li><a href="#account">대여/중고</a></li>
	    <li><a href="#payments">추첨/경매</a></li>
	    <li><a href="#privacy">사이트이용</a></li>
	    <li><a href="#delivery">리뷰/기타</a></li>
	  </ul>
	  <!-- cd-faq-categories-->
	  <div class="cd-faq-items">
	    <ul class="cd-faq-group" id="basics">
	      <li class="cd-faq-title">
	        <h1>모임</h1>
	      </li>
	      <c:forEach items="${ faq }" var="f">
	      <c:if test="${ f.faqType eq '모임' }">
	      <li><a class="cd-faq-trigger" href="#0">${f.faqTitle}</a>
	        <div class="cd-faq-content">
	          <p>${f.faqAnswer}</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      </c:if>
	    </c:forEach>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="mobile">
	      <li class="cd-faq-title">
	        <h1>연재/공모전</h1>
	      </li>
	      <c:forEach items="${ faq }" var="f">
	      <c:if test="${ f.faqType eq '연재/공모전' }">
	      <li><a class="cd-faq-trigger" href="#0">${f.faqTitle}</a>
	        <div class="cd-faq-content">
	          <p>${f.faqAnswer}</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      </c:if>
	    </c:forEach>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="account">
	      <li class="cd-faq-title">
	        <h1>대여/중고</h1>
	      <c:forEach items="${ faq }" var="f">
	      <c:if test="${ f.faqType eq '대여/중고' }">
	      <li><a class="cd-faq-trigger" href="#0">${f.faqTitle}</a>
	        <div class="cd-faq-content">
	          <p>${f.faqAnswer}</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      </c:if>
	    </c:forEach>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="payments">
	      <li class="cd-faq-title">
	        <h1>추첨/경매</h1>
	      </li>
	      <c:forEach items="${ faq }" var="f">
	      <c:if test="${ f.faqType eq '추첨/경매' }">
	      <li><a class="cd-faq-trigger" href="#0">${f.faqTitle}</a>
	        <div class="cd-faq-content">
	          <p>${f.faqAnswer}</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      </c:if>
	    </c:forEach>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="privacy">
	      <li class="cd-faq-title">
	        <h1>사이트이용</h1>
	      </li>
	      <c:forEach items="${ faq }" var="f">
	      <c:if test="${ f.faqType eq '사이트이용' }">
	      <li><a class="cd-faq-trigger" href="#0">${f.faqTitle}</a>
	        <div class="cd-faq-content">
	          <p>${f.faqAnswer}</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      </c:if>
	    </c:forEach>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="delivery">
	      <li class="cd-faq-title">
	        <h1>리뷰/기타</h1>
	      </li>
	      <c:forEach items="${ faq }" var="f">
	      <c:if test="${ f.faqType eq '리뷰/기타' }">
	      <li><a class="cd-faq-trigger" href="#0">${f.faqTitle}</a>
	        <div class="cd-faq-content">
	          <p>${f.faqAnswer}</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      </c:if>
	    </c:forEach>
	    </ul>
	    <!-- cd-faq-group-->
	  </div>
	  <!-- cd-faq-items--><a class="cd-close-panel" href="#0">Close</a>
	</section>
	<!-- cd-faq-->
	
	<jsp:include page="../../common/footer.jsp"/>
	
	<script>
	jQuery(document).ready(function($){
		//update these values if you change these breakpoints in the style.css file (or _layout.scss if you use SASS)
		var MqM= 768,
			MqL = 1024;
	
		var faqsSections = $('.cd-faq-group'),
			faqTrigger = $('.cd-faq-trigger'),
			faqsContainer = $('.cd-faq-items'),
			faqsCategoriesContainer = $('.cd-faq-categories'),
			faqsCategories = faqsCategoriesContainer.find('a'),
			closeFaqsContainer = $('.cd-close-panel');
		
		//select a faq section 
		faqsCategories.on('click', function(event){
			event.preventDefault();
			var selectedHref = $(this).attr('href'),
				target= $(selectedHref);
			if( $(window).width() < MqM) {
				faqsContainer.scrollTop(0).addClass('slide-in').children('ul').removeClass('selected').end().children(selectedHref).addClass('selected');
				closeFaqsContainer.addClass('move-left');
				$('body').addClass('cd-overlay');
			} else {
		        $('body,html').animate({ 'scrollTop': target.offset().top - 19}, 200); 
			}
		});
	
		//close faq lateral panel - mobile only
		$('body').bind('click touchstart', function(event){
			if( $(event.target).is('body.cd-overlay') || $(event.target).is('.cd-close-panel')) { 
				closePanel(event);
			}
		});
		faqsContainer.on('swiperight', function(event){
			closePanel(event);
		});
	
		//show faq content clicking on faqTrigger
		faqTrigger.on('click', function(event){
			event.preventDefault();
			$(this).next('.cd-faq-content').slideToggle(200).end().parent('li').toggleClass('content-visible');
		});
	
		//update category sidebar while scrolling
		$(window).on('scroll', function(){
			if ( $(window).width() > MqL ) {
				(!window.requestAnimationFrame) ? updateCategory() : window.requestAnimationFrame(updateCategory); 
			}
		});
	
		$(window).on('resize', function(){
			if($(window).width() <= MqL) {
				faqsCategoriesContainer.removeClass('is-fixed').css({
					'-moz-transform': 'translateY(0)',
				    '-webkit-transform': 'translateY(0)',
					'-ms-transform': 'translateY(0)',
					'-o-transform': 'translateY(0)',
					'transform': 'translateY(0)',
				});
			}	
			if( faqsCategoriesContainer.hasClass('is-fixed') ) {
				faqsCategoriesContainer.css({
					'left': faqsContainer.offset().left,
				});
			}
		});
	
		function closePanel(e) {
			e.preventDefault();
			faqsContainer.removeClass('slide-in').find('li').show();
			closeFaqsContainer.removeClass('move-left');
			$('body').removeClass('cd-overlay');
		}
	
		function updateCategory(){
			updateCategoryPosition();
			updateSelectedCategory();
		}
	
		function updateCategoryPosition() {
			var top = $('.cd-faq').offset().top,
				height = jQuery('.cd-faq').height() - jQuery('.cd-faq-categories').height(),
				margin = 20;
			if( top - margin <= $(window).scrollTop() && top - margin + height > $(window).scrollTop() ) {
				var leftValue = faqsCategoriesContainer.offset().left,
					widthValue = faqsCategoriesContainer.width();
				faqsCategoriesContainer.addClass('is-fixed').css({
					'left': leftValue,
					'top': margin,
					'-moz-transform': 'translateZ(0)',
				    '-webkit-transform': 'translateZ(0)',
					'-ms-transform': 'translateZ(0)',
					'-o-transform': 'translateZ(0)',
					'transform': 'translateZ(0)',
				});
			} else if( top - margin + height <= $(window).scrollTop()) {
				var delta = top - margin + height - $(window).scrollTop();
				faqsCategoriesContainer.css({
					'-moz-transform': 'translateZ(0) translateY('+delta+'px)',
				    '-webkit-transform': 'translateZ(0) translateY('+delta+'px)',
					'-ms-transform': 'translateZ(0) translateY('+delta+'px)',
					'-o-transform': 'translateZ(0) translateY('+delta+'px)',
					'transform': 'translateZ(0) translateY('+delta+'px)',
				});
			} else { 
				faqsCategoriesContainer.removeClass('is-fixed').css({
					'left': 0,
					'top': 0,
				});
			}
		}
	
		function updateSelectedCategory() {
			faqsSections.each(function(){
				var actual = $(this),
					margin = parseInt($('.cd-faq-title').eq(1).css('marginTop').replace('px', '')),
					activeCategory = $('.cd-faq-categories a[href="#'+actual.attr('id')+'"]'),
					topSection = (activeCategory.parent('li').is(':first-child')) ? 0 : Math.round(actual.offset().top);
				
				if ( ( topSection - 20 <= $(window).scrollTop() ) && ( Math.round(actual.offset().top) + actual.height() + margin - 20 > $(window).scrollTop() ) ) {
					activeCategory.addClass('selected');
				}else {
					activeCategory.removeClass('selected');
				}
			});
		}
	});
	</script>

</body>
</html>