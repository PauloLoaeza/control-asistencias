package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.ui.ForgotPasswordCommand
import grails.plugin.springsecurity.ui.RegistrationCode
import grails.plugin.springsecurity.ui.ResetPasswordCommand
import grails.plugin.springsecurity.ui.strategy.RegistrationCodeStrategy

@Secured("permitAll")
class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

    static final String EMAIL_LAYOUT = "/layouts/email"
    static final String FORGOT_PASSWORD_TEMPLATE = "/register/_forgotPasswordMail"
    static final String VERIFY_REGISTRATION_TEMPLATE = "/register/_verifyRegistrationMail"

    RegistrationCodeStrategy uiRegistrationCodeStrategy

    def forgotPassword(ForgotPasswordCommand forgotPasswordCommand) {

        if (!request.post) {
            return [forgotPasswordCommand: new ForgotPasswordCommand()]
        }

        if (forgotPasswordCommand.hasErrors()) {
            return [forgotPasswordCommand: forgotPasswordCommand]
        }

        def user = findUserByUsername(forgotPasswordCommand.username)
        if (!user) {
            forgotPasswordCommand.errors.rejectValue 'username', 'spring.security.ui.forgotPassword.user.notFound'
            return [forgotPasswordCommand: forgotPasswordCommand]
        }

        String email = uiPropertiesStrategy.getProperty(user, 'username')
        if (!email) {
            forgotPasswordCommand.errors.rejectValue 'username', 'spring.security.ui.forgotPassword.noEmail'
            return [forgotPasswordCommand: forgotPasswordCommand]
        }

        uiRegistrationCodeStrategy.sendForgotPasswordMail(
                forgotPasswordCommand.username, email) { String registrationCodeToken ->

            String url = generateLink('resetPassword', [t: registrationCodeToken])
            String body = forgotPasswordEmailBody

            if (!body) {
                body = renderEmail(
                        FORGOT_PASSWORD_TEMPLATE, EMAIL_LAYOUT,
                        [
                                url     : url,
                                username: user.username
                        ]
                )
            } else if (body.contains('$')) {
                body = evaluate(body, [user: user, url: url])
            }

            body
        }

        [emailSent: true, forgotPasswordCommand: forgotPasswordCommand]
    }

    def resetPassword(ResetPasswordCommand resetPasswordCommand) {

        String token = params.t

        def registrationCode = token ? RegistrationCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'spring.security.ui.resetPassword.badCode')
            redirect uri: successHandlerDefaultTargetUrl
            return
        }

        if (!request.post) {
            return [token: token, resetPasswordCommand: new ResetPasswordCommand()]
        }

        resetPasswordCommand.username = registrationCode.username
        resetPasswordCommand.validate()
        if (resetPasswordCommand.hasErrors()) {
            return [token: token, resetPasswordCommand: resetPasswordCommand]
        }

        def user = uiRegistrationCodeStrategy.resetPassword(resetPasswordCommand, registrationCode)
        if (user.hasErrors()) {
            // expected to be handled already by ErrorsStrategy.handleValidationErrors
        }

        flash.message = message(code: 'spring.security.ui.resetPassword.success')

        redirect uri: registerPostResetUrl ?: successHandlerDefaultTargetUrl
    }
}