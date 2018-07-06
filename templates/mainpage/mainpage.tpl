<div class="row">
  <div class="page-header">
	  <h1>Create an account!</h1>
  </div>
</div>

<div class="row">

  <div class="accordion col-md-12" id="requestListAccordion">
    {foreach from=$requestSectionData key="header" item="section"}
    <div class="card">
      <div class="card-heading">
        <h5 class="mb-0">
          <button class="btn btn-link" type="button" data-toggle="collapse" data-parent="#requestListAccordion" href="#collapse{$section.api}" aria-expanded="true" aria-controls="collapse{$section.api}">
            {$header} <span class="badge {if $section.total > $requestLimitShowOnly}badge-important{else}badge-info{/if}">{if $section.total > 0}{$section.total}{/if}</span>
          </button>
        </h5>
      </div>
      <div id="collapse{$section.api}" class="collapse">
        <div class="card-body">
          {include file="mainpage/requestlist.tpl" requests=$section showStatus=false type=$section.type}
        </div>
      </div>
    </div>
    {/foreach}
  </div>
</div>

<hr />

<div class="row-fluid">
  <h3>Last 5 Closed requests</h3>
  <table class="table table-condensed table-striped" style="width:auto;">
    <thead>
      <th>ID</th>
      <th>Name</th>
      <th>{* zoom *}</th>
    </thead>
    {foreach from=$lastFive item="req"}
    <tr>
      <th>{$req.id}</th>
      <td>
        {$req.name|escape}
      </td>
      <td>
        <a href="{$baseurl}/acc.php?action=zoom&amp;id={$req.id|escape:'url'}" class="btn btn-info">
          <i class="icon-white icon-search"></i>&nbsp;Zoom
        </a>
      </td>
      <td>
        <a href="{$baseurl}/acc.php?action=defer&amp;id={$req.id|escape:'url'}&amp;sum={$req.checksum|escape:'url'}&amp;target=Open" class="btn btn-warning">
          <i class="icon-white icon-refresh"></i>&nbsp;Reset
        </a>
      </td>
    </tr>
    {/foreach}
  </table>
</div>
