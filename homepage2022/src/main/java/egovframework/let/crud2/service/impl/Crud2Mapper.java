package egovframework.let.crud2.service.impl;

import java.util.List;

import egovframework.let.crud.service.CrudVO;
import egovframework.let.crud2.service.Crud2VO;
import egovframework.let.temp2.service.Temp2VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("crud2Mapper")
public interface Crud2Mapper {
	
	//CRUD 목록 가져오기
	List<EgovMap> selectCrudList(Crud2VO vo) throws Exception;
	
	//CRUD 목록 수
	int selectCrudListCnt(Crud2VO vo) throws Exception;
	
	//CRUD 등록
	void insertCrud(Crud2VO vo) throws Exception;
	
	//CRUD 상세
	Crud2VO selectCrud(Crud2VO vo) throws Exception;
	
	//CRUD 수정하기
	void updateCrud(Crud2VO vo) throws Exception;
	
	//CRUD 삭제하기
	void deleteCrud(Crud2VO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
}
