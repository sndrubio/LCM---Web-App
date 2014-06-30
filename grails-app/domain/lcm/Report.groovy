package lcm

class Report {
    String name
	static belongsTo = [primaryLocation : Location]
	Date publicationdate
	String filename	
	
	String toString(){
		return name
	  }
	  
}

