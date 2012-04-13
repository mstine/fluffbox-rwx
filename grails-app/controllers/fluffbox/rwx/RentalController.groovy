package fluffbox.rwx

import grails.plugins.springsecurity.Secured
import com.fluffbox.si.model.Transaction

class RentalController {
	
	def gateway
	def transactionService

    def reserve = {
      [clone:SpeakerClone.get(params.id)]    
    }

    @Secured(['ROLE_CUSTOMER'])
    def payment = {
		def result = gateway.convertToUpperCase("success!")
		
		def transaction = new Transaction();
		
		transaction.with {
			customerId = "123456789"
			accountNumber = "1111222233334444"
			speakerId = "1"
			kioskId = "1"
			date = new Date()
			amount = 1.07
		}
		
		transactionService.processTransaction(transaction)
		
		[result:result]
    }
}
