package com.kh.app0724.board.mapper;

import com.kh.app0724.board.vo.BoardVo;
import com.kh.app0724.board.vo.CategoryVo;
import com.kh.app0724.board.vo.PageVo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface BoardMapper {
    @Insert("""
           INSERT INTO BOARD
           (
            NO
            ,TITLE
            ,CONTENT
            ,CATEGORY_NO
           )
           VALUES
           (
           SEQ_BOARD.NEXTVAL
           , #{title}
           , #{content}
           , #{categoryNo}
           )
           """)
    int insert(BoardVo vo);

    @Select("""
            SELECT
              B.NO,
              B.TITLE,
              B.CONTENT,
              B.CREATED_AT,
              B.MODIFIED_AT,
              C.CATEGORY_NAME
            FROM
              BOARD B
            LEFT JOIN CATEGORY C ON B.CATEGORY_NO = C.CATEGORY_NO
            WHERE B.DEL_YN = 'N'
            ORDER BY B.NO DESC
            OFFSET #{offset} ROWS FETCH NEXT #{boardLimit} ROW ONLY
            """)
    List<BoardVo> selectList(PageVo pvo);

    @Select("""
            SELECT
              B.NO,
              B.TITLE,
              B.CONTENT,
              B.CREATED_AT,
              B.MODIFIED_AT,
              C.CATEGORY_NAME
            FROM
              BOARD B
            LEFT JOIN CATEGORY C ON B.CATEGORY_NO = C.CATEGORY_NO
            WHERE B.DEL_YN = 'N'
            AND B.NO = #{no}
            """)
    BoardVo selectOneByNo(String no);

    @Select("""
            SELECT
            CATEGORY_NO
            , CATEGORY_NAME
            FROM CATEGORY
            ORDER BY CATEGORY_NO ASC
            """)
    List<CategoryVo> selectCategory();

    @Select("""
            SELECT COUNT(NO)
            FROM BOARD
            """)
    int boardCount();

    @Update("""
            UPDATE
                BOARD
            SET
                TITLE = #{title},
                CONTENT = #{content},
                CATEGORY_NO = #{categoryNo},
                MODIFIED_AT = SYSDATE
            WHERE NO = #{no}
            AND DEL_YN = 'N'
            """)
    int update(BoardVo vo);

    @Update("""
            UPDATE
                BOARD
            SET DEL_YN = 'Y'
            WHERE NO = #{no}
            """)
    int delete(BoardVo vo);
}