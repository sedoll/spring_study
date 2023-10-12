package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.service.LectureServiceImpl;
import kr.ed.haebeop.service.LectureServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {

    @Resource(name="uploadPath")
    String uploadPath;

    @Autowired
    private LectureServiceImpl lectureService;

    @RequestMapping(value = "/addLectureForm", method = RequestMethod.GET)
    public String addLectureForm(Model model) {
        String msg = "관리자의 상품 등록폼이 로딩되었습니다.";
        model.addAttribute("msg", msg);
        return "admin/addLecture";
    }

    @PostMapping("/addLecture")
    public String addLecture(HttpServletRequest req, Model model) {
        MultipartHttpServletRequest files = (MultipartHttpServletRequest) req;

        // 파일 처리
        MultipartFile simg = files.getFile("simg");
        MultipartFile sfile1 = files.getFile("sfile1");
        MultipartFile sfile2 = files.getFile("sfile2");
        MultipartFile sfile3 = files.getFile("sfile3");
        MultipartFile sfile4 = files.getFile("sfile4");
        MultipartFile sfile5 = files.getFile("sfile5");

        // 다른 폼 필드 처리
        Lecture lecture = new Lecture();
        lecture.setTitle(files.getParameter("title"));
        lecture.setContent(files.getParameter("content"));
        lecture.setSno(1);
        lecture.setIno(1);
        lecture.setLec_max(40);
        lecture.setAplctClss1(files.getParameter("aplctClss1"));
        lecture.setAplctClss2(files.getParameter("aplctClss2"));
        lecture.setStudyStart(files.getParameter("studyStart"));
        lecture.setStudyEnd(files.getParameter("studyEnd"));

        if (!simg.isEmpty()) {
            lecture.setSimg(simg.getOriginalFilename());
        } else {
            lecture.setSimg("");
        }
        if (!sfile1.isEmpty()) {
            lecture.setSfile1(sfile1.getOriginalFilename());
        } else {
            lecture.setSfile1("");
        }
        if (!sfile2.isEmpty()) {
            lecture.setSfile2(sfile2.getOriginalFilename());
        } else {
            lecture.setSfile2("");
        }
        if (!sfile3.isEmpty()) {
            lecture.setSfile3(sfile3.getOriginalFilename());
        } else {
            lecture.setSfile3("");
        }
        if (!sfile4.isEmpty()) {
            lecture.setSfile4(sfile4.getOriginalFilename());
        } else {
            lecture.setSfile4("");
        }
        if (!sfile5.isEmpty()) {
            lecture.setSfile5(sfile5.getOriginalFilename());
        } else {
            lecture.setSfile5("");
        }


        lectureService.addLecture(lecture);

        // 테스트용 파일 저장 경로
        String uploadDir = "D:/spring_study/pro04/src/main/webapp/resources/upload/";
        // 실제 서버 파일 저장 경로
        String uploadSev = req.getRealPath("/resources/upload");
        
        
        try {
            if (!simg.isEmpty()) {
                simg.transferTo(new File(uploadDir + simg.getOriginalFilename()));
                simg.transferTo(new File(uploadSev + simg.getOriginalFilename()));
            }
            if (!sfile1.isEmpty()) {
                sfile1.transferTo(new File(uploadDir + sfile1.getOriginalFilename()));
                sfile1.transferTo(new File(uploadSev + sfile1.getOriginalFilename()));
            }
            if (!sfile2.isEmpty()) {
                sfile2.transferTo(new File(uploadDir + sfile2.getOriginalFilename()));
                sfile2.transferTo(new File(uploadSev + sfile2.getOriginalFilename()));
            }
            if (!sfile3.isEmpty()) {
                sfile3.transferTo(new File(uploadDir + sfile3.getOriginalFilename()));
                sfile3.transferTo(new File(uploadSev + sfile3.getOriginalFilename()));
            }
            if (!sfile4.isEmpty()) {
                sfile4.transferTo(new File(uploadDir + sfile4.getOriginalFilename()));
                sfile4.transferTo(new File(uploadSev + sfile4.getOriginalFilename()));
            }
            if (!sfile5.isEmpty()) {
                sfile5.transferTo(new File(uploadDir + sfile5.getOriginalFilename()));
                sfile5.transferTo(new File(uploadSev + sfile5.getOriginalFilename()));
            }
        } catch (IOException e) {
            e.printStackTrace(); // 오류 처리
        }

        return "redirect:/lecture/lecList";
    }

    @RequestMapping(value = "/deleteLecture", method = RequestMethod.GET)
    public String deleteLecture(@RequestParam("no") int no) {
        lectureService.delLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        return "redirect:/product/proList";
    }

    @RequestMapping(value = "/likeLecture", method = RequestMethod.GET)
    public String likeLecture(Model model, @RequestParam("pno") String pno, @RequestParam("sid") String sid) {
        return "redirect:/product/getLecture?no=" + pno;
    }

    @RequestMapping(value = "/getLecture", method = RequestMethod.GET)
    public String getLecture(Model model, @RequestParam("no") int no) {
        Lecture product = lectureService.getLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("pro", product);
        return "lecture/getLecture";
    }

    @RequestMapping(value = "/updateLectureForm", method = RequestMethod.GET)
    public String updateLectureForm(Model model, @RequestParam("no") int no) {
        Lecture product = lectureService.getLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("product", product);
        return "admin/updateLecture";
    }

    @RequestMapping(value = "/updateLecture", method = RequestMethod.POST)
    public String updateLecture(Model model, @ModelAttribute Lecture product) {
        lectureService.updateLecture(product); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        return "redirect:/product/getLecture?no=" + product.getNo();
    }

    @RequestMapping(value = "/lecList", method = RequestMethod.GET)
    public String proList(Model model) {
        List<Lecture> productList = lectureService.getLectureList(); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("lecList", productList);
        return "lecture/lecList2";
    }
}
