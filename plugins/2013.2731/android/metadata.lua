local metadata = {
	plugin = {
		format = 'jar',
		manifest =  {
			applicationChildElements = {
[[<receiver android:name = "com.amazon.device.iap.ResponseReceiver">
	<intent-filter>
    	<action android:name = "com.amazon.inapp.purchasing.NOTIFY"
            android:permission = "com.amazon.inapp.purchasing.Permission.NOTIFY"/>
    </intent-filter>
</receiver>]]
			}
		}
	}
}

return metadata
