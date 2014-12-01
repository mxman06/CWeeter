<%@ page import="cwitter.Cweet" %>



<div class="fieldcontain ${hasErrors(bean: cweetInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="cweet.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" maxlength="140" required="" value="${cweetInstance?.message}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cweetInstance, field: 'publicationDate', 'error')} required">
	<label for="publicationDate">
		<g:message code="cweet.publicationDate.label" default="Publication Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publicationDate" precision="day"  value="${cweetInstance?.publicationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: cweetInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="cweet.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${cwitter.User.list()}" optionKey="id" required="" value="${cweetInstance?.user?.id}" class="many-to-one"/>

</div>

