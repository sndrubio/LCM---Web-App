import javax.management.relation.Role

import org.springframework.security.core.userdetails.User

import lcm.Company
import Security.Role
import Security.User
import Security.UserRole


class BootStrap {

    def init = { servletContext ->
		
		def LCM = new Company(name:"LCM").save(flush: true)
		def testCompany = new Company(name:"testCompany").save(flush: true)
		
		//create two roles (admin and user)
		def adminRole= new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def regularUserRole = new Role(authority: 'ROLE_REGULAR_USER').save(flush: true)
		
		//create a user
		def sampleUser = new User(username: 'sampleUser', password: 'password', enabled:true, company:testCompany)
		sampleUser.save(flush: true)
		
		def admin = new User(username: 'admin', password: 'password', enabled:true, company:LCM)
		admin.save(flush: true)
		
		//link the role and the users together
		UserRole.create sampleUser, regularUserRole, true
		UserRole.create admin, adminRole, true
    }
    def destroy = {
    }
}