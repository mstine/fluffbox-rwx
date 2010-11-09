def index = 0
String name
boolean inside
String address
String city
String state
String zip

def stores = []

new File("FLL-RB-Data.txt").eachLine() {
	
	if (!(it.trim() == "")) {
		
		
		if (index % 3 == 0) {
			def tokens = it.trim().split(/\(/)
			name = tokens[0].trim()
			inside = tokens[1] =~ /Inside/	
		} else if (index %3 == 1) {
			address = it.trim()
		} else {
			def firstTokenization = it.trim().split(/,/)
			city = firstTokenization[0]
			def secondTokenization = firstTokenization[1].trim().split(" ")
			state = secondTokenization[0]
			zip = secondTokenization[1]
			
			if (!stores.contains(name)) {
				println """new Store(name: "${name}").save()"""
				stores.add(name)
			}
			println """new Kiosk(store: Store.findByName("${name}"), inside: ${inside}, address: "${address}",
          city: "${city}", state:"${state}", zipCode:"${zip}").save()"""
		}
		
		index++
	}
	
}