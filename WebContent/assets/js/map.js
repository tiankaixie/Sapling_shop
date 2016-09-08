function initialize() {

                var map = new BMap.Map('property-map');
                map.centerAndZoom(new BMap.Point(121.491, 31.233), 15);
                map.addControl(new BMap.NavigationControl());
                map.addControl(new BMap.ScaleControl());
                map.addControl(new BMap.OverviewMapControl());
                map.addControl(new BMap.MapTypeControl());
var marker = new BMap.Marker(point);  // 创建标注
map.addOverlay(marker);               // 将标注添加到地图中
map.enableScrollWheelZoom();
var local = new BMap.LocalSearch("全国", {
	renderOptions: {
		map: map,
		panel : "r-result",
		autoViewport: true,
		selectFirstResult: false
	}
 
});

map.addEventListener("click",function(e){
	document.getElementById("txtPoint").value=e.point.lng + "," + e.point.lat;
});
function getPoint(){
                var city = document.getElementById("txtCity").value; // 初始化地图,设置城市和地图级别。
                local.search(city);     //启用滚轮放大缩小                                     
            }
        }

        function loadScript() {
        	var script = document.createElement("script");
script.src = "http://api.map.baidu.com/api?v=1.4&callback=initialize"; //此为v1.5版本的引用方式
// http://api.map.baidu.com/api?v=1.5&key=yourAppKey&callback=initialize"; //此为v1.4版本及以前版本的引用方式
document.body.appendChild(script);
}
window.onload = loadScript;

