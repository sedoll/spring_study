package kr.ed.haebeop.test;

import kr.ed.haebeop.domain.Check;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

public class CheckValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Check.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("스프링 프레임워크");
        // 발리데이션 유틸, 아이디 비밀번호 정보 확인 (스프링)
        Check check = (Check) target;
        // 아이디, 비밀번호가 값이 비어있는지 확인
        ValidationUtils.rejectIfEmpty(errors, "id", "check.id.empty", "아이디를 입력하세요");
        ValidationUtils.rejectIfEmpty(errors, "pw", "check.pw.empty", "비밀번호를 입력하세요");

        // 아이디 비밀번호 패턴 확인 (자바)
        // 아이디 패턴
        Pattern pat1 = Pattern.compile("^[a-z0-9]{5,12}$", Pattern.CASE_INSENSITIVE);
        // 비밀번호 패턴
        Pattern pat2 = Pattern.compile("^[a-zA-Z0-9]{8,12}$", Pattern.CASE_INSENSITIVE);
        if(!pat1.matcher(check.getId()).matches()) { // 아이디가 패턴에 맞지 않는 경우
            errors.rejectValue("id", "check.id.invalid"); // 에러 문구 출력
        }
        if(!pat2.matcher(check.getPw()).matches()) {
            errors.rejectValue("pw", "check.pw.invalid");
        }
    }
}
