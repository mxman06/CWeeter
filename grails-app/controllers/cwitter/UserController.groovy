package cwitter

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [login: "POST", show: "GET", register: "POST", follower: "GET", followings: "GET", search: ["GET", "POST"]]

    def show() {

        if (session.user) {
            //getback the user asked and his cweets sorted by data
            User userAsked = User.findById(params.id);
            ArrayList<Cweet> cweetTrie;
            cweetTrie = userAsked.cweets;
            cweetTrie.sort { it.publicationDate }
            cweetTrie = cweetTrie.reverse();

            //getback my follower and check if the current user is in the list -> button follow/unfollow
            ArrayList<User> follower = userAsked.getFollowers()
            Boolean fol = follower.contains(User.get(session.user));

            [isFollowing   : fol,
             cweetsListUser: cweetTrie,
             followersList : userAsked.followers,
             followingList : userAsked.follows,
             theUsername   : userAsked.username,
             user          : userAsked]


        }
    }

    def unfollow(User userInstance) {
        if (session.user) {
            User userInstanceLogged = User.get(session.user);
            def u = User.findByUsername(params.id);
            userInstanceLogged.removeFromFollows(u).save(flush: true)
            u.removeFromFollowers(userInstanceLogged).save(flush: true)

            // params.id.save()
            redirect(uri: "/user/show/" + u.id)
        } else {
            redirect(uri: "/")
        }
    }

    def follow(User userInstance) {

        if (session.user) {
            User userInstanceLogged = User.get(session.user);
            def u = User.findByUsername(params.id);
            userInstanceLogged.addToFollows(u).save(flush: true)
            u.addToFollowers(userInstanceLogged).save(flush: true)
            for (User us : u.followers) {
            }
            // params.id.save()
            redirect(uri: "/user/show/" + u.id)
        } else {
            redirect(uri: "/")
        }
    }

    def register() {
        if (params.username != "" && params.password != "" && params.email) {

            String username = params.username
            String password = params.password
            String email = params.email

            User newUser = new User(username: username, password: password, email: email);

            newUser.save(flush: true);
            session["user"] = newUser.id
            redirect(controller: "cweet")


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

    def followers() {
        if (session.user) {
            [followerList: User.get(session.user).followers]
        }
    }

    def followings() {
        if (session.user) {
            [followingList: User.get(session.user).follows]
        }
    }

    def search() {

        if (params.search && params.search != "") {
            def search = params.search

            def searchResult = User.findAllByUsernameIlike("%" + search + "%")
            println(searchResult)

            [searchList: searchResult]

        }

    }

}
