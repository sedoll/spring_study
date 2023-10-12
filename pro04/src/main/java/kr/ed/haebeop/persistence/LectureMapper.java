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
    @Insert("INSERT INTO lecture VALUES (default, #{title}, #{content}, #{simg}, #{sfile1}, #{sfile2}, #{sfile3}, #{sfile4}, #{sfile5}, #{sno}, #{ino}, default, default, #{lec_max}, #{aplctClss1}, #{aplctClss2}, #{studyStart}, #{studyEnd})")
    @Options(useGeneratedKeys=true, keyProperty="no")
    public int addLecture(Lecture lec);
    @Update("UPDATE lecture SET cate = #{cate}, pname = #{pname}, pcomment = #{pcomment}, plist = #{plist}, price = #{price}, imgsrc1 = #{imgSrc1}, resdate = #{resdate} WHERE no = #{no}")
    public int updateLecture(Lecture lec);
    @Delete("DELETE FROM lecture WHERE no = #{no}")
    public int delLecture(int no);
    @Select("SELECT * FROM lecture ORDER BY price DESC")
    public List<Lecture> getLectureListBest();
    @Select("SELECT * FROM lecture ORDER BY resdate DESC")
    public List<Lecture> getLectureListNew();
}
