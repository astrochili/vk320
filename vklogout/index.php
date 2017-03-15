<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>API logout</title>
<?php
    $aid = $_GET["aid"];
    $token = $_GET["token"];
    $scope = $_GET["scope"];
    $domain = "vk320.ru";
    if ($scope == "")
	{
		$scope = "audio";
	}
    echo "<script src=\"https://login.vk.com/?act=openapi&oauth=1&aid=$aid&location=$domain&do_logout=1&token=$token\"></script>";
?>
<script type="text/javascript">
window.onload = function() {window.location.href = 'https://oauth.vk.com/authorize?client_id=<?=$aid;?>&scope=<?=$scope;?>&redirect_uri=https://oauth.vk.com/blank.html&response_type=token&display=mobile';}
</script>
</head>
<body>
</body>
</html>