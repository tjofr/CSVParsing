/**
* @author Somebody but doc from Thierry Jorand
* @date 2014
*
* @description <b> BatchProcessor </b>
* <p>This class implements the batch processor.
* 
* 
* @see BatchSObjectFeeder to get
* @see ctrlAdddataFromCSV
*/

global class BatchProcessor implements Database.batchable<SObject>,Database.AllowsCallouts {
/**
* @description name of the csv file to uploaded 
*/
SObject[] source;
/**
* @description Content of the csv file to uploaded 
*/
global String strCSVContent;

/**
* @description Constructor
* @param source List of SObjects
* @param StrCSV content of CSV File
* @return nothing
*/ 

	global BatchProcessor(SObject[] source , String StrCSV) {
		this.source = source;
		strCSVContent = StrCSV;
		System.Debug('Batch processor : It Came in Constructor');
	}

/**
* @description Start the batch
* @param source Batch context
* @return nothing
*/ 
	global Iterable<SObject> start(Database.BatchableContext bc) {
		BatchSObjectFeeder bf = new BatchSObjectFeeder(source);
		System.Debug('Batch processor : It Came in Start : ' + bc.getJobId());
		return bf;
	}

/**
* @description Execute the batch
* @param source List of Sobjects
* @param Batch context
* @return nothing
*/ 

	public void execute(Database.BatchableContext bc, SObject[] scope) {
		//insert scope;
		System.Debug('Batch processor : It Came in Execute :' + bc.getJobId());
		ctrlAdddataFromCSV.InsertValues(BC.getJobId(),strCSVContent );
	}

/**
* @description Finish the batch
* @param Batch context
* @return nothing
*/ 
	global void finish(Database.BatchableContext bc) {
	}
}