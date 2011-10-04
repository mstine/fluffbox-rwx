package fluffbox.rwx

class Speaker {
    String name
    String title
    String bio
    String imageUrl

    static hasMany = [sessions:SpeakerSession]

    static constraints = {
        bio(maxSize:2048)
    }
}
