package tje.DAO;

import java.sql.ResultSet;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.WishList;

public class WishListDAO extends BaseDAOImpl<WishList> {

	@Override
	public WishList map(ResultSet arg0) throws Exception {
		WishList wishList = new WishList();
		wishList.setNo(rs.getInt("no"));
		wishList.setId(rs.getString("id"));
		wishList.setBookId(rs.getInt("book_id"));
		
		return wishList;
	}

	@Override
	public String pk() {
		// TODO Auto-generated method stub
		return "no";
	}

	@Override
	public String table() {
		// TODO Auto-generated method stub
		return "wish_list";
	}

}
