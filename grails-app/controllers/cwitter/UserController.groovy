package cwitter

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [login: "POST", show: "GET", register: "POST"]

    def show(User userInstance) {

        [cweetsList: userInstance.cweets + userInstance.followers.cweets + userInstance.follows.cweets,
         followersList: userInstance.followers,
         followingList: userInstance.follows]
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


        }
        else{
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

            }
            else{
                redirect(uri: "/")
            }

        }
    }

}
