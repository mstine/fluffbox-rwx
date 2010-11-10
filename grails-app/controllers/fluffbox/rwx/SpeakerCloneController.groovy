package fluffbox.rwx

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
}
