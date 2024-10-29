package tje.DAO;

import java.sql.ResultSet;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import tje.DTO.RentalList;

public class RentalListDAO extends BaseDAOImpl<RentalList>{

	@Override
	public RentalList map(ResultSet arg0) throws Exception {
		RentalList rentalList = new RentalList();
		rentalList.setNo(rs.getInt("no"));
		rentalList.setId(rs.getString("id"));
		rentalList.setBookId(rs.getInt("book_id"));
		rentalList.setStockId(rs.getInt("stock_id"));
		rentalList.setState(rs.getString("state"));
		rentalList.setRentalDate(rs.getTimestamp("rental_date"));
		rentalList.setReturnDate(rs.getTimestamp("return_date"));
		rentalList.setOverDate(rs.getInt("over_date"));
		return rentalList;
	}

	@Override
	public String pk() {
		return "no";
	}

	@Override
	public String table() {
		return "rental_list";
	}

}
