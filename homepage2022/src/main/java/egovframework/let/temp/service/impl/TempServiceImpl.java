package egovframework.let.temp.service.impl;

import egovframework.let.temp.service.TempService;
import egovframework.let.temp.service.TempVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("tempService")
public class TempServiceImpl extends EgovAbstractServiceImpl implements TempService {

    @Resource(name="tempMapper")
	private TempMapper tempMapper;
    
    @Resource(name = "tempDAO")
    private TempDAO tempDAO;
    
	@Override
	public TempVO selectTemp(TempVO vo) throws Exception {
		return tempMapper.selectTemp(vo);
	}
	
	//임시데이터 목록 가져오기
	public List<EgovMap> selectTempList(TempVO vo) throws Exception {
		return tempMapper.selectTempList(vo);
	}
	
	//임시데이터 등록하기
	public String insertTemp(TempVO vo) throws Exception {
		tempMapper.insertTemp(vo);
		return null;
	}
	
	//임시데이터 수정하기
	public void updateTemp(TempVO vo) throws Exception{
		tempMapper.updateTemp(vo);
	}
	
	//임시데이터 삭제하기
	public void deleteTemp(TempVO vo) throws Exception{
		tempMapper.deleteTemp(vo);
	}
	
	//임시데이터 목록 수
	public int selectTempListCnt(TempVO vo) throws Exception {
		return tempMapper.selectTempListCnt(vo);
	}
	
	
	
	
	
	
	
	
	
    /*
	@Override
	public TempVO selectTemp(TempVO vo) throws Exception {
		return tempDAO.selectTemp(vo);
	}
	*/
	
}
