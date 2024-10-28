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
public class Comments {
	
	private int boardId;
	private int commentId;
	private String content;
	private String writer;
	private Date regDate;
}
