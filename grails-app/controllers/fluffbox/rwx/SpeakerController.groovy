package fluffbox.rwx

class SpeakerController {

    def scaffold = Speaker

    def find = {

      def speakers = Speaker.list()

      [speakers:speakers]

    }
}
