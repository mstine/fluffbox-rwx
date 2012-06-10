package fluffbox.rwx

import grails.plugins.springsecurity.Secured

import com.fluffbox.si.model.CreditCardAuthorization;
import com.fluffbox.si.model.Transaction

class RentalController {
	
	def gateway
	def transactionService
	def creditCardAuthorizationService

    def reserve = {
      [clone:SpeakerClone.get(params.id)]    
    }
	
	@Secured(['ROLE_CUSTOMER'])
	def payment = {
		[denied:params.denied]
	}
	
	def authorizeCreditCard = {
		CreditCardAuthorization auth = new CreditCardAuthorization(params.cardNumber, params.expDate, 1.07)
		
		def result = creditCardAuthorizationService.authorizeTransaction(auth);
		
		if (result.equals("OK")) {
			redirect action: approved	
		} else {
			redirect action: payment, params: [denied:true]
		}
	}

    def approved = {
		def result = gateway.convertToUpperCase("success!")
		
		def transaction = new Transaction();
		
		transaction.with {
			customerId = "123456789"
			accountNumber = "4242424242424242"
			speakerId = "Mark Richards"
			kioskId = "1"
			date = new Date()
			amount = 1.07
		}
		
		transactionService.processTransaction(transaction)
		
		[result:result]
    }
}
