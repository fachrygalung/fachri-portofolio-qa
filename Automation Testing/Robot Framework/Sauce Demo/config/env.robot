*** Variables ***
${env}           dev

${browser}       edge

&{url}           dev=https://www.saucedemo.com/
...              stg=https://www.saucedemo.com/

&{username}      dev=standard_user
...              stg=standard_user_staging

&{pass}          dev=secret_sauce
...              stg=secret_sauce_staging

${Headless}      ${True}
