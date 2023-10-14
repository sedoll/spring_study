package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.persistence.PaymentMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentService {
    @Autowired
    private PaymentMapper paymentMapper;
    
    // 결제 확인
    public void paymentInsert(Payment payment){
        paymentMapper.paymentInsert(payment);
    }

    // 모든 결제 정보 리스트
    public List<Payment> paymentList(){
        return paymentMapper.paymentList();
    }

    // 해당 회원의 결제 정보
    public List<Payment> paymentMemList(String id){
        return paymentMapper.paymentMemList(id);
    }
    
    // 결제 취소
    public void paymentDelete(int sno){
        paymentMapper.paymentDelete(sno);
    }
}
