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

                <a class="navbar-brand" href="../cweet">Cweeter</a>
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
                    <li><a href="../cweet">Cweet<span class="sr-only">(current)</span></a></li>
                    <li><a href="followers">Followers<span class="sr-only">(current)</span></a></li>
                    <li class="active"><a href="followings">Followings<span class="sr-only">(current)</span></a></li>
                    <li><a href="search">Search<span class="sr-only">(current)</span></a></li>
                </ul>

            </div>

        </div>
        <!-- /.container-fluid -->
    </nav>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col col-lg-12">
            <h1>Your Follows</h1>
        </div>
    </div>

    <div class="row">
        <div class="col col-lg-12">
            <div id="cweet" class="col-lg-12 col-sm-12 col-md-12 col-lg-12">
                <g:each in="${followingList}" var="followInstance">
                    <div class="tweet">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <g:link controller="user" action="show" id="${followInstance.id}">
                                    <span>${followInstance.username.toString()}</g:link> </span>
                                <div>cweets : ${followInstance.cweets.size()}</div>
                                <div>Followers : ${followInstance.followers.size()}</div>
                                <div>Followings : ${followInstance.follows.size()}</div>
                                <g:link controller="user" action="unfollow" id="${followInstance.username}">

                                    <div class="btn btn-danger">unfollow</div>
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </g:each>
            </div>
        </div>
    </div>

</div>

</body>

</html>

