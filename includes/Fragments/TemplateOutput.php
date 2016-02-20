<?php

namespace Waca\Fragments;

use InterfaceMessage;
use Smarty;
use User;
use Waca\Environment;
use Waca\SiteConfiguration;

trait TemplateOutput
{
	/** @var Smarty */
	private $smarty;

	/** @var string Extra JavaScript to include at the end of the page's execution */
	private $tailScript;

	/**
	 * @return SiteConfiguration
	 */
	protected abstract function getSiteConfiguration();

	/**
	 * Include extra JavaScript at the end of the page's execution
	 *
	 * @param $script string JavaScript to include at the end of the page
	 */
	final protected function setTailScript($script)
	{
		$this->tailScript = $script;
	}

	/**
	 * Assigns a Smarty variable
	 *
	 * @param  array|string $name    the template variable name(s)
	 * @param  mixed        $value   the value to assign
	 */
	final protected function assign($name, $value)
	{
		$this->smarty->assign($name, $value);
	}

	/**
	 * Sets up the variables used by the main Smarty base template.
	 *
	 * This list is getting kinda long.
	 */
	final protected function setUpSmarty()
	{
		$this->smarty = new Smarty();
		$this->smarty->addPluginsDir($this->getSiteConfiguration()->getFilePath() . 'smarty-plugins');

		$this->assign("currentUser", User::getCurrent());
		$this->assign("loggedIn", (!User::getCurrent()->isCommunityUser()));
		$this->assign("baseurl", $this->getSiteConfiguration()->getBaseUrl());
		$this->assign("mediawikiScriptPath", $this->getSiteConfiguration()->getMediawikiScriptPath());

		// TODO: this isn't very mockable, and requires a database link.
		$siteNoticeText = InterfaceMessage::get(InterfaceMessage::SITENOTICE);
		$this->assign("siteNoticeText", $siteNoticeText);

		// TODO: this isn't mockable either, and has side effects if you don't have git
		$this->assign("toolversion", Environment::getToolVersion());

		// TODO: implement this somehow
		$this->assign("onlineusers", "");

		// default this
		$this->assign("typeAheadBlock", "");

		$this->assign("page", $this);
	}

	/**
	 * Fetches a rendered Smarty template
	 *
	 * @param $template string Template file path, relative to /templates/
	 * @return string Templated HTML
	 */
	final protected function fetchTemplate($template)
	{
		$this->assign("tailScript", $this->tailScript);

		return $this->smarty->fetch($template);
	}
}