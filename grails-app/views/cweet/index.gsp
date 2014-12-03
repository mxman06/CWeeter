<!DOCTYPE html>
<html>
<head lang="en">

    <meta charset="UTF-8">
    <title>Cwitter</title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <a class="navbar-brand" href="tweet.html">Cweeter</a>
            </div>

            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">

                    <input id="test" onsubmit=";" name="usernameSearched" list="usersDL" type="text"
                           class="form-control"
                           placeholder="Search">
                    <datalist id="usersDL">
                        <g:each in="${cwitter.User.list()}">
                            <option value="${it.username}" id="${it.id}" onclick="callUrl()" >
                        </g:each>
                    </datalist>

                </div>

            </form>
            <!-- /.navbar-collapse -->
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="cweet.html">Cweet<span class="sr-only">(current)</span></a></li>

                </ul>

            </div>

        </div>
        <!-- /.container-fluid -->
    </nav>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col col-lg-3">
            <h1>Your followers</h1>
        </div>

        <div class="col col-lg-6">
            <h1>Your Timeline</h1>
        </div>

        <div class="col col-lg-3">
            <h1>Your following</h1>
        </div>
    </div>

    <div class="row">
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
        </div>

        <div class="col col-lg-6">

            <div class="col-sm-12 col-md-12 col-lg-12">
                <form action="http://localhost:8080/Cwitter/cweet/sendCweet" method="post" style="width: 100%;">
                    <input type="text" class="form-control" min="3" minlength="3" max="140" maxlength="140"
                           placeholder="Put Your Cweet!!" name="cweet"/><br/>
                    <input class="btn btn-default" type="submit" value="envoyer"/>
                    <br/>
                </form>
            </div>

            <br/>
            <br/>
            <br/>
            <br/>
            <br/>

            <div id="cweet" class="col-sm-12 col-md-12 col-lg-12">
                <g:each in="${cweetsList}" var="cweetInstance">
                    <div class="tweet">
                        <p>
                    <g:link controller="user" action="show"
                            id="${cweetInstance.user.id}"><li
                            class="list-group-item">${cweetInstance.user.username}</li></g:link> <br/>
                    ${cweetInstance.message} <br/>

                    ${cweetInstance.publicationDate}
                    </p>
                </div>
                </g:each>
            </div>

        </div>

        <div class="col col-lg-3">
            <div>
                <ul class="list-group">
                    <g:each in="${followingList}" var="followingInstance">
                        <li class="list-group-item"><g:link controller="user" action="show"
                                                            id="${followingInstance.id}">${followingInstance.username}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col col-lg-5">
            <g:link controller="cweet" action="logOff"><div class="btn btn-danger">Se deconnecter</div></g:link>
        </div>
    </div>
</div>

<script type="text/javascript">


    $("#test").keyup(function (e) {
        var code = e.which; // recommended to use e.which, it's normalized across browsers
        if (code == 13)e.preventDefault();
        if (code == 32 || code == 13 || code == 188 || code == 186) {
            console.log($("#test").val());

            /*  $.post("localhost:8080/Cwitter/cweet/search", $("#test").val()).success(function(){
             console.log('success');
             });*/

        } // missing closing if brace
        // console.log($("#test").val());
    });


    /* var callUrl = function () {
     console.log("call url");
     }*/
</script>

</body>

</html>

