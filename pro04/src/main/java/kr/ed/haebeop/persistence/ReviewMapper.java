package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ReviewMapper {
    // 모든 리뷰 불러오기
    @Select("select * from review")
    public List<Review> getReviewList();
    
    // 특정 강의 리뷰만 불러오기
    @Select("select * from review where par=#{par}")
    public List<Review> getReviewListPar(int par);
    
    // 특정 회원의 리뷰만 불러오기
    @Select("select * from review where id=#{id}")
    public List<Review> getReviewListId(String id);
    
    // 특정 회원의 강의 리뷰 불러오기
    @Select("select * from review where par=#{par} and id=#{id}")
    public Review getReview(Review review);

    // 특정 회원이 해당 강의에 리뷰를 작성했는지 안했는지 확인
    @Select("select count(*) from review where par=#{par} and id=#{id}")
    public int reviewCheck(Review review);

    // 리뷰 작성
    @Insert("insert into review values(default, #{id}, #{content}, default, #{score}, #{par})")
    public void insertReview(Review review);
    
    // 리뷰 업데이트
    @Update("update review set content=#{content}, score=#{score} where id=#{id} and par=#{par}")
    public void updateReview(Review review);

    // 리뷰 삭제
    @Delete("delete from review where id=#{id} and par=#{par}")
    public void deleteReview(Review review);
}
