package kr.ed.haebeop.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.controller.UserController;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.*;
import kr.ed.haebeop.domain.*;

@Slf4j
@Data
@Service
public class ChatService {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);


    private final ObjectMapper mapper;
    private Map<String, ChatRoom> chatRooms;


    @PostConstruct
    private void init() {
        chatRooms = new LinkedHashMap<>();
    }

    public List<ChatRoom> findAllRoom(){
        return new ArrayList<>(chatRooms.values());
    }

    public ChatRoom findRoomById(String roomId){
        return chatRooms.get(roomId);
    }

    public ChatRoom createRoom(String name) {
        logger.info("방 아이디 생성 : {}", name);
        String roomId = UUID.randomUUID().toString(); // 랜덤한 방 아이디 생성

        logger.info("방 아이디 : {}", roomId);
        // Builder 를 이용해서 ChatRoom 을 Building
        ChatRoom room = ChatRoom.builder()
                .roomId(roomId)
                .name(name)
                .build();
        logger.info("만들어진 방 정보 : {}", room.toString());
        chatRooms.put(roomId, room); // 랜덤 아이디와 room 정보를 Map 에 저장
        return room;
    }

    public <T> void sendMessage(WebSocketSession session, T message) {
        try{
            session.sendMessage(new TextMessage(mapper.writeValueAsString(message)));
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
    }
}
