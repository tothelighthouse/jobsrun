package com.jobs.run.rating;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class RatingSVC {
	private static final Logger lg = LoggerFactory.getLogger(RatingSVC.class);
	
	@Inject
	RatingDAO RDAO;
	
	public List<RatingVO> rateList(String ratee) {
		return RDAO.rateList(ratee);
	}
	
	
	
	public int rating(RatingVO ratingVO ) {
		return RDAO.rating(ratingVO);
	}
}
