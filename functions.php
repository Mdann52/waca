<?php
/**************************************************************************
 **********      English Wikipedia Account Request Interface      **********
 ***************************************************************************
 ** Wikipedia Account Request Graphic Design by Charles Melbye,           **
 ** which is licensed under a Creative Commons                            **
 ** Attribution-Noncommercial-Share Alike 3.0 United States License.      **
 **                                                                       **
 ** All other code are released under the Public Domain                   **
 ** by the ACC Development Team.                                          **
 **                                                                       **
 ** See CREDITS for the list of developers.                               **
 ***************************************************************************/

global $ACC;
global $baseurl;
global $dontUseWikiDb;

if (!defined("ACC")) {
	die();
} // Invalid entry point

require_once 'includes/session.php';

// Initialize the class objects.
$session = new session();

/**
 * Transforms a date string into a relative representation of the date ("2 weeks ago").
 * @param string $input A string representing a date
 * @return string
 * @example {$variable|relativedate} from Smarty
 */
function relativedate($input)
{
	$now = new DateTime();

	if (gettype($input) === 'object' && get_class($input) === DateTime::class) {
		$then = $input;
	}
	else {
		$then = new DateTime($input);
	}

    
	$secs = $now->getTimestamp() - $then->getTimestamp();
    
	$second = 1;
	$minute = 60 * $second;
	$minuteCut = 60 * $second;
	$hour = 60 * $minute;
	$hourCut = 90 * $minute;
	$day = 24 * $hour;
	$dayCut = 48 * $hour;
	$week = 7 * $day;
	$weekCut = 14 * $day;
	$month = 30 * $day;
	$monthCut = 60 * $day;
	$year = 365 * $day;
	$yearCut = $year * 2;
    
	$pluralise = true;
    
	if ($secs <= 10) {
		$output = "just now";
		$pluralise = false;
	}
	elseif ($secs > 10 && $secs < $minuteCut) {
		$output = round($secs / $second) . " second";
	}
	elseif ($secs >= $minuteCut && $secs < $hourCut) {
		$output = round($secs / $minute) . " minute";
	}
	elseif ($secs >= $hourCut && $secs < $dayCut) {
		$output = round($secs / $hour) . " hour";
	}
	elseif ($secs >= $dayCut && $secs < $weekCut) {
		$output = round($secs / $day) . " day";
	}
	elseif ($secs >= $weekCut && $secs < $monthCut) {
		$output = round($secs / $week) . " week";
	}
	elseif ($secs >= $monthCut && $secs < $yearCut) {
		$output = round($secs / $month) . " month";
	}
	elseif ($secs >= $yearCut && $secs < $year * 10) {
		$output = round($secs / $year) . " year";
	}
	else {
		$output = "a long time ago";
		$pluralise = false;
	}
    
	if ($pluralise) {
		$output = (substr($output, 0, 2) <> "1 ") ? $output . "s ago" : $output . " ago";
	}

	return $output;
}

/**
 * Summary of reattachOAuthAccount
 * @param User $user 
 * @throws TransactionException 
 */
function reattachOAuthAccount(User $user)
{
	global $oauthConsumerToken, $oauthSecretToken, $oauthBaseUrl, $oauthBaseUrlInternal;

	try {
		// Get a request token for OAuth
		$util = new OAuthUtility($oauthConsumerToken, $oauthSecretToken, $oauthBaseUrl, $oauthBaseUrlInternal);
		$requestToken = $util->getRequestToken();

		// save the request token for later
		$user->setOAuthRequestToken($requestToken->key);
		$user->setOAuthRequestSecret($requestToken->secret);
		$user->save();
            
		$redirectUrl = $util->getAuthoriseUrl($requestToken);
            
		header("Location: {$redirectUrl}");
		die();
	}
	catch (Exception $ex) {
		throw new TransactionException($ex->getMessage(), "Connection to Wikipedia failed.", "alert-error", 0, $ex);
	}     
}
