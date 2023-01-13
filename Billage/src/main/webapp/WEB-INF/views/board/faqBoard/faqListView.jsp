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
	    <li><a href="#delivery">기타</a></li>
	  </ul>
	  <!-- cd-faq-categories-->
	  <div class="cd-faq-items">
	    <ul class="cd-faq-group" id="basics">
	      <li class="cd-faq-title">
	        <h1>모임</h1>
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Getting Started</a>
	        <div class="cd-faq-content">
	          <p>This is the foundation document for Lego V5's visual framework. All HTML is written in JADE, CSS is generated using SCSS and Javscript uses Coffeescript.</p>
	          <p>This is the foundation document for Lego V5's visual framework. All HTML is written in JADE, CSS is generated using SCSS and Javscript uses Coffeescript.</p>
	          <P>Codepen.io is used to demonstrate individual elements and modules. The naming scheme is based on BEM to create a human readable naming scheme. Selectors are not abbreviated as the extra characters for full names offers the benefit of clarity when working in teams. Abbrevtated selectros often leads to confusion and this cost outweights the ocst of a few extar characters in our markup.</P>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Colors</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cupiditate et laudantium esse adipisci consequatur modi possimus accusantium vero atque excepturi nobis in doloremque repudiandae soluta non minus dolore voluptatem enim reiciendis officia voluptates, fuga ullam? Voluptas reiciendis cumque molestiae unde numquam similique quas doloremque non, perferendis doloribus necessitatibus itaque dolorem quam officia atque perspiciatis dolore laudantium dolor voluptatem eligendi? Aliquam nulla unde voluptatum molestiae, eos fugit ullam, consequuntur, saepe voluptas quaerat deleniti. Repellendus magni sint temporibus, accusantium rem commodi?</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Fonts</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="mobile">
	      <li class="cd-faq-title">
	        <h1>연재/공모전</h2>
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Address</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Blockquote</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi tempore, placeat quisquam rerum! Eligendi fugit dolorum tenetur modi fuga nisi rerum, autem officiis quaerat quos. Magni quia, quo quibusdam odio. Error magni aperiam amet architecto adipisci aspernatur! Officia, quaerat magni architecto nostrum magnam fuga nihil, ipsum laboriosam similique voluptatibus facilis nobis? Eius non asperiores, nesciunt suscipit veniam blanditiis veritatis provident possimus iusto voluptas, eveniet architecto quidem quos molestias, aperiam eum reprehenderit dolores ad deserunt eos amet. Vero molestiae commodi unde dolor dicta maxime alias, velit, nesciunt cum dolorem, ipsam soluta sint suscipit maiores mollitia assumenda ducimus aperiam neque enim! Quas culpa dolorum ipsam? Ipsum voluptatibus numquam natus? Eligendi explicabo eos, perferendis voluptatibus hic sed ipsam rerum maiores officia! Beatae, molestias!</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Details</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="account">
	      <li class="cd-faq-title">
	        <h1>대여/중고</h1>
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How do I change my password?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis earum autem consectetur labore eius tenetur esse, in temporibus sequi cum voluptatem vitae repellat nostrum odio perspiciatis dolores recusandae necessitatibus, unde, deserunt voluptas possimus veniam magni soluta deleniti! Architecto, quidem, totam. Fugit minus odit unde ea cupiditate ab aperiam sed dolore facere nihil laboriosam dolorum repellat deleniti aliquam fugiat laudantium delectus sint iure odio, necessitatibus rem quisquam! Ipsum praesentium quam nisi sint, impedit sapiente facilis laudantium mollitia quae fugiat similique. Dolor maiores aliquid incidunt commodi doloremque rem! Quaerat, debitis voluptatem vero qui enim, sunt reiciendis tempore inventore maxime quasi fugiat accusamus beatae modi voluptates iste officia esse soluta tempora labore quisquam fuga, cum. Sint nemo iste nulla accusamus quam qui quos, vero, minus id. Eius mollitia consequatur fugit nam consequuntur nesciunt illo id quis reprehenderit obcaecati voluptates corrupti, minus! Possimus, perspiciatis!</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How do I delete my account?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo tempore soluta, minus magnam non blanditiis dolore, in nam voluptas nobis minima deserunt deleniti id animi amet, suscipit consequuntur corporis nihil laborum facere temporibus. Qui inventore, doloribus facilis, provident soluta voluptas excepturi perspiciatis fugiat odit vero! Optio assumenda animi at! Assumenda doloremque nemo est sequi eaque, ipsum id, labore rem nisi, amet similique vel autem dolore totam facilis deserunt. Mollitia non ut libero unde accusamus praesentium sint maiores, illo, nemo aliquid?</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How do I change my account settings?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">I forgot my password. How do I reset it?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum at aspernatur iure facere ab a corporis mollitia molestiae quod omnis minima, est labore quidem nobis accusantium ad totam sunt doloremque laudantium impedit similique iste quasi cum! Libero fugit at praesentium vero. Maiores non consequuntur rerum, nemo a qui repellat quibusdam architecto voluptatem? Sequi, possimus, cupiditate autem soluta ipsa rerum officiis cum libero delectus explicabo facilis, odit ullam aperiam reprehenderit! Vero ad non harum veritatis tempore beatae possimus, ex odio quo.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="payments">
	      <li class="cd-faq-title">
	        <h1>추첨/경매</h1>
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Can I have an invoice for my subscription?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Why did my credit card or PayPal payment fail?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur accusantium dolorem vel, ad, nostrum natus eos, nemo placeat quos nisi architecto rem dolorum amet consectetur molestiae reprehenderit cum harum commodi beatae necessitatibus. Mollitia a nostrum enim earum minima doloribus illum autem, provident vero et, aspernatur quae sunt illo dolorem. Corporis blanditiis, unde, neque, adipisci debitis quas ullam accusantium repudiandae eum nostrum quis! Velit esse harum qui, modi ratione debitis alias laboriosam minus eaque, quod, itaque labore illo totam aut quia fuga nemo. Perferendis ipsa laborum atque assumenda tempore aspernatur a eos harum non id commodi excepturi quaerat ullam, explicabo, incidunt ipsam, accusantium quo magni ut! Ratione, magnam. Delectus nesciunt impedit praesentium sed, aliquam architecto dolores quae, distinctio consectetur obcaecati esse, consequuntur vel sit quis blanditiis possimus dolorum. Eaque architecto doloremque aliquid quae cumque, vitae perferendis enim, iure fugiat, soluta aut!</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Why does my bank statement show multiple charges for one upgrade?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="privacy">
	      <li class="cd-faq-title">
	        <h1>사이트이용</h1>
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Can I specify my own private key?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">My files are missing! How do I get them back?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How can I access my account data?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus magni vero deserunt enim et quia in aliquam, rem tempore voluptas illo nisi veritatis quas quod placeat ipsa! Error qui harum accusamus incidunt at libero ipsum, suscipit dolorum esse explicabo in eius voluptates quidem voluptatem inventore amet eaque deserunt veniam dignissimos excepturi? Dolore, quo amet nostrum autem nemo. Sit nam assumenda, corporis ea sunt distinctio nostrum doloribus alias, beatae nesciunt dolore saepe consequuntur minima eveniet porro dolor officiis maiores ab obcaecati officia enim aliquam. Itaque fuga molestiae hic accusantium atque corporis quia id sequi enim vero? Hic aperiam sint facilis aliquam quia, accusamus tenetur earum totam enim est, error. Iusto, reiciendis necessitatibus molestias. Voluptatibus eos explicabo repellat nesciunt nam vero minima.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How can I control if other search engines can link to my profile?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	    </ul>
	    <!-- cd-faq-group-->
	    <ul class="cd-faq-group" id="delivery">
	      <li class="cd-faq-title">
	        <h1>기타</h1>
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">What should I do if my order hasn't been delivered yet?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How can I find your international delivery information?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">Who takes care of shipping?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How do returns or refunds work?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How do I use shipping profiles?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How does your UK Next Day Delivery service work?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">How does your Next Day Delivery service work?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">When will my order arrive?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
	      <li><a class="cd-faq-trigger" href="#0">When will my order ship?</a>
	        <div class="cd-faq-content">
	          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
	        </div>
	        <!-- cd-faq-content-->
	      </li>
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