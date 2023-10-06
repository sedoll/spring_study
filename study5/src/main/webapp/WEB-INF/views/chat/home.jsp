<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<h1>Chat Application</h1>
<h2>Create a New Chat Room</h2>
<input type="text" id="roomName" placeholder="Enter room name">
<button id="createRoomButton">Create</button>

<h2>Chat Rooms</h2>
<ul id="roomList">
    <!-- 채팅방 목록이 여기에 표시됩니다. -->
</ul>

<!-- 채팅방 입장 화면 -->
<div id="chatRoom" style="display: none;">
    <h2 id="roomTitle"></h2>
    <div id="chatArea"></div>
    <input type="text" id="chatMessage" placeholder="Enter your message">
    <button id="sendMessageButton">Send</button>
</div>

<script>
    $(document).ready(function () {
        // 페이지 로딩이 완료되면 실행됩니다.
        let roomId = "";
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
                    $("#roomList").append("<li><a href='#' class='joinRoom' data-roomid='" + data.roomId + "'>" + data.name + "</a></li>");
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
                    $("#roomList").empty(); // 목록 초기화
                    data.forEach(function (room) {
                        $("#roomList").append("<li><a href='#' class='joinRoom' data-roomid='" + room.roomId + "'>" + room.name + "</a></li>");
                    });
                }
            });
        }

        // 페이지 로딩 시 채팅방 목록 불러오기
        loadChatRooms();

        // 채팅방 입장 버튼 클릭 시
        $(document).on("click", ".joinRoom", function () {

            roomId = $(this).data("roomid"); // 클릭한 방의 고유 ID 가져오기
            var roomName = $(this).text(); // 클릭한 방의 이름 가져오기

            // 채팅방 제목 변경 및 화면 표시 설정
            $("#roomTitle").text(roomName);
            $("#chatRoom").show();

            // TODO: 채팅방 입장 로직을 구현하세요.
            // WebSocket을 이용하여 채팅을 주고받는 코드를 작성해야 합니다.
        });

        // 채팅 메시지를 받았을 때 처리
        webSocket.onmessage = function (event) {
            var message = JSON.parse(event.data); // 서버에서 받은 메시지 파싱
            if (message.type === "TALK" && message.roomId === roomId) {
                // 현재 방과 메시지의 방이 동일한 경우에만 화면에 표시
                appendMessage(message.sender + ": " + message.message);
            }
        };

        // 화면에 메시지 추가하는 함수
        function appendMessage(message) {
            var chatArea = $("#chatArea");
            chatArea.append("<p>" + message + "</p>");
            // 화면에 스크롤을 최하단으로 이동시켜 새 메시지가 보이도록 합니다.
            chatArea.scrollTop(chatArea[0].scrollHeight);
        }

        // TODO: 채팅 메시지를 서버로 전송하는 코드 역시 필요합니다. (아래 예시를 참고)
        // 채팅 메시지 전송 버튼 클릭 시
        $("#sendMessageButton").click(function () {
            var sender = "사용자_이름"; // 사용자 이름 설정
            var messageType = "TALK"; // 메시지 타입 설정
            var messageText = $("#chatMessage").val(); // 채팅 메시지 내용 가져오기

            var message = {
                type: messageType,
                roomId: roomId,
                sender: sender,
                message: messageText
            };

            // 채팅 메시지를 WebSocket을 통해 서버에 전송
            webSocket.send(JSON.stringify(message));

            // 입력 필드 초기화
            $("#chatMessage").val("");
        });
    });
</script>
</body>
</html>
