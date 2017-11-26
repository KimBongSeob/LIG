package MemberManagementView;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import MemberManagementDTO.PageRank;


//엑셀파일만들기
public class ExcelDownloadView extends AbstractXlsView {

	@SuppressWarnings("unchecked")
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"Let it go_회원목록.xls\";"); //원하는 이름으로 수정	
		
 	
		Sheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);

		List<PageRank> pageRanks = (List<PageRank>) model.get("pageRanks");
		int rowNum = 1;
		for (PageRank rank : pageRanks) {
			createPageRankRow(sheet, rank, rowNum++);
		}
	}

	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "Let it go_회원목록");
		sheet.setColumnWidth(1, 100 * 20);
		return sheet;
	}

	private void createColumnLabel(Sheet sheet) {
		Row firstRow = sheet.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("No.");
		cell = firstRow.createCell(1);
		cell.setCellValue("아이디");
		cell = firstRow.createCell(2);
		cell.setCellValue("닉네임");
		cell = firstRow.createCell(3);
		cell.setCellValue("이메일");
		cell = firstRow.createCell(4);
		cell.setCellValue("성별");
		cell = firstRow.createCell(5);
		cell.setCellValue("생년월일");
		cell = firstRow.createCell(6);
		cell.setCellValue("핸드폰번호");
		
	}

	private void createPageRankRow(Sheet sheet, PageRank rank, int rowNum) {
		Row row = sheet.createRow(rowNum);
		Cell cell = row.createCell(0);
		cell.setCellValue(rank.getRank());
		cell = row.createCell(1);
		cell.setCellValue(rank.getMem_Id());
		cell = row.createCell(2);
		cell.setCellValue(rank.getNickName());
		cell = row.createCell(3);
		cell.setCellValue(rank.getEmail());
		cell = row.createCell(4);
		if(rank.getGender().equals("0")) {
			cell.setCellValue("남자");
		}else if(rank.getGender().equals("1")) {
			cell.setCellValue("여자");
		}
		cell = row.createCell(5);
		cell.setCellValue(rank.getJumin());
		cell = row.createCell(6);
		cell.setCellValue(rank.getHphone());
		
	}

}
