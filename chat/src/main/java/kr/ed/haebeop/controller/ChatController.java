package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.ChatRoom;
import kr.ed.haebeop.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {

    private final ChatService service;

    @PostMapping
    public ChatRoom createRoom(@RequestParam String name){
        return service.createRoom(name);
    }

    @GetMapping
    public List<ChatRoom> findAllRooms(){
        return service.findAllRoom();
    }
}
