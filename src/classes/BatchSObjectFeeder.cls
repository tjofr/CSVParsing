/**
* @author Somebody but doc from Thierry Jorand
* @date 2014
*
* @description <b> BatchSObjectFeeder </b>
* <p>This class implements an Iterator through SObjects.
* Iterator is actually a FIFO
* </p>
*/

global class BatchSObjectFeeder implements Iterator<SObject>, Iterable<SObject> {
/**
* @description List of objects to be updated
*/
SObject[] source;

/**
* @description Constructor
* @param source List of SObjects
* @return nothing
*/ 
	global Iterator<SObject> iterator() {
		return this;
	}
	
/**
* @description Constructor
* @param source List of SObjects
* @return nothing
*/ 
	global BatchSObjectFeeder(SObject[] source) {
		this.source = source;
	}
	
/**
* @description Return the next object and suppresses it from the internal list
* @return SObject
*/ 
	global SObject next() {
		return source.remove(0);
	}
	
/**
* @description Test if there is a SObject in Iterator
* @return Boolean true or false
*/ 
	global boolean hasNext() {
		return source!=null && !source.isempty();
	}
}