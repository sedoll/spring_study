package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface LectureMapper {
    @Select("SELECT * FROM lecture")
    public List<Lecture> getLectureList();
    @Select("SELECT * FROM lecture WHERE no = #{no}")
    public Lecture getLecture(int no);
    @Insert("INSERT INTO lecture VALUES (default, #{cate}, #{slevel}, #{title}, #{content}, #{simg}, #{sfile1}, #{sfile2}, #{sfile3}, #{sfile4}, #{sfile5}, #{price}, #{ino}, default, default, #{lec_max}, #{aplctClss1}, #{aplctClss2}, #{studyStart}, #{studyEnd})")
    @Options(useGeneratedKeys=true, keyProperty="no")
    public void addLecture(Lecture lec);
    @Update("UPDATE lecture SET cate = #{cate}, pname = #{pname}, pcomment = #{pcomment}, plist = #{plist}, price = #{price}, imgsrc1 = #{imgSrc1}, resdate = #{resdate} WHERE no = #{no}")
    public void updateLecture(Lecture lec);
    @Delete("DELETE FROM lecture WHERE no = #{no}")
    public void delLecture(int no);
    @Select("SELECT * FROM lecture ORDER BY price DESC")
    public List<Lecture> getLectureListBest();
    @Select("SELECT * FROM lecture ORDER BY resdate DESC")
    public List<Lecture> getLectureListNew();
    @Update("update lecture set cnt=cnt+1 where no=#{no}")
    public void countUp(int no);

    // 수강인원 +1
    @Update("update lecture lec cnt=cnt+1 where no=#{no}")
    public void countUpMem(int no);

    // 수강인원 -1
    @Update("update lecture lec cnt=cnt-1 where no=#{no}")
    public void countDownMem(int no);
}
