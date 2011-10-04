package fluffbox.rwx

class User {

	String username
	String password
    String email

	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
        email email: true
	}

	static mapping = {
        table 'users'
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
}
