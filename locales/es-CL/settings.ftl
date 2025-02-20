# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


# Settings page

settings-page-title = Ajustes de { -product-short-name }

## Breach alert preferences

settings-alert-email-preferences-title = Preferencias de correo electrónico
settings-alert-email-preferences-subtitle = Dinos qué correos electrónicos te gustaría recibir.
settings-alert-preferences-allow-breach-alerts-title = Alertas de filtraciones instantaneas
settings-alert-preferences-allow-breach-alerts-subtitle = Estas alertas se envían inmediatamente una vez que se detecta una filtración de datos.
settings-alert-preferences-option-one = Enviar alertas de filtraciones a los correos afectados
settings-alert-preferences-option-two = Enviar todas las alertas de filtraciones al correo electrónico principal.

## Monitored email addresses

# Variables:
#   $email (string) - Email address
settings-email-list-title = Direcciones de correo monitoreadas
# Variables:
#   $limit (number) - Number of email addresses included in the plan
settings-email-limit-info =
    { $limit ->
        [one] Tu cuenta incluye el seguimiento de hasta { $limit } correo.
        [many] Tu cuenta incluye el seguimiento de hasta { $limit } correos.
       *[other] Tu cuenta incluye el seguimiento de hasta { $limit } correos.
    }
settings-email-verification-callout = Verificación de correo requerida
settings-resend-email-verification-link = Reenviar correo de verificación
settings-add-email-button = Añadir dirección de correo electrónico
settings-remove-email-button-label = Eliminar
# Variables:
#   $emailAddress (string) - The email address to remove, e.g. `billnye@example.com`
settings-remove-email-button-tooltip = Dejar de monitorear { $emailAddress }
# This string is shown beneath each of the user’s email addresses to indicate
# how many known breaches that email address was found in.
# Variables:
#   $breachCount (number) - Number of breaches
settings-email-number-of-breaches-info =
    { $breachCount ->
        [one] Aparece en { $breachCount } filtración conocida.
        [many] Aparece en { $breachCount } filtraciones conocidas.
       *[other] Aparece en { $breachCount } filtraciones conocidas.
    }

## Delete Monitor account

settings-delete-monitor-free-account-title = Eliminar cuenta de { -brand-monitor }
settings-delete-monitor-free-account-description = Esto eliminará permanentemente tu cuenta de { -brand-monitor } y desactivará todas las notificaciones.
settings-delete-monitor-free-account-cta-label = Eliminar cuenta
settings-delete-monitor-free-account-dialog-title = Tu cuenta { -brand-monitor } será eliminada permanentemente
settings-delete-monitor-free-account-dialog-lead-v2 = Toda la información de tu cuenta de { -brand-monitor } será eliminada y ya no monitorearemos nuevas filtraciones de datos. Esto no eliminará tu { -brand-mozilla-account }.
settings-delete-monitor-free-account-dialog-cta-label = Eliminar cuenta
settings-delete-monitor-free-account-dialog-cancel-button-label = No importa, llévenme de vuelta
settings-delete-monitor-account-confirmation-toast-label-2 = Tu cuenta { -brand-monitor } esta ahora eliminada.
settings-delete-monitor-account-confirmation-toast-dismiss-label = Descartar

## Monthly Monitor Report

settings-alert-preferences-allow-monthly-monitor-report-title = Informe mensual de { -brand-monitor }
settings-alert-preferences-allow-monthly-monitor-report-subtitle = Una actualización mensual de nuevas exposiciones, lo que ha sido solucionado y lo que necesita de tu atención.

## Settings page redesign

settings-tab-label-edit-info = Editar tu información
settings-tab-label-notifications = Establecer notificaciones
settings-tab-label-manage-account = Administrar cuenta
settings-tab-subtitle-manage-account = Administra tu cuenta de { -product-name }.
settings-tab-notifications-marketing-title = Comunicaciones de marketing
settings-tab-notifications-marketing-text = Actualizaciones periódicas sobre { -brand-monitor }, { -brand-mozilla } y nuestros otros productos de seguridad.
settings-tab-notifications-marketing-link-label = Ir a ajustes de correo de { -brand-mozilla }
