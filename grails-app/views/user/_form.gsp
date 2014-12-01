<%@ page import="cwitter.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="username" cols="40" rows="5" maxlength="255" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="password" cols="40" rows="5" maxlength="255" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cweets', 'error')} ">
	<label for="cweets">
		<g:message code="user.cweets.label" default="Cweets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.cweets?}" var="c">
    <li><g:link controller="cweet" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cweet" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cweet.label', default: 'Cweet')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'followers', 'error')} ">
	<label for="followers">
		<g:message code="user.followers.label" default="Followers" />
		
	</label>
	<g:select name="followers" from="${cwitter.User.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.followers*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'follows', 'error')} ">
	<label for="follows">
		<g:message code="user.follows.label" default="Follows" />
		
	</label>
	<g:select name="follows" from="${cwitter.User.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.follows*.id}" class="many-to-many"/>

</div>

