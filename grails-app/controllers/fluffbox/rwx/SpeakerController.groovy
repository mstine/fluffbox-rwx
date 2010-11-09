package fluffbox.rwx

class SpeakerController {

    def scaffold = Speaker

    def find = {
      params.max = Math.min(params.max ? params.max.toInteger() : 8, 100)
      def speakers = Speaker.list(params)

      [speakers:speakers]

    }
}
