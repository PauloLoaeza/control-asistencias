<div class="form-group has-feedback ${invalid ? 'has-error' : ''}">

    <div>
        <label for="${property}">${label} <span class="text-red">${required ? '*' : ''}</span></label>
        <input type="password" id="password2" name="${property}" class="form-control"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>

        <g:if test="${errors}">
            <g:each in="${errors}" var="error">
                <span class="help-block"><g:message error="${error}"/></span>
            </g:each>
        </g:if>
    </div>

</div>