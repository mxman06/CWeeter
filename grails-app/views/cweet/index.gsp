<!DOCTYPE html>
<html>
<head lang="en">

    <meta charset="UTF-8">
    <title>Cwitter</title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <a class="navbar-brand">Cweeter</a>
            </div>
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">

                    <g:link controller="cweet" action="logOff"><div class="btn btn-danger">Se deconnecter</div></g:link>
                </div>

            </form>

            <!-- /.navbar-collapse -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="cweet">Cweet<span class="sr-only">(current)</span></a></li>
                    <li><a href="user/followers">Followers<span class="sr-only">(current)</span></a></li>
                    <li><a href="user/followings">Followings<span class="sr-only">(current)</span></a></li>
                    <li><a href="user/search.html">Search<span class="sr-only">(current)</span></a></li>


                </ul>

            </div>

        </div>
        <!-- /.container-fluid -->
    </nav>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col col-lg-6 text-left">
            <h2>Your followers :
                <g:link controller="user" action="followers"> ${followersList.size()}</g:link>
            </h2>
        </div>



        <div class="col col-lg-6 text-right">
            <h2>Your following :  <g:link controller="user" action="followings">${followingList.size()} </h2></g:link>
        </div>
    </div>

    <div class="row"><!--
        <div class="col col-lg-3">
            <div>
                <ul class="list-group">
                    <g:each in="${followersList}" var="followerInstance">
                        <g:link controller="user" action="show"
                                id="${followerInstance.id}"><li
                                class="list-group-item">${followerInstance.username}</li></g:link>
                    </g:each>
                </ul>
            </div>
        </div>-->

        <div class="col col-lg-8 col-lg-offset-2">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <form action="http://localhost:8080/Cwitter/cweet/sendCweet" method="post" style="width: 100%;">
                        <input type="text" class="form-control" min="3" minlength="3" max="140" maxlength="140"
                               placeholder="Put Your Cweet!!" name="cweet"/><br/>
                        <input class="btn btn-default" type="submit" value="envoyer"/>
                        <br/>
                    </form>
                </div>
            </div>

            <div class="row">

                <div id="cweet" class="col-lg-12 col-sm-12 col-md-12 col-lg-12">
                    <h2> Your timeline</h2>
                    <g:each in="${cweetsList}" var="cweetInstance">
                        <div class="tweet">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <g:link controller="user" action="show" id="${cweetInstance.user.id}">
                                        <span>${cweetInstance.user.username.toString()}  </g:link>
                                    a cweeter :</span>

                                    <span>${cweetInstance.message.toString()}</span>
                                </li>
                            </ul>


                            <p class="date-cweet">le : ${cweetInstance.publicationDate}</p>

                        </div>
                    </g:each>
                </div>
            </div>

        </div>
<!--
        <div class="col col-lg-3">
            <div>
                <ul class="list-group">
                    <g:each in="${followingList}" var="followingInstance">
                        <li class="list-group-item">
                            <g:link controller="user" action="show" id="${followingInstance.id}">
                                <p>${followingInstance.username}</p>
                            </g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>-->
    </div>


</div>

</body>

</html>

