package kr.ed.haebeop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.rmi.ServerException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/file/")
public class FileController {
    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    
    // 개발 환경에서 테스트할 때 사용하는 파일 업로드 코드
    @GetMapping("fileUpload")
    public String uploadForm() {return "/file/fileUpload";}
    
    // 이미지 업로드 처리, 
    // 한 개의 파일 전송
    @PostMapping("fileUpload")
    public String upload(MultipartHttpServletRequest multipartHttpServletRequest) throws ServletException, IOException {
        List<MultipartFile> fileList =multipartHttpServletRequest.getFiles("file");
        String uploadPath = "D:\\spring_study\\study5\\src\\main\\webapp\\resources\\upload"; // webapp/resources/upload 절대 경로
        log.info("파일 개수: " + fileList.size());
        for(MultipartFile multipartFile : fileList) {
            if(multipartFile.isEmpty()) continue;
            String uploadFileName = multipartFile.getOriginalFilename();
            log.info("업로드 파일 경로 및 이름 : " + uploadFileName);
            multipartFile.transferTo(new File(uploadPath, uploadFileName));
        }
        return "/";
    }
    
    // 실제 서버에서 구동할 때 사용하는 파일 업로드 코드
    @GetMapping("fileUpload2")
    public String uploadForm2() { return "/file/fileUpload2"; }

    // List<MultipartFile> 여기에 사용하는 이름은 연결된 jsp 내의 form의 file name 속성과 같이 사용해야 한다.
    // 다중 파일 전송
    @PostMapping("fileUpload2")
    public String upload2(HttpServletRequest request, RedirectAttributes attr, List<MultipartFile> files) throws IOException {
        log.info("files 매개변수 : "+files);
        if(files != null) log.info("업로드한 첨부파일 개수 : " + files.size());
        ServletContext application = request.getSession().getServletContext();
        String realPath = application.getRealPath("/resources/upload");
        log.info("realPath : " + realPath);
        File uploadPath = new File(realPath, getDateFolder());
        if (!uploadPath.exists()) uploadPath.mkdirs(); // 운영 서버에 디렉토리가 없으면 생성
        if(files != null) {
            for(MultipartFile multipartFile : files) {
                if(multipartFile.isEmpty()) continue;
                String uploadFileName = multipartFile.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                uploadFileName = uuid.toString() + "_" + uploadFileName;
                log.info("업로드 파일 경로 및 이름 : " + uploadFileName);
                multipartFile.transferTo(new File(uploadPath, uploadFileName));
            }
        }
        return "/";
    }

    // 실제 서버에서 구동할 때 사용하는 파일 업로드 코드
    private String getDateFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str;
    }

    // 한개의 파일 전송
    @GetMapping("fileUpload3")
    public String uploadForm3() {return "/file/fileUpload3"; }

    @ResponseBody
    @RequestMapping("/fileUpload3")
    public List<String> upload3(MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
        List<MultipartFile> fileList = multipartHttpServletRequest.getFiles("file");
        List<String> fileNames = new ArrayList<>();
        ServletContext application = multipartHttpServletRequest.getSession().getServletContext();
        String realPath = application.getRealPath("/resources/upload");
        log.info(realPath);
        File uploadPath = new File(realPath);
        log.info("realPath : " + realPath);
        for(MultipartFile multipartFile : fileList) {
            if(multipartFile.isEmpty()) continue;
            String uploadFileName = multipartFile.getOriginalFilename();
            multipartFile.transferTo(new File(uploadPath, uploadFileName));
            fileNames.add(uploadFileName);
        }
        return fileNames;
    }
}
