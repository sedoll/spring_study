package kr.ed.haebeop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Controller
@RequestMapping("/locale/")
public class LocaleController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    SessionLocaleResolver sessionLocaleResolver;

    @Autowired
    MessageSource messageSource;

    @RequestMapping("lang1")
    public String callLocale(Locale locale, HttpServletRequest request, Model model) throws Exception {
        logger.info("Session locale is {}.", sessionLocaleResolver.resolveLocale(request));
        return "/test/localeTest";
    }

    @RequestMapping("lang2")
    public String callLocale2(@RequestParam("lang") String lang, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        Locale locale = new Locale(lang);
        sessionLocaleResolver.setLocale(request, response, locale);
        logger.info("Sessopm locale is {}.", sessionLocaleResolver.resolveLocale(request));
        return "/test/localeTest";
    }
}
