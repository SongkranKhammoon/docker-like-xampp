FROM php:8.2-apache

# เปิดใช้งาน mod_rewrite สำหรับทำ Clean URL
RUN a2enmod rewrite

# ติดตั้ง Extension สำหรับ MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# ตั้งค่าให้ Apache อ่าน .htaccess ได้
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf