package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Payment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface PaymentMapper {
    // 결제 확인
    @Insert("insert into payment values (default, #{id}, #{lec_no}, #{lec_name}, #{pmethod}, #{pcom}, #{cnum}, #{price})")
    public void paymentInsert(Payment payment);
    
    // 모든 결제 정보 리스트
    @Select("select * from payment order by sno desc")
    public List<Payment> paymentList();
    
    // 해당 회원의 결제 정보
    @Select("select * from payment where id=#{id}")
    public List<Payment> paymentMemList(String id);

    @Select("delete from payment where sno=#{sno}")
    public void paymentDelete(int sno);
}
