package go.home.project.service;

import java.util.List;

import go.home.project.model.Board;
import go.home.project.model.MemberBoard;

public interface ReviewService {

	List<MemberBoard> reviewList();

	List<Board> avgScore();

	void setAvgScore(Board avgboard);
	
	void reviewInsert(Board board);
}
