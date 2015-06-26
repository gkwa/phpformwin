<?php

session_start();

// register session variables
$_SESSION['firstname']='Alejandro';
$_SESSION['lastname']='Gervasio';

// display session variables
echo 'My first name is '.$_SESSION['firstname'].' and my last name is '.$_SESSION['lastname'];
