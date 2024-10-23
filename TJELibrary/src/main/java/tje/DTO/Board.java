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
public class Board {
	
	private int boardID;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updDate;
	private String bType;

}
