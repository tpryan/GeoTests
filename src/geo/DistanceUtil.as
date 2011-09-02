package geo
{
	public class DistanceUtil
	{
		private const RADIUS_OF_EARTH_IN_MILES:int = 3963;
		private const RADIUS_OF_EARTH_IN_FEET:int =20925525;
		private const RADIUS_OF_EARTH_IN_KM:int =6378;
		private const RADIUS_OF_EARTH_IN_M:int =6378000;
		
		public function DistanceUtil()
		{
			
			
			
		}
		
		public function distanceBetweenCoordinates(lat1:Number,lon1:Number,
													lat2:Number,lon2:Number,
													units:String="miles"):Number{
			
			var R:int = RADIUS_OF_EARTH_IN_MILES;
			if (units == "km"){
				R = RADIUS_OF_EARTH_IN_KM;
			}
			if (units == "meters"){
				R = RADIUS_OF_EARTH_IN_M;
			}
			if (units =="feet"){
				R= RADIUS_OF_EARTH_IN_FEET;
			}
			
			var dLat:Number = (lat2-lat1) * Math.PI/180;
			var dLon:Number = (lon2-lon1) * Math.PI/180;
			
			var lat1inRadians:Number = lat1 * Math.PI/180;
			var lat2inRadians:Number = lat2 * Math.PI/180;
			
			var a:Number = Math.sin(dLat/2) * Math.sin(dLat/2) + 
				Math.sin(dLon/2) * Math.sin(dLon/2) * 
				Math.cos(lat1inRadians) * Math.cos(lat2inRadians);
			var c:Number = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
			var d:Number = R * c;
			
			return d;
		}
		
		
	}
}