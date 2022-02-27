# amazon.iap.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The [Amazon IAP](https://plugins.solar2d.com/?search=plugin.amazon.iap) plugin lets you sell digital content and subscriptions from within your apps, including <nobr>in-game</nobr> currency, expansion packs, upgrades, magazine issues, and more. The plugin also includes optional DRM support as well. See [store.verify()][plugin.amazon-iap-v2.verify] for information on implementing Amazon DRM/Licensing.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This plugin now uses the Appstore SDK with Solar2d 2021.3661+ and adds the api store.verify() to check DRM. No codes changes are required to use the Appstore SDK for IAP. If you are using the older v1 Solar2d plugin from Amazon see the [migration][plugin.amazon-iap-v2.migration] page for a summary of changes.

* If you're new to <nobr>Amazon In-App Purchasing</nobr>, read Amazon's [Understanding In-App Purchasing](https://developer.amazon.com/public/apis/earn/in-app-purchasing/docs-v2/understanding-in-app-purchasing) guide.

* You must install the [Amazon App Tester](https://developer.amazon.com/docs/in-app-purchasing/iap-install-and-configure-app-tester.html) or publish your app in the Amazon Appstore to use this plugin. Details on testing can be found [here](https://developer.amazon.com/docs/in-app-purchasing/iap-install-and-configure-app-tester.html).

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For in-app purchasing on other platforms, see the documentation for [Google IAP][plugin.google-iap-billing], [Apple IAP][plugin.apple-iap], [Samsung IAP][plugin.samsung-iap], or [Store API][api.library.store].

</div>
</div>


## Registration

To use Amazon in-app purchasing, you must first register for an [Amazon Developer](http://developer.amazon.com) account.


## Syntax

	local store = require( "plugin.amazon.iap" )


## Properties

#### [store.target][plugin.amazon-iap-v2.target]

#### [store.isActive][plugin.amazon-iap-v2.isActive]


## Functions

#### [store.init()][plugin.amazon-iap-v2.init]

#### [store.loadProducts()][plugin.amazon-iap-v2.loadProducts]

#### [store.purchase()][plugin.amazon-iap-v2.purchase]

#### [store.finishTransaction()][plugin.amazon-iap-v2.finishTransaction]

#### [store.restore()][plugin.amazon-iap-v2.restore]

#### [store.getUserId()][plugin.amazon-iap-v2.getUserId]

#### [store.getUserData()][plugin.amazon-iap-v2.getUserData]

#### [store.isSandboxMode()][plugin.amazon-iap-v2.isSandboxMode]

#### [store.verify()][plugin.amazon-iap-v2.verify]


## Events

#### [storeTransaction][plugin.amazon-iap-v2.event.storeTransaction]

#### [productList][plugin.amazon-iap-v2.event.productList]

#### [userData][plugin.amazon-iap-v2.event.userData]

#### [licensing][plugin.amazon-iap-v2.event.licensing]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.amazon.iap"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## CORONA_NATIVE_PRODUCT

To use this plugin with CORONA_NATIVE_PRODUCT:

1. Copy `plugin.amazon.iap.jar` into the `libs/` directory of your project and add `implementation 'com.amazon.device:amazon-appstore-sdk:3.0.2'` to your App Gradle dependencies.

2. Add the following section into your `AndroidManifest.xml` file, inside the `application` tag:

<div class="code-indent">

``````xml
<receiver android:name = "com.amazon.device.iap.ResponseReceiver">
	<intent-filter>
		<action android:name = "com.amazon.inapp.purchasing.NOTIFY"
			android:permission = "com.amazon.inapp.purchasing.Permission.NOTIFY"/>
	</intent-filter>
</receiver>
``````

</div>

3. Also, set `targetedAppStore` to `"amazon"` in your `AndroidManifest.xml` file:

<div class="code-indent">

``````xml
<meta-data android:name="targetedAppStore" android:value="amazon"/>
``````

</div>
