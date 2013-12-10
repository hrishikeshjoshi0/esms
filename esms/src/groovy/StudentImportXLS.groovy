import java.util.Map;

import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService
class StudentImportXLS extends AbstractExcelImporter {
	
	static Map CONFIG_BOOK_COLUMN_MAP = [
			sheet:'Sheet1',
			   startRow: 2,
			columnMap:  [
					'A':'title',
					'B':'author',
					'C':'numSold',
			]
	]

    public StudentImportXLS(fileName){
	  super(fileName)
	}
	
	def getStudents(){
	  def studentList = ExcelImportService.getService().convertFromCellMapToMapWithValues(workbook, CONFIG_BOOK_COLUMN_MAP)
	  return studentList
	}
}
