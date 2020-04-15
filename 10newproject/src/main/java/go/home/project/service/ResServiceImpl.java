package go.home.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import go.home.project.dao.ResDao;
import go.home.project.model.Menu;
import go.home.project.model.ResInfo;

@Service
public class ResServiceImpl implements ResService {
	@Autowired
	private ResDao rd;

	@Override
	public ResInfo getResInfo(int res_num) {
		// TODO Auto-generated method stub
		return rd.getResInfo(res_num);
	}

	@Override
	public List<Menu> getMenuInfo(int res_num) {
		// TODO Auto-generated method stub
		return rd.getMenuInfo(res_num);
	}

}
