package cwitter

class User {

    String username
    String email
    String password
    static hasMany = [followers:User, follows:User, cweets:Cweet]

    static mapping = {
        followers joinTable: [name:'User_Followers',
                              key:"UserId",
                              column:"FollowerId"]
        follows joinTable: [name:'User_Follows',
                              key:"UserId",
                              column:"FollowId"]
    }

    static constraints = {
        email (email: true,nullable: false, blank: false, unique: true)
        username (size: 8..255,nullable: false, blank: false, unique: true)
        password (size: 8..255,nullable: false, blank: false)
    }
}
