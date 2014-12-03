import cwitter.Cweet
import cwitter.User

class BootStrap {

    def init = { servletContext ->
        User u2 = new User(username: "giuseppe", email: "giuseppe@giuseppe.com", password: "giuseppe").save(failOnError: true, flush: true)
        User u3 = new User(username: "Totototo", email: "Totototo@Totototo.com", password: "Totototo").save(failOnError: true, flush: true)
        User u4 = new User(username: "Tatatata", email: "Tatatata@Tatatata.com", password: "Tatatata").save(failOnError: true, flush: true)
        User u5 = new User(username: "Titititi", email: "Titititi@Titititi.com", password: "Titititi").save(failOnError: true, flush: true)
        User u6 = new User(username: "Tutututu", email: "Tutututu@Tutututu.com", password: "Tutututu").save(failOnError: true, flush: true)
        User u1 = new User(username: "guigui06", email: "guigui@guigui.com", password: "guigui06").save(failOnError: true, flush: true)



        Cweet c2 = new Cweet(message: "je mpe sens bien ajourdhui", publicationDate: new Date(), user:u2).save(failOnError: true, flush: true)

        Cweet c3 = new Cweet(message: "puuitttin jai la rage", publicationDate: new Date(), user:u3).save(failOnError: true)

        Cweet c4 = new Cweet(message: "je suis zen", publicationDate: new Date(), user:u4).save(failOnError: true)

        Cweet c5 = new Cweet(message: "hahahahaha", publicationDate: new Date(), user:u5).save(failOnError: true)

        Cweet c6 = new Cweet(message: "hihihihi", publicationDate: new Date(), user:u6).save(failOnError: true)

        Cweet c1 = new Cweet(message: "coucu ca va ?", publicationDate: new Date(), user: u1).save(failOnError: true)
        u1.addToFollows(u5)
        u1.addToFollows(u2)
        u1.addToFollows(u3)
        u1.addToFollows(u4)
     u5.addToFollowers(u1)
        u2.addToFollowers(u1)
        u3.addToFollowers(u1)
        u4.addToFollowers(u1)

        u1.addToFollowers(u5)
        u5.addToFollows(u1)
        u1.addToFollowers(u6)
        u6.addToFollows(u1)

    }
    def destroy = {
    }
}
