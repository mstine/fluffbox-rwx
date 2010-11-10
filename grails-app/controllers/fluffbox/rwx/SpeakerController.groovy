package fluffbox.rwx

class SpeakerController {

    def scaffold = Speaker

    def show = {
      [speaker:Speaker.get(params.id)]
    }

    def find = {
      params.max = Math.min(params.max ? params.max.toInteger() : 8, 100)
      def speakers = Speaker.list(params)

      [speakers:speakers]

    }
}
