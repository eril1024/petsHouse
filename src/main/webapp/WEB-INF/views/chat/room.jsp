<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>register</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #FFBB00;
			background-color: #fff;
			color: #FFBB00;
		}
		.roomList td{
			border: 1px solid #FFBB00;
			background-color: #fff;
			text-align: left;
			color: #FFBB00;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 425px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		button{
			background-color: #FFBB00;
			font-size: 14px;
			color: #000;
			border: 1px solid #000;
			border-radius: 5px;
			padding: 3px;
			margin: 3px;
		}
		.inputTable th{
			padding: 5px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
	</style>
<script type="text/javascript">
	var ws;
	
	$(document).ready(function() {
		getRoom();
		wsOpen();
	})
	
	function getRoom(){
		$.ajax({
			url: "/room/list",
			type: "get",
			success: function(result) {
				if($(result).length) {
					var content = "<tr><th class='room'>방 이름</th><th class='go'></th></tr>";
					$(result).each(function() {
						content += "<tr id='" + this + "'>";
						content += "	<td class='room'>" + this + "</td>";
						content += "	<td class='go'><button type='button' onclick='join(\"" + String(this) + "\")'>참여</button></td>";
						content += "</tr>";
					})
						$("#roomList").empty().append(content);
				}
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
	
	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/chatting/admin");
		wsEvt();
	}
	
	function wsEvt() {
		ws.onopen = function(data) {
		}
	
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			console.log(msg);
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "alert"){
					if(d.msg == "enter") {
						if(d.sessionId == $("#sessionId").val()){
							
						}else{
							var content = "";
							content += "<tr id=" + d.username + ">";
							content += "	<td class='room'>" + d.username + "</td>";
							content += "	<td class='go'><button type='button' onclick='join(\"" + d.username + "\")'>참여</button></td>";
							content += "</tr>";
							$("#roomList").append(content);
						}
					} else {
						$("#" + d.username).remove();
					}
					
						
				}else{
					console.warn("unknown type!")
				}
			}
		}
	}
	
	function join(username){
		window.open("/chat/" + username, username, "width=400px, height=600px");
	}
	
	
	
</script>
 

</head>
<body style="padding-top: 180px;">



	<!-- header -->


	<!-- Page Content -->
 
<div class="container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
	</div>
 
 
 
</body>
</html>
