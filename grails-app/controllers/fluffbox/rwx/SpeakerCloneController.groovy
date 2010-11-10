package fluffbox.rwx

import grails.converters.deep.JSON

class SpeakerCloneController {

    def scaffold = SpeakerClone

    def findByKiosk = {
      def max = Math.min(params.max ? params.max.toInteger() : 8, 100)

      def kiosk = Kiosk.get(params.id)
      def clones = SpeakerClone.findAllByKiosk(kiosk, [max:max, offset:params.offset])

      def speakers = clones.collect {
        it.speaker
      }

      [speakers:speakers, kiosk:kiosk, speakersSize:SpeakerClone.countByKiosk(kiosk)]
    }

    def findBySpeaker = {
      

      [id:params.id, speaker:Speaker.get(params.id)]
    }

    def searchBySpeaker = {
      def speaker = Speaker.get(params.id)
      def clones = SpeakerClone.findAllBySpeaker(speaker)

      def kiosks = clones.collect {
        it.kiosk
      }

      render clones as JSON
    }

  def show = {
    [clone:SpeakerClone.get(params.id)]
  }
}
