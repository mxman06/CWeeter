package cwitter

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CweetController {

    static allowedMethods = [sendCweet: "POST", seeUser: "GET", search:"GET"]

    //on declare linstance du user
    User userInstance

    def index() {

        //uniquement si on trouve la session
        if (session.user) {
            userInstance = User.get(session.user)
        }
        else{
            println('pas bon')
           redirect(uri:"/")
        }

        //envoi les variables variable a la vue
        [cweetsList: userInstance.cweets + userInstance.followers.cweets + userInstance.follows.cweets,
         followersList: userInstance.followers,
         followingList: userInstance.follows,
         Theusername: userInstance.username]
    }

    def sendCweet() {

        //uniquement si on trouve la session
        if (session.user) {
            userInstance = User.get(session.user)
        }
        else{
            redirect(controller:"cweet")
        }

        println(params.cweet)
        if (params.cweet && params.cweet != "") {

            //on recup le message
            String cweet = params.cweet

            //on créer le cweet et on le lattribut a luser instance
            Cweet cweetInstance = new Cweet(message: cweet, publicationDate: new Date()).save(failOnError: true).save(flush: true)
            userInstance.addToCweets(cweetInstance).save(flush: true)

            //on rafraichi la vue
            //envoi les variables variable a la vue
            println(userInstance.cweets)
            render(view: "index", model:[cweetsList: userInstance.cweets + userInstance.followers.cweets + userInstance.follows.cweets,
                                         followersList: userInstance.followers,
                                         followingList: userInstance.follows])


        }
    }

    def seeUser(){
        //uniquement si on trouve la session
        if (session.user) {
            userInstance = User.get(session.user)
            redirect(controller: "user" ,action: "show", id:params.id )
        }
        else{
            redirect(controller: "user")
        }

    }

    def logOff(){
        session["user"] = null;
        redirect(uri:"/")
    }


}
