package com.green.board.application;

import com.green.board.application.model.BoardGetOneRes;
import com.green.board.application.model.BoardGetRes;
import com.green.board.application.model.BoardPostReq;
import com.green.board.application.model.BoardPutReq;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/* 서버가 기동되면 @Service 애노테이션을 가지고 있는 클래스는
싱글톤 객체화가 된다. 스프링 컨테이너가 객체화를 한다.
스프링 컨테이너는 객체의 주소값을 저장하고 있다.
그리고 누군가 해당 객체의 주소값을 달라고 하면 DI해준다.
애노테이션을 붙이는 행위는 빈(Bean) 등록이라 한다.

서비스의 역할은 로직처리 + DB담당자한테 이래라 저래라 할거다.

싱글톤이란 객체 지향 프로그래밍에서 하나의 클래스에 단 하나의 인스턴스(객체)만 생성되도록 보장하고, 어디서든 그 유일한 인스턴스에 접근할 수 있게 하는 디자인 패턴
 */
@Service
@RequiredArgsConstructor //final붙은 애들만 파라미터로 만든 생성자를 만든다.
public class BoardService {
    private final BoardMapper boardMapper;

    public int postBoard(BoardPostReq req) {
        return boardMapper.save(req);
    }

    public List<BoardGetRes> getBoardList() {
        return boardMapper.findAll();
    }

    public BoardGetOneRes getBoardOne(int id) {
        return boardMapper.findById(id);
    }

    public int putBoard(BoardPutReq req) {
        return boardMapper.update(req);
    }

    public int delBoard(int id) {
        return boardMapper.delete(id);
    }

}
