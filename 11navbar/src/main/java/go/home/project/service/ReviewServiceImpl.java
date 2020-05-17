package go.home.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import go.home.project.dao.ReviewDao;
import go.home.project.model.Board;
import go.home.project.model.MemberBoard;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao rd;
	
	public List<MemberBoard> reviewList() {
		return rd.reviewList();
	}

	@Override
	public List<Board> avgScore() {
		// TODO Auto-generated method stub
		return rd.avgScore();
	}

	@Override
	public void setAvgScore(Board avgboard) {
		// TODO Auto-generated method stub
		rd.setAvgScore(avgboard);
	}

	@Override
	public void reviewInsert(Board board) {
		// TODO Auto-generated method stub
		rd.reviewInsert(board);
		
	}

}
