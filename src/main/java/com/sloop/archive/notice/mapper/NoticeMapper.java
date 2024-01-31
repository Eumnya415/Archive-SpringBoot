package com.sloop.archive.notice.mapper;

import com.sloop.archive.notice.domain.NoticeDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NoticeMapper {
    // 공지사항 목록 조회
    @Select("SELECT * FROM tb_notice WHERE delete_flag = 0 ORDER BY pinned DESC, id DESC LIMIT #{start}, #{pageSize}")
    List<NoticeDTO> getNoticeList(@Param("start") int start, @Param("pageSize") int pageSize);

    // 전체 게시글 수 조회
    @Select("SELECT COUNT(*) FROM tb_notice WHERE delete_flag = 0")
    int getTotalCount();

    @Select("SELECT * FROM tb_notice WHERE id = #{id} AND delete_flag = 0")
    NoticeDTO getNoticeById(Long id);

    @Insert("INSERT INTO tb_notice (user_id, title, content, views, register_date, pinned) VALUES (#{userId}, #{title}, #{content}, #{views}, #{register_date}, #{pinned})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void saveNotice(NoticeDTO notice);

    @Update("UPDATE tb_notice SET title = #{title}, content = #{content}, update_date = CURRENT_TIMESTAMP, update_flag = 1 WHERE id = #{id}")
    void updateNotice(NoticeDTO notice);

    @Update("UPDATE tb_notice SET delete_flag = 1, delete_date = CURRENT_TIMESTAMP WHERE id = #{id}")
    void deleteNotice(Long id);


    // 중요 표시된 글을 맨 위로 정렬하여 공지사항 목록 조회
    @Select("SELECT * FROM tb_notice WHERE delete_flag = 0 ORDER BY pinned DESC, id DESC LIMIT #{start}, #{pageSize}")
    List<NoticeDTO> getAllNoticePinnedFirst(@Param("start") int start, @Param("pageSize") int pageSize);

}
