package kr.ed.haebeop.test;

import kr.ed.haebeop.domain.Check;
import kr.ed.haebeop.domain.CheckVO;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

public class CheckValidator2 implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return CheckVO.class.isAssignableFrom(clazz);
    }

    public void validate(Object obj, Errors error) {
        System.out.println("validate action");
        CheckVO check = (CheckVO)obj;

        // spring 에서는 패턴을 넣을 때 그냥 $가 아닌 +$를 해줘야 한다
        Pattern pat1 = Pattern.compile("^[a-z0-9]+$", Pattern.CASE_INSENSITIVE);
        Pattern pat2 = Pattern.compile("^[a-zA-Z0-9]+$", Pattern.CASE_INSENSITIVE);

        String id = check.getId();
        String pw = check.getPw();

        if(!(pat1.matcher(id).matches())){
            error.rejectValue("id", "check.id.invalid", "아이디 형식이 일치하지 않습니다.");
        }
        if(!(pat2.matcher(pw).matches())){
            error.rejectValue("pw", "check.pw.invalid", "비밀번호 형식이 올바르지 않습니다.");
        }

        if(id == null || id.trim().isEmpty()) {
            error.rejectValue("id", "not value", "아이디가 비어 있습니다.");
        }

        if(pw == null || pw.trim().isEmpty()) {
            error.rejectValue("pw", "not value", "비밀번호가 비어 있습니다.");
        }

        //id가 8~12 이하인지 확인
        if(id.length() < 5 || id.length() > 12) {
            error.rejectValue("id", "id bad size", "아이디의 글자수가 맞지 않습니다.");
        }

        //pw가 6~12자 이하인지 확인
        if(pw.length() < 8 || pw.length() > 12) {
            error.rejectValue("pw", "pw bad size", "비밀번호의 글자수가 맞지 않습니다.");
        }

    }
}
