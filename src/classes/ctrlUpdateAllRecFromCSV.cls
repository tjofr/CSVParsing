/**
* @author Somebody but doc from Thierry Jorand
* @date 2014
*
* @description <b> ctrlUpdateAllRecFromCSV </b>
* <p>This page is a page controller extension.
* Need a VF page with the following fields:</p>
* <ul>
* <li>a file name</li> 
* <li>the content of the file</li>
* <li>a command id to call the extensionn ReadFile</li>
*</ul>
* Button press lauches a batch through the BatchProcessor class.
* @see BatchProcessor
*/

public class ctrlUpdateAllRecFromCSV{
/**
* @description name of the csv file to uploaded 
*/
	public static string nameFile{get;set;}
/**
* @description content of the csv file to uploaded 
*/
	public Static Blob contentFile{get;set;}
	// constructor
	
/**
* @description Constructor : checks and accepts the file name for non empty files
* @param controller the name of the object to look up
* @return nothing
*/ 

	public ctrlUpdateallrecFromCSV(ApexPages.StandardController controller) {
		if(contentFile != null) {
			nameFile = contentFile.toString();
		}
	}

/**
* @description Read the CSV File and launches a batch to do the actual read
* @param none 
* @return the describe field result for the given field
*/ 
	public static void ReadFile() {
		String CheckString = contentFile.toString();
		System.Debug('##### nameFile in ctrlUpdateallrecFromCSV : ' + nameFile );
		System.Debug('##### Full Content in ctrlUpdateallrecFromCSV\n' + CheckString );
		Lead[] sourcetemp = new Lead[]{};
		Lead objs = new Lead();
		objs.Company = 'Test Company' ;
		objs.LastName= 'Test Name' ;
		sourcetemp.add(objs);
		BatchProcessor objBatchProcess= new BatchProcessor(sourcetemp,CheckString);
		String strBatchId = Database.executeBatch(objBatchProcess, 200);
		System.Debug('##### Batch ID is ' + strBatchId );
	}
	
}