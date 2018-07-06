<h3 class="text-center">Account Creation Interface</h3>
<div class="row">
	<div class="col-md-4 offset-md-4">
		{include file="alert.tpl" alertblock="false" alerttype="alert-info" alertclosable=false alertheader="" alertmessage="<strong>You're not logged in!</strong> Please log in to continue."}
		{$errorbar}
	</div>
</div>
<div class="row">
	<div class="col-md-4 offset-md-4 card bg-light">
		<div class="card-body ">
			<form action="{$baseurl}/acc.php?action=login" method="post">
				<div class="form-group">
					<input type="text" id="username" name="username" placeholder="Username" {if isset($smarty.get.tplUsername)} value="{$smarty.get.tplUsername|escape}"{/if} class="form-control col-md-10 offset-md-1" required>
				</div>
				<div class="form-group">
					<input type="password" id="password" name="password" placeholder="Password" class="form-control col-md-10 offset-md-1" required>
				</div>
				<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-large col-md-10 offset-md-1">Sign in</button>
				</div>
			</form>
		</div>
		<div class="card-footer text-muted row">
			<a class="btn btn-secondary btn-small col-md-6" href="{$baseurl}/acc.php?action=forgotpw">Forgot password</a>
			<a class="btn btn-secondary btn-small col-md-5 offset-md-1" href="{$baseurl}/acc.php?action=register">Register</a>
		</div>
	</div>
</div>
