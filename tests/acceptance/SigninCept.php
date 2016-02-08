<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('sign in');
$I->amOnPage('/');
$I->fillField('Username', 'admin');
$I->fillField('Password', 'demo');
$I->click('Sign in');
$I->see('Vale kasutajanimi või parool');