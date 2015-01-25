/**
* @author Somebody but doc from Thierry Jorand
* @date 2014
*
* @description <b> clsAdddataFromCSV </b>
* <p>This class parses a CSV file and returns a list of rows as a list of fields
* </p>
* 
*
* @see clsAdddataFromCSV
*/
global class clsAdddataFromCSV{

/**
* @description parseCSV : checks and accepts the file name for non empty files
* @param strCSV content of the csv file
* @param skipHeaders if true the first line of headers is not returned
* @return nothing
*/ 
	public static List<List<String>> parseCSV(String contents,Boolean skipHeaders) {
		system.debug('***** Showed Up Here clsAdddataFromCSV ' + skipHeaders + contents );
		List<List<String>> allFields = new List<List<String>>();
		List<String> lines = new List<String>();
		try {
			lines = contents.split('\n');
		} catch (System.ListException e) {
							System.debug('***** Limits exceeded?' + e.getMessage());
							}
		system.debug('Line num is'+lines.size());

		Integer num = 0;
		for(String line : lines) {
			// check for blank CSV lines (only commas)
			if (line.replaceAll(',','').trim().length() == 0) break;
			
			List<String> fields = line.split(',');
			List<String> cleanFields = new List<String>();
			String compositeField;
			Boolean makeCompositeField = false;
			
			for(String field : fields) {
				if (field.startsWith('"') && field.endsWith('"')) {
					cleanFields.add(field.replaceAll('DBLQT','"'));
				} else if (field.startsWith('"')) {
					makeCompositeField = true;
					compositeField = field;
				} else if (field.endsWith('"')) {
					compositeField += ',' + field;
					cleanFields.add(compositeField.replaceAll('DBLQT','"'));
					makeCompositeField = false;
				} else if (makeCompositeField) {
					compositeField += ',' + field;
				} else {
					//cleanFields.add(field.replaceAll('DBLQT','"'));
					cleanFields.add(field);
				}
			}
			allFields.add(cleanFields);
			}
			if (skipHeaders) allFields.remove(0);
				return allFields;
			}
}