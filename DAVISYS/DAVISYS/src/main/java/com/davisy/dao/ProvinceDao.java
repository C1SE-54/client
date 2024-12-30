package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Province;
import java.util.List;
public interface ProvinceDao extends JpaRepository<Province, Integer>{
	@Query(value = "SELECT * FROM provinces WHERE code=:code", nativeQuery = true)
	public Province findIdProvince(int code);
	@Query(value = "select * from provinces",nativeQuery = true)
	public List<Province> getAllProvince();
	@Query(value = """
    SELECT m.month AS month, 
           COALESCE(COUNT(p.date_Post), 0) AS count
    FROM (
        SELECT 1 AS month UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
        UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
        UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
    ) m
    LEFT JOIN POST p ON MONTH(p.date_Post) = m.month 
                     AND YEAR(p.date_Post) = YEAR(GETDATE())
    GROUP BY m.month
    ORDER BY m.month
""", nativeQuery = true)
	List<Object[]> getPostCountsByMonth();

}
