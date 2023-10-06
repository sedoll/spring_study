<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="${path1}/resources/css/style.css">
</head>
<body>
<div id="contentWrap">
    <nav>
		<span id="nav-header">
            chat App
        </span>
<%--        <span id="logoutBtn">로그아웃</span>--%>
    </nav>
    <div id="contentCover">
        <div id="roomWrap">
            <div id="roomMake">
                <h3>채팅방 만들기</h3>
                <input type="text" id="roomName" placeholder="방 이름">
                <br>
                <button id="createRoomButton">채팅방 생성</button>
            </div>
            <div id="roomList">
                <div id="roomHeader">채팅 방 목록</div>
                <div id="roomSelect"></div>
            </div>
        </div>
        <div id="chatWrap">
            <div id="chatHeader">Everyone</div>
            <div id="chatLog">
                <div id="msgArea" class="myMsg">

                </div>
            </div>
            <div id="chatForm">
                <input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                <button type="button" id="button-send">전송</button>
            </div>
        </div>
        <div id="memberWrap">
            <div id="memberList">
                <div id="memberHeader">사람</div>
                <div id="memberSelect"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        var username = "guest";
        $("#disconn").on("click", (e) => {
            disconnect();
        })

        $("#button-send").on("click", (e) => {
            send();
        });

        const websocket = new WebSocket("ws://localhost:8081/ws/chat");
        websocket.onmessage = onMessage;
        websocket.onopen = onOpen;
        websocket.onclose = onClose;
        function send() {
            var msgInput = $("#msg"); // 메시지 입력 필드
            var messageText = msgInput.val(); // 입력된 메시지 가져오기

            // 입력된 메시지가 비어있으면 전송하지 않음
            if (!messageText) {
                return;
            }
            console.log(messageText);

            var message = username + ":" + messageText;

            // WebSocket을 통해 서버에 메시지 전송
            websocket.send(message);

            // 입력 필드 초기화
            msgInput.val("");

            // 메시지를 msgArea에 추가
            appendMessage(message);
        }

        // 화면에 메시지 추가하는 함수
        function appendMessage(message) {
            var chatArea = $("#msgArea");
            chatArea.append("<div class='msg2'><b>" + message + "</b></div><br>");
            // 화면에 스크롤을 최하단으로 이동시켜 새 메시지가 보이도록 함
            chatArea.scrollTop(chatArea[0].scrollHeight);
        }

        //채팅창에서 나갔을 때
        function onClose(evt) {
            var str = username + ": 님이 방을 나가셨습니다.";
            websocket.send(str);
        }

        //채팅창에 들어왔을 때
        function onOpen(evt) {
            var str = username + ": 님이 입장하셨습니다.";
            websocket.send(str);
        }

        // 메세지 전송
        function onMessage(msg) {
            var data = msg.data;

            // 데이터가 비어있는지 확인
            if (!data) {
                return;
            }

            var arr = data.split(":");

            // 데이터를 분할한 후, 배열의 길이를 확인하여 문제 해결
            if (arr.length < 2) {
                console.error("Invalid message format:", data);
                return;
            }

            var sessionId = arr[0];
            var message = arr.slice(1).join(":"); // ":"로 분할된 나머지 부분을 다시 결합

            // 나머지 코드는 변경하지 않음
            var cur_session = username;

            //현재 세션에 로그인 한 사람
            console.log("cur_session : " + cur_session);
            sessionId = arr[0];
            message = arr[1];

            console.log("sessionID : " + sessionId);
            console.log("cur_session : " + cur_session);

            //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
            if(sessionId == cur_session){
                var str = "<div class='col-6'>";
                str += "<div class='alert alert-secondary'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
                str += "</div></div>";
                $("#msgArea").append(str);
            }
            else{
                var str = "<div class='col-6'>";
                str += "<div class='alert alert-warning'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
                str += "</div></div>";
                $("#msgArea").append(str);
            }
        }

        // 채팅방 생성 버튼 클릭 시
        $("#createRoomButton").click(function () {
            var roomName = $("#roomName").val(); // 입력된 채팅방 이름 가져오기

            // AJAX를 이용하여 ChatController의 createRoom API 호출
            $.ajax({
                type: "POST",
                url: "${path1}/chat/createRoom",
                data: { name: roomName }, // 파라미터로 채팅방 이름 전달
                success: function (data) {
                    // 채팅방 생성 성공 시 새로운 채팅방을 목록에 추가
                    $("#roomList").append("<div class='roomEl'><a href='#' class='joinRoom' data-roomid='" + data.roomId + "'>" + data.name + "</a></div>");
                    $("#roomName").val(""); // 입력 필드 초기화
                }
            });
        });

        // 채팅방 목록 불러오기
        function loadChatRooms() {
            // AJAX를 이용하여 ChatController의 findAllRooms API 호출
            $.ajax({
                type: "GET",
                url: "${path1}/chat/allRoom",
                success: function (data) {
                    // 채팅방 목록을 표시
                    $("#roomSelect").empty(); // 목록 초기화
                    data.forEach(function (room) {
                        $("#roomSelect").append("<div class='roomEl'> <a href='#' class='joinRoom' data-roomid='" + room.roomId + "'>" + room.name + "</a></div>");
                    });
                }
            });
        }

        // 페이지 로딩 시 채팅방 목록 불러오기
        loadChatRooms();

        $(document).on("click", ".joinRoom", function () {
            roomId = $(this).data("roomid"); // 클릭한 방의 고유 ID 가져오기
            var roomName = $(this).text(); // 클릭한 방의 이름 가져오기

            // 클릭한 방의 이름으로 #chatHeader 업데이트
            $("#chatHeader").text(roomName);

            // 채팅방 입장 로직 구현
            // WebSocket을 이용하여 채팅을 주고받는 코드를 작성해야 합니다.
        });
    });
</script>
</body>
</html>