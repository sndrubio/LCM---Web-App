package lcm

import grails.plugins.springsecurity.Secured
import groovy.time.TimeCategory
import org.springframework.dao.DataIntegrityViolationException



class ReportController {


	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	
	

	def index() {
		redirect(action: "list", params: params)
	}

	@Secured(['ROLE_ADMIN'])
	def create() {
		[reportInstance: new Report(params)]
	}


	@Secured(['ROLE_ADMIN'])
	def save (){
		def file = request.getFile('fileUpload')
		def originalName = file.getOriginalFilename()
		def now = new Date()
		params.location = params.location
		params.publicationdate = now
		params.filename = originalName
		file.transferTo(new File("../LCM/web-app/up_files/${originalName}"))

		def reportInstance = new Report(params)
		if (!reportInstance.save(flush: true)) {
			render(view: "create", model: [reportInstance: reportInstance])
			//return
		}
		else{
			flash.message = message(code: 'default.created.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])
			redirect(action: "show", id: reportInstance.id)
		}
	}



	
	def list(Integer max) {
		def now = new Date()
		def yearFromNow
		use(TimeCategory){
			yearFromNow = (now - 1.year)
		}
			
			
		
		//get the logged in user from springSecurityService and the company he is working for
		def company = springSecurityService.getCurrentUser()?.getCompany()

		//get all the locations for the company
		def locations = Location.findAllByPrimaryCompany(company)

		//get all the reports from the locations
		//we should create an array
		def reports = []

		for (location in locations){

			def aux = Report.findAllByPrimaryLocationAndPublicationdateBetween(location, yearFromNow, now, [sort: "publicationdate", order:"desc"])

			reports.addAll(aux)

		}

		if(reports.isEmpty()){
			flash.message = "There are no currently reports available"
		}
		
		[reportInstanceList:reports, reportInstanceTotal:reports.size()]
		
		
}
		


	
	def show(Long id) {
		def reportInstance = Report.get(id)
		if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), id])
			redirect(action: "list")
			return
		}

		[reportInstance: reportInstance]
	}

	def edit(Long id) {
		def reportInstance = Report.get(id)
		if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), id])
			redirect(action: "list")
			return
		}

		[reportInstance: reportInstance]
	}

	def update(Long id, Long version) {
		def reportInstance = Report.get(id)
		if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (reportInstance.version > version) {
				reportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[message(code: 'report.label', default: 'Report')] as Object[],
						"Another user has updated this Report while you were editing")
				render(view: "edit", model: [reportInstance: reportInstance])
				return
			}
		}

		reportInstance.properties = params

		if (!reportInstance.save(flush: true)) {
			render(view: "edit", model: [reportInstance: reportInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])
		redirect(action: "show", id: reportInstance.id)
	}


	def delete(Long id) {
		def reportInstance = Report.get(id)
		if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), id])
			redirect(action: "list")
			return
		}
		
		try {
			reportInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'report.label', default: 'Report'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'report.label', default: 'Report'), id])
			redirect(action: "show", id: id)
		}
	}






}
