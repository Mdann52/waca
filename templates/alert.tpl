<div class="alert {$alerttype}" role="alert">
  {if $alertclosable == true}<button type="button" class="close" data-dismiss="alert">&times;</button>{/if}
  {if $alertheader != ""}<h4>{$alertheader}</h4>{/if}
  {$alertmessage}
</div>
