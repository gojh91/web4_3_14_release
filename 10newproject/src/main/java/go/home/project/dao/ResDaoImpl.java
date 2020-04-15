package go.home.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import go.home.project.model.Menu;
import go.home.project.model.ResInfo;

@Repository
public class ResDaoImpl implements ResDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public ResInfo getResInfo(int res_num) {
		// TODO Auto-generated method stub
		return session.selectOne("resInfo", res_num);
	}

	@Override
	public List<Menu> getMenuInfo(int res_num) {
		// TODO Auto-generated method stub
		return session.selectList("menuInfo", res_num);
	}

}
