package fluffbox.rwx

class RentalController {

    def reserve = {
      [clone:SpeakerClone.get(params.id)]    
    }
}
