package tje.DAO;

import java.sql.ResultSet;
import java.util.Date;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tje.DTO.User;
import tje.DTO.Files;

public class FilesDAO extends BaseDAOImpl<Files> {
	@Override
	public Files map(ResultSet rs) throws Exception {
		Files files = new Files();
		files.setNo(rs.getInt("no"));
		files.setPTable(rs.getString("p_table"));
		files.setFileType(rs.getString("file_type"));
		files.setFileName(rs.getString("file_name"));
		files.setFilePath(rs.getString("file_path"));
		files.setFileSize(rs.getInt("file_size"));
		files.setCreateAt(rs.getDate("create_at"));
		files.setUpdatedAt(rs.getDate("updated_at"));
		files.setBbType(rs.getString("bb_type"));
		return files;
	}

	@Override
	public String pk() {
		return "no";
	}

	@Override
	public String table() {
		return "files";
	}

}

