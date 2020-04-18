package com.jobs.run.rating;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RatingDAO {

	private static final Logger lg = LoggerFactory.getLogger(RatingDAO.class);
	
	@Autowired
	SqlSession sql;
	
	public List<RatingVO> rateList(String ratee) {
		return sql.selectList("mappers.Rating-mapper.rateList", ratee);
	}

	public int rating(RatingVO ratingVO) {
		return sql.insert("mappers.Rating-mapper.rating", ratingVO);
	}
}
