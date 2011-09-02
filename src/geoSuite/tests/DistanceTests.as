package geoSuite.tests
{
	import geo.DistanceUtil;
	
	import org.flexunit.Assert;
	
	public class DistanceTests
	{
		
		//All test lat lons came from http://www.realestate3d.com/gps/latlong.htm
		//							  http://www.realestate3d.com/gps/world-latlong.htm
		//							  http://www.infoplease.com/ipa/A0001769.html
		//All expected distances come from http://www2.nau.edu/~cvm/latlongdist.html
		
		private var du:DistanceUtil;
		
		[Before]
		public function runBeforeEveryTest():void { 
			du = new DistanceUtil();
		}   
		
		[After]  
		public function runAfterEveryTest():void {   
		} 
		
		[Test (description="Testing that the distance between the same two points is zero")] 
		public function testDistanceFromSelfToSelf():void { 
			var o:Object = new Object();
			var d:Object = new Object();
			o.lat = 0;
			o.lon = 0;
			d.lat = 0;
			d.lon = 0;
			var result:Number = du.distanceBetweenCoordinates(o.lat,o.lon,d.lat,d.lon, "km");
			
			Assert.assertEquals(result, 0); 
		}
		
		[Test (description="Testing that the distance between Philly and New York")] 
		public function testDistanceFromPhiladelphiaAndNewYork():void { 
			var expected:Number = 146.2;
			var o:Object = new Object();
			var d:Object = new Object();
			o.lat = 39.88;
			o.lon = -75.25;
			d.lat = 40.77;
			d.lon = -73.98;
			
			var result:Number = du.distanceBetweenCoordinates(o.lat,o.lon,d.lat,d.lon,"km");
			var diff:Number = Math.abs(expected - result);
			var message:String = "Expected: " + expected + " Result: " + result + " Diff: " + diff;
			var tolerance:Number = expected /200; //.5%
			
			Assert.assertTrue(diff < tolerance); 
		}
		
		[Test (description="Testing that the distance between Philly and London")] 
		public function testDistanceFromPhiladelphiaAndLondon():void { 
			var expected:Number = 5733;
			var o:Object = new Object();
			var d:Object = new Object();
			o.lat = 39.88;
			o.lon = -75.25;
			d.lat = 51.30;
			d.lon = 0.10;
			
			var result:Number = du.distanceBetweenCoordinates(o.lat,o.lon,d.lat,d.lon,"km");
			var diff:Number = Math.abs(expected - result);
			var message:String = "Expected: " + expected + " Result: " + result + " Diff: " + diff;  
			var tolerance:Number = expected /200; //.5%
			
			Assert.assertTrue(message, diff < tolerance); 
		}
		
		[Test (description="Testing that the distance between Philly and Melobourne")] 
		public function testDistanceFromPhiladelphiaAndMelbourne():void { 
			var expected:Number = 16580;
			var o:Object = new Object();
			var d:Object = new Object();
			o.lat = 39.88;
			o.lon = -75.25;
			d.lat = -37.47;
			d.lon = 144.58;
			
			var result:Number = du.distanceBetweenCoordinates(o.lat,o.lon,d.lat,d.lon,"km");
			var diff:Number = Math.abs(expected - result);
			var message:String = "Expected: " + expected + " Result: " + result + " Diff: " + diff;  
			var tolerance:Number = expected /200; //.5%
			
			Assert.assertTrue(message, diff < tolerance); 
		}
		
		[Test (description="Testing that the distance between Bejing and Buenos Aires, Antipodes")] 
		public function testBetweenAntipodesBejingAndBuenosAires():void { 
			var expected:Number = 19260;
			var o:Object = new Object();
			var d:Object = new Object();
			o.lat = 39.55;
			o.lon = 116.26;
			d.lat = -34.35;
			d.lon = -58.22;
			
			var result:Number = du.distanceBetweenCoordinates(o.lat,o.lon,d.lat,d.lon,"km");
			var diff:Number = Math.abs(expected - result);
			var message:String = "Expected: " + expected + " Result: " + result + " Diff: " + diff;  
			var tolerance:Number = expected /200; //.5%
			
			Assert.assertTrue(message, diff < tolerance); 
		}
	}
}