opsworks-php55-apache24
=======================

install php55 and apache 2.4 on opsworks Amazon Linux 64-bit (tested with chef 11.10)

== To use ==

Create a Opsworks stack, and enable custom cookbooks. Use this repo (or a fork of it)

Create a custom Layer in Opsworks

From the "Settings" page for your new layer, add the following custom recipes:
- Setup : mod_php5_apache2
- Config: php::configure
- Deploy: deploy::php
- Undeploy: deploy::php-undeploy
- Shutdown: apache2::stop

Start a new instance in this layer. When you log in, it should be using php 5.5 and apache 2.4
