package fluffbox.rwx

import grails.converters.deep.JSON


class KioskController {

    def scaffold = Kiosk

    def find = {
      
    }

    def search = {
      def kiosks = Kiosk.findAll()
      render kiosks as JSON
    }
}
