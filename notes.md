
**INFO**

ssl: /etc/ssl/certs


**TODO**

1) check vm IP

2) Testing if Nginx/PHP-FPM works
Before we install Wordpress, let's make sure that our nginx/php installation works as expected

mkdir /var/www/wordpress.devops.esc.sh
cd /var/www/wordpress.devops.esc.sh
echo '<?php phpinfo(); ?>' > info.php
Now open wordpress.devops.esc.sh/info.php and it should show the php info page. That means we are good.

Make sure to delete the info.php file

rm info.php

