package egovframework.let.rsv.service.impl;

import java.util.List;

import egovframework.let.crud2.service.Crud2VO;
import egovframework.let.rsv.service.ReservationVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("reservationMapper")
public interface ReservationMapper {

//	예약목록 가져오기
	List<EgovMap> selectReservationList(ReservationVO vo) throws Exception;

//	예약 목록수
	int selectReservationListCnt(ReservationVO vo) throws Exception;

//	예약 상세정보
	ReservationVO selectReservation(ReservationVO vo) throws Exception;

	// 예약 등록하기
	void insertReservation(ReservationVO vo) throws Exception;

	// 예약 수정하기
	void updateReservation(ReservationVO vo) throws Exception;

	// 예약 삭제하기
	void deleteReservation(ReservationVO vo) throws Exception;

}
