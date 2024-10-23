package tje.DTO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Files {
	private int no;
	private String pTable;
	private String fileType;
	private String fileName;
	private String filePath;
	private int fileSize;
	private Date createAt;
	private Date updatedAt;
	private String bbType;
}
