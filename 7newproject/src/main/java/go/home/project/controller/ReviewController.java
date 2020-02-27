package go.home.project.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import go.home.project.model.Board;
import go.home.project.model.MemberBoard;
import go.home.project.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rs;
	
	@RequestMapping(value="reviewList")
	public String reviewList(Model model, HttpServletRequest request) {
		System.out.println("@RequestMapping(value = \"reviewList\")");
		
		List<MemberBoard> reviewList = rs.reviewList();//reviewlist 가져오기
		model.addAttribute("reviewList",reviewList);
		
		List<Board> avgScore= rs.avgScore();
		
		Iterator<Board> itr1 = avgScore.iterator();
		while (itr1.hasNext()) {
			Board avgboard=itr1.next();
			if((Integer)avgboard.getRes_num()!=null) {
				double avg_Score=Math.round(avgboard.getAvg_score()*10)/10.0;
				avgboard.setAvg_score(avg_Score);
				rs.setAvgScore(avgboard);
			}
		}
		return "reviewList";
	}
	
	

}
