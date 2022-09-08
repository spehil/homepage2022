package egovframework.let.temp.service.impl;
import egovframework.let.temp.service.TempVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;


@Repository("tempDAO")
public class TempDAO extends EgovAbstractDAO {

    
    public TempVO selectTemp(TempVO vo) throws Exception {
    	return (TempVO)select("TempDAO.selectTemp", vo);
    }
    
    
}
