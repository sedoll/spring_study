package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.persistence.LectureMapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureServiceImpl {

    @Autowired
    private LectureMapper lectureMapper;
    public List<Lecture> getLectureList() {
        return lectureMapper.getLectureList();
    }
    public Lecture getLecture(int no) {
        return lectureMapper.getLecture(no);
    }
    public void addLecture(Lecture lec) { lectureMapper.addLecture(lec);}
    public void updateLecture(Lecture lec) {lectureMapper.updateLecture(lec);}
    public void delLecture(int no) {
        lectureMapper.delLecture(no);
    }
    public void countUp(int no) {lectureMapper.countUp(no);}

    // 수강인원 +1
    public void countUpLec(int no) {
        lectureMapper.countUpLec(no);
    }

    // 수강인원 -1
    public void countDownLec(int no) {
        lectureMapper.countDownLec(no);
    }

//    public List<RedirectView> getReviewList(int no) {
//        ReviewDAO dao = new ReviewDAO();
//        return dao.getReviewList(no);
//    }
//
//    public List<Integer> getLikedLecturesByUser(String sid) {
//        LikeDAO likeDAO = new LikeDAO();
//        return likeDAO.getLikedLecturesByUser(sid);
//    }
//
//    public int getCntCart(String sid) {
//        CartDAO cartDAO = new CartDAO();
//        return cartDAO.cntCart(sid);
//    }
}

