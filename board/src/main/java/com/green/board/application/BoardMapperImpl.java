package com.green.board.application;

import com.green.board.application.model.BoardPostReq;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@Component //빈등록
public class BoardMapperImpl{
    private final DataSource dataSource; // Spring에서 관리하는 커넥션 풀

    public BoardMapperImpl(DataSource dataSource) {
      this.dataSource = dataSource;
    }

  public int save(BoardPostReq req) {
    // 1. SQL 문 (MyBatis XML에 정의된 내용)
    String sql = "INSERT INTO board SET title = ?, contents = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
      // 2. 커넥션 획득
      conn = dataSource.getConnection();

      // 3. Statement 준비
      pstmt = conn.prepareStatement(sql);

      // 4. 파라미터 바인딩 (MyBatis가 #{title} 등을 처리하는 과정)
      // BoardPostReq 객체의 getter를 호출하여 값을 세팅합니다.
      pstmt.setString(1, req.getTitle());
      pstmt.setString(2, req.getContents());

      // 5. 쿼리 실행 및 영향받은 행의 수 반환
      return pstmt.executeUpdate();

    } catch (SQLException e) {
      // MyBatis는 여기서 발생한 SQLException을 RuntimeException인 DataAccessException으로 전환하여 던집니다.
      throw new RuntimeException("SQL 실행 중 오류 발생", e);
    } finally {
      // 6. 자원 해제 (매우 중요)
      close(pstmt);
      close(conn);
    }
  }

  private void close(AutoCloseable resource) {
    if (resource != null) {
      try {
        resource.close();
      } catch (Exception e) {
        // 로그 처리
      }
    }
  }
}
