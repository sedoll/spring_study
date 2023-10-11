package kr.ed.haebeop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.persistence.*;
import kr.ed.haebeop.repository.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.service.board.BoardParServiceImpl;
import kr.ed.haebeop.service.board.BoardServiceImpl;
import kr.ed.haebeop.service.board.BoardTeaServiceImpl;
import kr.ed.haebeop.service.info.InfoActServiceImpl;
import kr.ed.haebeop.service.info.InfoStuServiceImpl;
import kr.ed.haebeop.service.info.InfoUniServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ApplicationConfig {
    @Bean
    public UserMapper userPersistence() {
        return new UserMapperImpl();
    }

    @Bean
    public UserService userService() {
        return new UserServiceImpl();
    }

    @Bean
    public TestMapper testMapper() {
        return new TestMapperImpl();
    }

    @Bean
    public TestService testService() {
        return new TestServiceImpl();
    }

    // board
    @Bean
    public BoardParServiceImpl boardParService() {return new BoardParServiceImpl();}
    @Bean
    public BoardParRepositoryImpl boardParRepository() {return new BoardParRepositoryImpl();}
    @Bean
    public BoardTeaServiceImpl boardTeaService() {return new BoardTeaServiceImpl();}
    @Bean
    public BoardTeaRepositoryImpl boardTeaRepository() {return new BoardTeaRepositoryImpl();}
    @Bean
    public BoardRepositoryImpl boardRepository() {return new BoardRepositoryImpl();}
    @Bean
    public BoardServiceImpl boardService() {return new BoardServiceImpl();}

    // faq
    @Bean
    public FaqRepository faqRepository() {return new FaqRepositoryImpl();}
    @Bean
    public FaqService faqService() {return new FaqServiceImpl();}

    // file
    @Bean
    public FileRepository fileRepository() {return new FileRepositoryImpl();}
    @Bean FileService fileService() { return new FileServiceImpl(); }

    // grade
    @Bean
    public GradeRepository gradeRepository() {return new GradeRepositoryImpl();}
    @Bean
    public GradeService gradeService() {return new GradeServiceImpl();}

    //info
    @Bean
    public InfoActRepositoryImpl infoActRepository() {return new InfoActRepositoryImpl();}
    @Bean
    public InfoStuRepositoryImpl infoStuRepository() {return new InfoStuRepositoryImpl();}
    @Bean
    public InfoUniRepositoryImpl infoUniRepository() {return new InfoUniRepositoryImpl();}
    @Bean
    public InfoActServiceImpl infoActService() { return new InfoActServiceImpl();}
    @Bean
    public InfoStuServiceImpl infoStuService() {return new InfoStuServiceImpl();}
    @Bean
    public InfoUniServiceImpl infoUniService() {return new InfoUniServiceImpl();}

    //member
    @Bean
    public MemberRepository memberRepository() { return new MemberRepositoryImpl(); }
    @Bean
    public MemberService memberService() {return new MemberServiceImpl(); }

    // menu
    @Bean
    public MenuRepository menuRepository() {return new MenuRepositoryImpl();}
    @Bean
    public MenuServiceImpl menuServiceImpl() {return new MenuServiceImpl();}
    @Bean
    public MenuServiceImpl2 menuServiceImpl2() {return new MenuServiceImpl2();}

    //notice
    @Bean
    public NoticeRepository noticeRepository() {return new NoticeRepositoryImpl();}
    @Bean
    public NoticeService noticeService() {return new NoticeServiceImpl();}

    // qna
    @Bean
    public QnaRepository qnaRepository() {return new QnaRepositoryImpl();}
    @Bean
    public QnaService qnaService() {return new QnaServiceImpl();}

    // cart
    @Bean
    public CartService cartService() {return new CartServiceImpl();}

    //product
    @Bean
    public ProductServiceImpl productService() {return new ProductServiceImpl();}

    @Bean
    public ObjectMapper mapper() { return new ObjectMapper(); }
}
