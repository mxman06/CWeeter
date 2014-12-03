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
                    <li><a href="../cweet">Cweet<span class="sr-only">(current)</span></a></li>
                    <li><a href="followers">Followers<span class="sr-only">(current)</span></a></li>
                    <li><a href="followings">Followings<span class="sr-only">(current)</span></a></li>
                    <li class="active"><a href="search">Search<span class="sr-only">(current)</span></a></li>

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
            <h1>Search a Cweetos</h1>
        </div>

    </div>

    <div class="row">


        <div class="col col-lg-12">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <form action="http://localhost:8080/Cwitter/user/search" method="post" style="width: 100%;">
                        <input type="text" class="form-control" min="3" minlength="3" max="140" maxlength="140"
                               placeholder="Put Your search!!" name="search"/><br/>
                        <input class="btn btn-default" type="submit" value="Search"/>
                        <br/>
                    </form>
                </div>
            </div>

            <div class="row">
                <div id="cweet" class="col-lg-12 col-sm-12 col-md-12 col-lg-12">
                    <g:each in="${searchList}" var="searchInstance">
                        <div class="tweet">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <g:link controller="user" action="show" id="${searchInstance.id}">
                                        <span>${searchInstance.username.toString()}  </g:link>
                                </li>
                            </ul>

                        </div>
                    </g:each>
                </div>
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

