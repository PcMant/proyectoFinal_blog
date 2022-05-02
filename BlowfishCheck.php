<?php

if (defined("CRYPT_BLOWFISH") && CRYPT_BLOWFISH) {
    echo "CRYPT_BLOWFISH está activo!";
}
else {
    echo "CRYPT_BLOWFISH no está activo";
}