<?php
$subject = 'New Reservation'; // Subject of your email
$to = 'contact@jadorehotel.ro';

$headers = 'From: Reservation Form <'.$to.'>' . "\r\n" . 'Reply-To: ' . $to;
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

$message  = 'Name      : ' . $_REQUEST['name'] . "\n";
$message .= 'Email     : ' . $_REQUEST['email'] . "\n";
$message .= 'Guests    : ' . $_REQUEST['guest'] . "\n";
$message .= 'Check In  : ' . $_REQUEST['checkin'] . "\n";
$message .= 'Check Out : ' . $_REQUEST['checkout'] . "\n";
$message .= 'Room      : ' . $_REQUEST['room'] . "\n";
$message .= 'Message   : ' . $_REQUEST['message'] . "\n";

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