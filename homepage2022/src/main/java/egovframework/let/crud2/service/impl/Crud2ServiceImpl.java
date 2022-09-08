package egovframework.let.crud2.service.impl;


import egovframework.let.crud.service.CrudService;
import egovframework.let.crud2.service.Crud2Service;
import egovframework.let.crud2.service.Crud2VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("crud2Service")
public class Crud2ServiceImpl extends EgovAbstractServiceImpl implements Crud2Service {

    @Resource(name="crud2Mapper")
	private Crud2Mapper crud2Mapper;
    
    @Resource(name = "egovCrudIdGnrService")
    private EgovIdGnrService idgenService;
    
	//CRUD 목록 가져오기
	public List<EgovMap> selectCrudList(Crud2VO vo) throws Exception {
		return crud2Mapper.selectCrudList(vo);
	}
	
	//CRUD 목록 수
	public int selectCrudListCnt(Crud2VO vo) throws Exception {
		return crud2Mapper.selectCrudListCnt(vo);
	}
	
	//CRUD 등록하기
	public String insertCrud(Crud2VO vo) throws Exception{
		String id = idgenService.getNextStringId();
		vo.setCrudId(id);
		crud2Mapper.insertCrud(vo);
		
		return id;
	}
	
	//CRUD 가져오기
	public Crud2VO selectCrud(Crud2VO vo) throws Exception{
		return crud2Mapper.selectCrud(vo);
	}
	
	//CRUD 수정하기
	public void updateCrud(Crud2VO vo) throws Exception{
		crud2Mapper.updateCrud(vo);
	}
	
	//CRUD 삭제하기
	public void deleteCrud(Crud2VO vo) throws Exception{
		crud2Mapper.deleteCrud(vo);
	}
	
	
}
