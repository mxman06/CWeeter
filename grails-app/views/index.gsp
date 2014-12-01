<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

</head>

<body>
<h1>CTwitter</h1>

<div>
    <form role="form" action="http://localhost:8080/Cwitter/user/register" method="post">
        <h1>Inscription</h1>

        <div class="form-group">
            <label>Login</label>
            <input type="text" class="form-control" name="username" placeholder="Enter your username">

        </div>

        <div class="form-group">
            <label>Email address</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email">

        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="Password">
        </div>

        <input type="submit" class="btn btn-default" value="S'inscrire"/>
    </form>
</div>

<div>
    <form role="form" action="http://localhost:8080/Cwitter/user/login" method="post">
        <h1>Connection</h1>

        <div class="form-group">
            <label>Login</label>
            <input type="text" name="username" class="form-control" placeholder="Enter your username">

        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter your Password">
        </div>

        <button type="submit" class="btn btn-default">Se connecter</button>
    </form>
</div>
</body>


</html>