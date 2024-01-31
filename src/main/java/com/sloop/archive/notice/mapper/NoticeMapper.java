package com.sloop.archive.notice.mapper;

import com.sloop.archive.notice.domain.NoticeDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NoticeMapper {
    @Select("SELECT * FROM tb_notice WHERE delete_flag = 0 ORDER BY pinned DESC, id DESC")
    List<NoticeDTO> getAllNoticePinnedFirst();

    @Select("SELECT * FROM tb_notice WHERE id = #{id} AND delete_flag = 0")
    NoticeDTO getNoticeById(Long id);

    @Insert("INSERT INTO tb_notice (user_id, title, content, views, register_date, pinned) VALUES (#{userId}, #{title}, #{content}, #{views}, #{register_date}, #{pinned})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void saveNotice(NoticeDTO notice);

    @Update("UPDATE tb_notice SET title = #{title}, content = #{content}, update_date = CURRENT_TIMESTAMP, update_flag = 1 WHERE id = #{id}")
    void updateNotice(NoticeDTO notice);

    @Update("UPDATE tb_notice SET delete_flag = 1, delete_date = CURRENT_TIMESTAMP WHERE id = #{id}")
    void deleteNotice(Long id);

}
