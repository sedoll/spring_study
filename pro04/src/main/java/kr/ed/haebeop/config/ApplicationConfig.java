package kr.ed.haebeop.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.ed.haebeop.persistence.TestMapper;
import kr.ed.haebeop.persistence.TestMapperImpl;
import kr.ed.haebeop.persistence.UserMapper;
import kr.ed.haebeop.persistence.UserMapperImpl;
import kr.ed.haebeop.service.TestService;
import kr.ed.haebeop.service.TestServiceImpl;
import kr.ed.haebeop.service.UserService;
import kr.ed.haebeop.service.UserServiceImpl;
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

    @Bean
    public ObjectMapper mapper() { return new ObjectMapper(); }
}
