package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Infomation;

import java.util.List;

public interface InfoRepository {
    public List<Infomation> infoList() throws Exception;
    public Infomation infoDetail(int bno) throws Exception;
    public void infoInsert(Infomation dto) throws Exception;
    public void infoDelete(int bno) throws Exception;
    public void infoEdit(Infomation dto) throws Exception;
}
