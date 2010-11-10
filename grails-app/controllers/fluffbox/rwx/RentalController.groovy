package fluffbox.rwx

import grails.plugins.springsecurity.Secured

class RentalController {

    def reserve = {
      [clone:SpeakerClone.get(params.id)]    
    }

    @Secured(['ROLE_CUSTOMER'])
    def payment = {

    }
}
