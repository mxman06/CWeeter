import cwitter.Cweet
import cwitter.User

class BootStrap {

    def init = { servletContext ->
        User u2 = new User(username: "giuseppe", email: "giuseppe@giuseppe.com", password: "giuseppe")
        User u3 = new User(username: "Totototo", email: "Totototo@Totototo.com", password: "Totototo")
        User u4 = new User(username: "Tatatata", email: "Tatatata@Tatatata.com", password: "Tatatata")
        User u5 = new User(username: "Titititi", email: "Titititi@Titititi.com", password: "Titititi")
        User u6 = new User(username: "Tutututu", email: "Tutututu@Tutututu.com", password: "Tutututu")
        User u1 = new User(username: "guigui06", email: "guigui@guigui.com", password: "guigui06")



        Cweet c2 = new Cweet(message: "je mpe sens bien ajourdhui", publicationDate: new Date()).save(failOnError: true, flush: true)
        u2.addToCweets(c2)
        u2.save(flush: true, failOnError: true)

        Cweet c3 = new Cweet(message: "puuitttin jai la rage", publicationDate: new Date()).save(failOnError: true)
        u3.addToCweets(c3)
        u3.save(flush: true, failOnError: true)

        Cweet c4 = new Cweet(message: "je suis zen", publicationDate: new Date()).save(failOnError: true)
        u4.addToCweets(c4)
        u4.save(flush: true, failOnError: true)

        Cweet c5 = new Cweet(message: "hahahahaha", publicationDate: new Date()).save(failOnError: true)
        u5.addToCweets(c5)
        u5.save(flush: true, failOnError: true)

        Cweet c6 = new Cweet(message: "hihihihi", publicationDate: new Date()).save(failOnError: true)
        u6.addToCweets(c6)
        u6.save(flush: true, failOnError: true)

        Cweet c1 = new Cweet(message: "coucu ca va ?", publicationDate: new Date()).save(failOnError: true)
        u1.addToCweets(c1)
        u1.addToFollowers(u5)
        u5.addToFollows(u1)
        u1.addToFollowers(u6)
        u6.addToFollows(u1)
        u1.save(flush: true, failOnError: true)
    }
    def destroy = {
    }
}
