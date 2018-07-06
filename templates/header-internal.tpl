<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Account Creation Interface</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <link href="{$baseurl}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 14px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }

      nav a, nav a:hover{
        color: lightgrey;
      }
    </style>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="{$baseurl}/lib/bootstrap/js/html5shiv.js"></script>
    <![endif]-->

	<!-- Our extra styles -->
    <link href="{$baseurl}/extra-styles.css" rel="stylesheet">
  </head>

  <body>
    <header>
      <nav class="navbar navbar-expand-md navbar-dark navbar-fixed-top bg-dark fixed-top">
      <div class="container-fluid">
          <a class="navbar-brand" href="{$baseurl}/acc.php">Account Creation Interface</a>
          <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target=".nav-collapse" aria-controls=".nav-collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-fas fa"></span>
          </button>
          {block name="navmenu"}<div class="navbar-collapse collapse">
            <ul class="navbar-nav">
		        {if $userid != 0}
              <li{* class="active"*}><a href="{$baseurl}/acc.php"><i class="fas fa-home"></i>&nbsp;&nbsp;Requests&nbsp;&nbsp;</a></li>
			  <li class="nav-item dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-tag"></i>&nbsp;&nbsp;Meta<b class="caret"></b></a>&nbsp;&nbsp;
				  <ul class="dropdown-menu">
					<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=logs"><i class="fas fa-list"></i>&nbsp;Logs</a></li>
					<li><a class="dropdown-item" href="{$baseurl}/statistics.php?page=Users"><i class="fas fa-users"></i>&nbsp;Users</a></li>
					<li><a class="dropdown-item" href="{$baseurl}/search.php"><i class="fas fa-search"></i>&nbsp;Search</a></li>
					<li><a class="dropdown-item" href="{$baseurl}/statistics.php"><i class="fas fa-tasks"></i>&nbsp;Statistics</a></li>
				  </ul>
			  </li>
        <li class="nav-item dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-wrench"></i>&nbsp;&nbsp;Admin<b class="caret"></b></a>&nbsp;&nbsp;
				  <ul class="dropdown-menu">
					<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=ban"><i class="fas fa-ban"></i>&nbsp;Ban Management</a></li>
					<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=messagemgmt"><i class="fas fa-print"></i>&nbsp;Message Management</a></li>
					<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=emailmgmt"><i class="fas fa-envelope"></i>&nbsp;Close Email Management</a></li>
					<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=templatemgmt"><i class="fas fa-file"></i>&nbsp;Welcome Template Management</a></li>
					{if $currentUser->isAdmin()}
					<li><a class="dropdown-item" href="{$baseurl}/users.php"><i class="fas fa-user"></i> User Management</a></li>
					{/if}
				  </ul>
			  </li>
				<form class="nav-item form-inline" action="{$baseurl}/acc.php">
				  <input type="hidden" name="action" value="zoom">
				  <input class="span2" type="text" placeholder="Request ID" name="id" class="search-query">
				</form>
			{/if}
            </ul>
			<ul class="navbar-nav pull-right ml-auto">
			{if $userid != 0}
				<li class="nav-item dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i> <strong>{$username}</strong> <b class="caret"></b></a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="dropdown-header">Account</li>
						<li><a class="dropdown-item" href="{$baseurl}/statistics.php?page=Users&amp;user={$userid}"><i class="fas fa-tasks"></i> My statistics</a></li>
						<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=prefs"><i class="fas fa-edit"></i> Edit preferences</a></li>
						<li class="dropdown-divider"></li>
						<li class="dropdown-header">Help</li>
						<li><a class="dropdown-item" href="//en.wikipedia.org/wiki/Wikipedia:Request_an_account/Guide"><i class="fas fa-question-circle"></i>&nbsp;Guide</a></li>
						<li><a class="dropdown-item" href="//en.wikipedia.org/wiki/Wikipedia:Username_policy"><i class="fas fa-exclamation-triangle"></i>&nbsp;Username policy</a></li>
						<li><a class="dropdown-item" href="#modalFlowchart" role="button" data-toggle="modal"><i class="fas fa-check"></i>&nbsp;Similar account flowchart</a></li>
						<li><a class="dropdown-item" href="https://webchat.freenode.net/?channels=wikipedia-en-accounts"><i class="fas fa-comment"></i>&nbsp;Chat</a></li>
						<li><a class="dropdown-item" href="https://lists.wikimedia.org/mailman/listinfo/accounts-enwiki-l"><i class="fas fa-envelope"></i>&nbsp;Mailing list</a></li>
						<li class="divider"></li>
						<li><a class="dropdown-item" href="{$baseurl}/acc.php?action=logout"><i class="fas fa-lock"></i> Logout</a></li>
					</ul>
				</li>
			{else}
				<li>
					<p class="nav-item navbar-text">
						<strong>Not logged in</strong>
					</p>
				</li>
			{/if}
			</ul>
          </div><!--/.nav-collapse -->{/block}
      </div>
    </nav>
  </header>


	{block name="modals"}{include file="modal-flowchart.tpl"}{/block}


    <div class="container">
	{block name="sitenotice"}
	{if $userid != 0}
		<div class="row">
			<!-- site notice -->
			<div class="col-md-12">
			<div class="alert alert-warning" role="alert">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				{$sitenotice}
			</div>
			</div>
		</div><!--/row-->
	{/if}
	{/block}
	{if count($alerts) > 0}
		{foreach $alerts as $a}
			{$a->getAlertBox()}
		{/foreach}
	{/if}
