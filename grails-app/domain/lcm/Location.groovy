package lcm

class Location {

	static belongsTo = [primaryCompany : Company]
	String name
	String address
	
	String toString(){
		return name
	}
	  
	
}
