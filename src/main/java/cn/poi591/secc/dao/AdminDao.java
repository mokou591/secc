package cn.poi591.secc.dao;

import org.apache.ibatis.annotations.Param;

public interface AdminDao {

	void addColumnDescription(@Param("column") String column,
			@Param("id") Integer id, @Param("description") String description);

	void deleteColumnDescription(@Param("column") String column,
			@Param("id") Integer id, @Param("description") String description);

	void addEssence(@Param("column") String column, @Param("id") Integer id);

	void deleteEssence(@Param("column") String column, @Param("id") Integer id);

}
