package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.persistence.LectureMapper;
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
    public int addLecture(Lecture lec) {
        return lectureMapper.addLecture(lec);
    }
    public int updateLecture(Lecture lec) {
        return lectureMapper.updateLecture(lec);
    }
    public int delLecture(int no) {
        return lectureMapper.delLecture(no);
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

