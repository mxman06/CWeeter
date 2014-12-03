package cwitter

import spock.util.mop.Use

class Cweet {

    String message
    Date publicationDate
    static belongsTo = [user : User]

    static constraints = {
        message (size:3..140, nullable: false, blank: false)
        publicationDate (nullable: false, blank: false)
    }
}
