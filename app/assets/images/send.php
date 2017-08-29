<?php
$subject = 'You Got New Message!'; // Subject of your email
$to = 'contact@jadorehotel.com';

$headers = 'From: Contact Form <'.$to.'>' . "\r\n" . 'Reply-To: ' . $to;
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

$message = 'Name    : ' . $_REQUEST['name'] . "\n";
$message .= 'Email   : ' . $_REQUEST['email'] . "\n";
$message .= 'Message : ' . $_REQUEST['message'] . "\n";

if (mail($to, $subject, $message, $headers))
{
	// Transfer the value 'sent' to ajax function for showing success message.
	echo 'sent';
}
else
{
	// Transfer the value 'failed' to ajax function for showing error message.
	echo 'failed';
}
?>