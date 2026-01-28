package com.green.board.application;

import com.green.board.application.model.BoardGetOneRes;
import com.green.board.application.model.BoardGetRes;
import com.green.board.application.model.BoardPostReq;
import com.green.board.application.model.BoardPutReq;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController //붙은 클래스들은 빈등록(객체화) + 요청/응답 담당자가 됨.
@RequiredArgsConstructor
public class BoardController {
      private final BoardService boardService;
      //BoardService 객체 주소값을 받아서 멤버필드에 대입하는 생성자 생성
      //void를 사용하면 아래 BoardController가 비활성화 되는데 그 이유가
      //생성자를 생성할때는 void를 사용하지않는다. 사용하게되면 일반 메소드가 된다.

// @RequiredArgsConstructor를 달면 눈에 보이지는 않지만 아래 코드가 자동으로 생성됨
//      private BoardController (BoardService boardService) {
//          this.boardService = boardService;
//          System.out.println(this.boardService);
//      }

      /* 파라미터(매개변수)는 FE부터 날아오는 데이터를 받는 용도로 사용
          @RequestBody는 JSON형태로 BODY에 담겨져 있는 데이터를 받을 때 사용.
          JSON형태와 일치하는 클래스를 만들어 주면 된다. (필드명과 Key값이 같아야 한다)

       */
      @PostMapping("/board")
      public String postBoard(@RequestBody BoardPostReq req) {
          System.out.println("req: " + req);
          int result = boardService.postBoard(req);
          return result == 1 ? "성공" : "실패";
      }

      @GetMapping("/board")
      public List<BoardGetRes> getBoardList() { //()에 정보가 없으면 모든정보를 가져온다는 뜻
          return boardService.getBoardList();
      }

      @GetMapping("/board/{id}")
      public BoardGetOneRes getBoardOne(@PathVariable int id) {
          System.out.println("id: " + id);
          return boardService.getBoardOne(id);
      }

      @PutMapping("/board")
      public int putBoard(@RequestBody BoardPutReq req) {
          System.out.println("req: " + req);
          return boardService.putBoard(req);
      }

      @DeleteMapping("/board")
      public int delBoard(@RequestParam int id) {
          System.out.println("delete-id: " + id);
          return boardService.delBoard(id);
      }

}
