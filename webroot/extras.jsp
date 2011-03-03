<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type='text/css' href='css/south-street/jquery-ui-1.8.9.custom.css' rel='stylesheet' />
  <link type="text/css" href="css/layout_sliding_door.css" rel="stylesheet"  />  
  
  <script type='text/javascript' src='js/lib/jquery-1.4.4.min.js'></script>
  <!--
    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js'></script>
  -->
  <script type='text/javascript' src='js/lib/jquery-ui-1.8.9.custom.min.js'></script>
  <script type='text/javascript' src='js/ftod.js'></script><!-- per i menu a tendina -->
  <script type='text/javascript' src='js/jquery.validate.min.js'></script>
  <script type='text/javascript' src='js/main.js'></script>
  
  <title>LOCANDA - Open Source Booking Tool</title><!-- (en) Add your meta data here -->
  <!--[if lte IE 7]>
	<link href="css/patches/patch_sliding_door.css" rel="stylesheet" type="text/css" />
  <![endif]-->
</head>
<body>
  <!-- skip link navigation -->
  <ul id="skiplinks">
    <li><a class="skip" href="#nav">Skip to navigation (Press Enter).</a></li>
    <li><a class="skip" href="#col3">Skip to main content (Press Enter).</a></li>
  </ul>
  <div class="page_margins">
    <div class="page">
      <div id="header" role="banner">
        <div id="topnav" role="contentinfo">
          <span><a href="#">Not Logged In</a> | <a href="login.jsp">Login/Signup</a></span>
        </div>
        <h1>
        <span>&nbsp;</span><em>&nbsp;</em></h1><span></span>
      </div><!-- begin: main navigation #nav -->
      <div id="nav" role="navigation">
        <div class="hlist">
          <ul>
            <li><a href="index.jsp">Planner</a></li>
            <li><a href="rooms.jsp">Accomodation</a>
            <ul class="sub_menu ui-menu ui-widget ui-widget-content ui-corner-all">
    			<li class="ui-menu-item"><a href="accomodation.jsp">ACCOMODATION</a></li>
    			<li class="ui-menu-item"><a href="extras.jsp">EXTRAS</a></li>
  			</ul>
            </li>
            <li><a href="guests.jsp">Guests</a></li>
            <li><a href="#">Reports</a></li>
            <li class="active"><strong>Settings</strong>
                <ul class="sub_menu ui-menu ui-widget ui-widget-content ui-corner-all">
    			<li class="ui-menu-item"><a href="online.jsp">ONLINE BOOKINGS</a></li>
    			<li class="ui-menu-item"><a href="seasons.jsp">SEASONS</a></li>
    			<li class="ui-menu-item"><a href="emails.jsp">EMAILS</a></li>
    			<li class="ui-menu-item"><a href="details.jsp">YOUR DETAILS</a></li>
    			<li class="ui-menu-item"><a href="discount.jsp">DISCOUNT</a></li>
  			</ul>
            </li>         
            <li><a href="#">Help</a></li>
          </ul>
        </div>
      </div><!-- end: main navigation -->
      
      <!-- begin: main content area #main -->
      <div id="main">
        <!-- begin: #col1 - first float column -->
        <div id="col1" role="complementary">
          <div id="col1_content" class="clearfix">
          </div>
        </div><!-- end: #col1 -->
        <!-- begin: #col3 static column -->
        <div id="col3" role="main">
          <div id="col3_content" class="clearfix">
          	<div class="header_section">
          	  <span class="name_section">Manage Extras</span>
      	 	</div>
      	
               <span class="yform">
                   <fieldset>
                       <legend>
                           Insert and configure extras here
                       </legend>
                       <div>
                           <button class="btn_addExtra" role="button" aria-disabled="false">
                               Add Extra
                           </button>
                       </div>
					   
                       <form method="post" action="#"  id="extraForm" role="application">
                           <div class="type-text">
                               <label for="extraFormName">
                                   Extra name <sup title="This field is mandatory.">*</sup>
                               </label>
                               <input type="text" class="required" name="extraFormName" id="extraFormName" aria-required="true"/>
                           </div>
                           <div class="type-button">
                               <button class="btn_saveExtra" role="button" type="button" aria-disabled="false">
                                   Save
                               </button>
                               <button class="btn_cancel" role="button" type="button" aria-disabled="false">
                                   Cancel
                               </button>
                           </div>	   
                       </form>
					   
                       <div id="extraList">
                           <div class="newExtra" id="newExtra">
                             <hr/>
							 <input type="text" class="renameExtraForm required" name="renameExtraForm" value=""/>
							 <a href="#" class="renameExtra" title="rename">Rename</a>
							 <a href="#" class="deleteExtra" title="delete">Delete</a>
							 
                           	 <div class="radiogroup right">
							 <input type="radio" name="rate2" value="night" checked="checked" />per Night
                             <br/>
                             <input type="radio" name="rate2" value="week" />per Week
                             <br/>
                             <input type="radio" name="rate2" value="booking" />per Booking
							 </div>
							 <div class="radiogroup right">
							 <input type="radio" name="rate1" value="room" checked="checked" />per Room
                             <br/>
                             <input type="radio" name="rate1" value="person" />per Person
                             <br/>
                             <input type="radio" name="rate1" value="item" />per Item
							 </div>
							 <div class="priceExtraForm right">
							 	Price - &euro;
							   <input type="text" name="priceExtraForm" class="required number" value=""/>
							 </div> 
                       	   </div>
                       </div>
                   </fieldset>
               </span>
		  
		  </div><!-- end: #col3_content-->
		  
          <div id="ie_clearing">
            &nbsp;
          </div><!-- End: IE Column Clearing -->
		     
        </div><!-- end: #col3 -->
      </div><!-- end: #main -->
	  
      <%@ include file="footer.jsp" %>
    </div><!-- end: #page_margins -->
  </div><!-- full skiplink functionality in webkit browsers -->
  <script src="yaml/core/js/yaml-focusfix.js" type="text/javascript">
</script>
</body>
</html>