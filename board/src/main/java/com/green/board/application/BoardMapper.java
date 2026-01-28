package com.green.board.application;

import com.green.board.application.model.BoardGetOneRes;
import com.green.board.application.model.BoardGetRes;
import com.green.board.application.model.BoardPostReq;
import com.green.board.application.model.BoardPutReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/* BoardMapper 인터페이스와 BoardMapper.xml  파일을 연결한다. 연결은 xml파일에서 namespace에 인터페이스의 풀네임을 작성으로 한다.

@Mapper 애노테이션은 두 파일(인터페이스, xml)의 내용으로 인터페이스를 implements한 클래스를 만들고 그 클래스를 빈 등록 한다. 빈 등록을 하면 스프링 컨테이너가 해당 클래스를 싱글톤으로 객체화하고 주소값을 가지고 있는다. 그리고 주소값을 달라고 하면 DI해준다.

insert, update, delete 즉, select를 제외하고는 리턴타입은 무조건 int로 하면된다.
int값이 affectedRows값이다. 영향받은 행 값.
 */
@Mapper
public interface BoardMapper {
    int save(BoardPostReq req); // 메소드명은 xml파일에 id이름하고 같아야한다.
    List<BoardGetRes> findAll();
    BoardGetOneRes findById(int id);
    int update(BoardPutReq req);
    int delete(int id);
}
