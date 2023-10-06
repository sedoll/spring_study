package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.ChatRoom;
import kr.ed.haebeop.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat/")
public class ChatController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private final ChatService service;

    @GetMapping("home")
    public String loadHome(Model model){
        return "/chat/home";
    }

    @PostMapping("createRoom")
    @ResponseBody
    public ChatRoom createRoom(@RequestParam String name){
        logger.info("createRoom Start");
        return service.createRoom(name);
    }

    @GetMapping("allRoom")
    @ResponseBody
    public List<ChatRoom> findAllRooms(){
        return service.findAllRoom();
    }
}