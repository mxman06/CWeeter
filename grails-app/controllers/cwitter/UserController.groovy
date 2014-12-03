package cwitter

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [login: "POST", show: "GET", register: "POST"]
    def show(User userInstance) {
        ArrayList<Cweet> cweetTrie;
        cweetTrie = userInstance.cweets;
        cweetTrie.sort { it.publicationDate }
        cweetTrie = cweetTrie.reverse();

        if (session.user) {
            User userInstanceLogged = User.get(session.user)
            println("hey" +params)
            println(userInstanceLogged.id)
            User uCurrent = User.findById(params.id);
            ArrayList<User> follower = uCurrent.getFollowers()
            Boolean fol = follower.contains(userInstanceLogged);


                [isFollowing   : fol,
                 cweetsListUser: cweetTrie,
                 followersList : userInstance.followers,
                 followingList : userInstance.follows,
                 theUsername   : userInstance.username,
                    user:userInstance]



        }
    }
    def unfollow(User userInstance) {
        if (session.user) {
            User userInstanceLogged = User.get(session.user);
            def u = User.findByUsername(params.id);
            userInstanceLogged.removeFromFollows(u).save(flush:true)
            u.removeFromFollowers(userInstanceLogged).save(flush:true)

            // params.id.save()
            redirect(uri: "/user/show/" + u.id)
        } else {
            println('pas bon')
            redirect(uri: "/")
        }
    }


    def follow(User userInstance) {

        if (session.user) {
            User userInstanceLogged = User.get(session.user);
            def u = User.findByUsername(params.id);
            userInstanceLogged.addToFollows(u).save(flush:true)
            u.addToFollowers(userInstanceLogged).save(flush:true)
            for(User us :u.followers){
                println("follower " + us)
            }
           // params.id.save()
            redirect(uri: "/user/show/" + u.id)
        } else {
            println('pas bon')
            redirect(uri: "/")
        }
    }


    def register() {
        println(params)
        if (params.username != "" && params.password != "" && params.email) {
            println("JSON BON")
            String username = params.username
            String password = params.password
            String email = params.email

            User newUser = new User(username: username, password: password, email: email);
            if (!newUser.save()) {
                newUser.errors.each {
                    println it
                }
                redirect(uri("/"))
            } else {
                newUser.save(flush: true);
                session["user"] = userInstance.id
                redirect(controller: "cweet")
            }


        } else {
            redirect(uri: "/")
        }
    }

    def login() {

        if (params.username != "" && params.password != "") {
            String username = params.username
            String password = params.password
            boolean found = false;
            def userFounded;

            def userInstance = User.findByUsername(username)
            if (userInstance && userInstance.password == password) {

                session["user"] = userInstance.id
                redirect(controller: "cweet")

            } else {
                redirect(uri: "/")
            }

        }
    }

}
