package cwitter

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CweetController {

    static allowedMethods = [sendCweet: "POST", seeUser: "GET", search: "GET"]

    //on declare linstance du user
    User userInstance

    def index() {
        ArrayList<Cweet> cweetTrie = new ArrayList<Cweet>();

        //uniquement si on trouve la session
        if (session.user) {
            userInstance = User.get(session.user)

            //get cweets of the current user
            for (Cweet c in userInstance.cweets) {
                println(c)
                println(userInstance.cweets)

                cweetTrie.add(c)
            }

            //get cweets to the the user's follows
            userInstance.follows.each {
                User followInstance ->
                    followInstance.cweets.each
                            {
                                Cweet followCweetInstance ->
                                    cweetTrie.add(followCweetInstance)
                            }
            }



            cweetTrie.sort { it.publicationDate }
            cweetTrie = cweetTrie.reverse();
        }

        else {
            println('pas bon')
            redirect(uri: "/")
        }

        println(cweetTrie)
        //envoi les variables variable a la vue

        [cweetsList   : cweetTrie,
         followersList: userInstance.followers,
         followingList: userInstance.follows,
         Theusername  : userInstance.username]
    }


    def sendCweet() {

        //uniquement si on trouve la session
        if (session.user) {
            userInstance = User.get(session.user)
        } else {
            redirect(controller: "cweet")
        }

        println(params.cweet)
        if (params.cweet && params.cweet != "") {

            //on recup le message
            String cweet = params.cweet

            //on créer le cweet et on le lattribut a luser instance
            Cweet cweetInstance = new Cweet(message: cweet, publicationDate: new Date(), user: userInstance).save(failOnError: true).save(flush: true)
            userInstance.addToCweets(cweetInstance).save(flush: true)
            ArrayList<Cweet> cweeTrie;
            cweeTrie = userInstance.cweets + userInstance.follows.cweets;


            cweeTrie.sort { it.publicationDate }
            cweeTrie = cweeTrie.reverse();
            //on rafraichi la vue
            //envoi les variables variable a la vue
            println(userInstance.cweets)
            render(view: "index", model: [cweetsList   : cweeTrie,
                                          followersList: userInstance.followers,
                                          followingList: userInstance.follows])

            redirect(controller: "cweet")

        }
    }

    def seeUser() {
        //uniquement si on trouve la session
        if (session.user) {
            userInstance = User.get(session.user)
            redirect(controller: "user", action: "show", id: params.id)
        } else {
            redirect(controller: "user")
        }

    }

    def logOff() {
        session["user"] = null;
        redirect(uri: "/")
    }


}
