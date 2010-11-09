String name 
String title
String imageUrl
String bio = ""

new File("NFJS-SPK-Data.txt").eachLine() {
	
	if (it.trim() =~ /^STREC:/) {
		
		println """new Speaker(name:"${name}", title:"${title}", imageUrl:"${imageUrl}", bio:\"\"\"${bio}\"\"\").save()
		"""
		
		bio = ""
		def tokens = it.split("_")
		
		name = tokens[0].substring(6)
		title = tokens[1]
	} else if (it.trim() =~ /^http:/) {
		imageUrl = it.trim()
	} else {
		bio += it
	}
	
	
}
println """new Speaker(name:"${name}", title:"${title}", imageUrl:"${imageUrl}", bio:\"\"\"${bio}\"\"\").save()
"""