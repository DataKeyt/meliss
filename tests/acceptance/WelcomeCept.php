<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('sign in');
$I->amOnPage('/');
$I->fillField('Username', 'demo');
$I->fillField('Password', 'demo');
$I->click('Sign in');
$I->see('Broneering');


