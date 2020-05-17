package go.home.project.dao;

import java.util.List;

import go.home.project.model.Menu;
import go.home.project.model.ResInfo;

public interface ResDao {
	
	ResInfo getResInfo(int res_num);
	List<Menu> getMenuInfo(int res_num);

}
