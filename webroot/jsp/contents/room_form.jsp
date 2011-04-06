<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

  		  <form method="post" action="saveUpdateRoom.action" class="yform json full" role="application">
            <fieldset>
              <legend>Room details</legend>
              <div class="c50l">
              	<input type="hidden" name="redirect_form" value="findAllRooms.action?sect=accomodation" />
              	<input type="hidden" name="room.id" value="<s:property value="id"/>"/>
           	 	<div class="c50l">
           	 	  <div class="type-text">
                  	<label for="roomName">Room name: <sup title="This field is mandatory.">*</sup></label>
                  	<input class="required" type="text" name="room.name" id="roomName" value="<s:property value="#eachRoom.name"/>" size="20" />
             	  </div>
                  <div class="type-text">
                  	<label for="roomType">Room type: <sup title="This field is mandatory.">*</sup></label>
                  	<input class="required" type="text" name="room.roomType" id="roomType" value="<s:property value="#eachRoom.roomType"/>" size="20" />
             	  </div>
             	  <div class="type-text">
                  	<label for="roomPrice">Price: &euro; <sup title="This field is mandatory.">*</sup></label>
                  	<input class="required number" type="text" name="room.price" id="roomPrice" value="<s:property value="#eachRoom.price"/>" size="20" />
             	  </div>
             	  <div class="type-text">
                  	<label for="roomMaxGuests">Max Guests: <sup title="This field is mandatory.">*</sup></label>
                  	<input class="required number" type="text" name="room.maxGuests" id="roomMaxGuests" value="<s:property value="#eachRoom.maxGuests"/>" size="20" />
             	  </div>
             	  <div class="type-text">
                  	<label for="roomNotes">Notes:</label> 
                  	<textarea name="room.notes" id="notes"><s:property value="#eachRoom.notes"/></textarea>
                  </div>
         	 	
                  <div class="type-button">
            		<button class="btn_save">SAVE</button>
           		 	<button class="btn_reset btn_cancel_form">CANCEL</button>
           		  </div>
              
      		    </div>		    
              </div>
              
              <div class="c50l">
                <div class="subcr type-check">
               		<label for="per_parking">Facilities:</label>
                	<s:iterator value="roomFacilities" var="each">
               		  <div class="facility">
						<img width="24" height="24" src="images/room_facilities/<s:property value="fileName"/>" alt="facility"/>
						<input type="checkbox" id="<s:property value="name"/>_fac" name="facilities" value="<s:property value="id"/>"/>
						<label for="<s:property value="name"/>_fac"><s:property value="name"/></label>					
					  </div>
					</s:iterator>
				    <!-- div facility for javascript purpose-->
				  	<div class="facility" style="display: none; border-color: red;">
					  <img  width="24" height="24" src="images/room_facilities/" alt="facility"/>
					  <input type="checkbox" id="" name="" checked="checked"/>
					  <label for=""></label>
				  	</div>
				  	<!-- end div facility for javascript purpose-->
				</div>
         	  </div>
         	 
            </fieldset>
          </form>
          
         
           <div class="beautify">
   
     		           <div class="subcolumns">
           <div class="c33l">
    <label for="name_facility">Facility Name:</label>&nbsp;<input type="text" name="facility_name" value="" id="name_facility" class="require"/>
 </div>
 <div class="c20l">
 <br/>
 <form id="uploadFacility" action="uploadFacility.action" method="post" enctype="multipart/form-data">
   <input type="hidden" name="name" value=""/>
     <input type="file" name="upload" multiple/>
    <button>Upload</button>
    <div>Upload files</div>  
</form>
		   
		   <div class="result_facility_upload" id="result_facility_upload" ></div>
		   <div class="upload_loader">&nbsp;</div>
		   <div class="image_preview"></div>
		   </div>
		   </div>      

           </div>
		 		  