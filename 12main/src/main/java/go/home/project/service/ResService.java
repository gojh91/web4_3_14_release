package go.home.project.service;

import java.util.List;

import go.home.project.model.Menu;
import go.home.project.model.ResInfo;

public interface ResService {
	
	ResInfo getResInfo(int res_num);
	List<Menu> getMenuInfo(int res_num);

}
