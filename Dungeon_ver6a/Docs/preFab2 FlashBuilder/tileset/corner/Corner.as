//AS3ExporterAIR version 2.3, code Flash 10, generated by Prefab3D: http://www.closier.nl/prefab
package tileset.corner
{
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.materials.*;
	import away3d.core.base.*;
	import away3d.loaders.utils.*;
	import away3d.loaders.data.*;
	import flash.utils.Dictionary;
	import away3d.primitives.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	import flash.geom.*;

	public class Corner extends ObjectContainer3D
	{
		[Embed(source="images/aw_0.jpg")]
		private var Aw_0_Bitmap_Bitmap:Class;

		private var objs:Object = {};
		private var geos:Array = [];
		private var oList:Array =[];
		private var aC:Array;
		private var aV:Array;
		private var aU:Array;
		private var _scale:Number;

		public function Corner(scale:Number = 1)
		{
			_scale = scale;
			setSource();
			addContainers();
			buildMeshes();
			buildMaterials();
			cleanUp();
		}

		private function buildMeshes():void
		{
			var m0:Matrix3D = new Matrix3D();
			m0.rawData = Vector.<Number>([1,0,0,0,0,1,0,0,0,0,1,0,0*_scale,0*_scale,0*_scale,1]);
			transform = m0;

			objs.obj0 = {name:"aw_0",  transform:m0, pivotPoint:new Vector3D(0,0,0), container:1, bothsides:false, material:null, ownCanvas:false, pushfront:false, pushback:false};
			objs.obj0.geo=geos[0];

			var ref:Object;
			var mesh:Mesh;
			var j:int;
			var av:Array;
			var au:Array;
			var v0:Vertex;
			var v1:Vertex;
			var v2:Vertex;
			var u0:UV;
			var u1:UV;
			var u2:UV;
			var aRef:Vector.<Face>;
			for(var i:int = 0;i<1;++i){
				ref = objs["obj"+i];
				if(ref != null){
					mesh = new Mesh();
					mesh.type = ".as";
					mesh.bothsides = ref.bothsides;
					mesh.name = ref.name;
					mesh.pushfront = ref.pushfront;
					mesh.pushback = ref.pushback;
					mesh.ownCanvas = ref.ownCanvas;
					if(aC[ref.container]!= null)
						aC[ref.container].addChild(mesh);

					oList.push(mesh);
					mesh.transform = ref.transform;
					mesh.movePivot(ref.pivotPoint.x, ref.pivotPoint.y, ref.pivotPoint.z);
					if (ref.geo.geometry != null) {
						mesh.geometry = ref.geo.geometry;
						continue;
					}
					ref.geo.geometry = new Geometry();
					mesh.geometry = ref.geo.geometry;
					aRef = ref.geo.f;
					for(j = 0;j<aRef.length;++j){
						Face(aRef[j]).material = ref.material;
						ref.geo.geometry.addFace( Face(aRef[j]));
					}

				}
			}
		}

		private function setSource():void
		{
			var geo0vert:String ="1f4/190/-1f4,-1f3.5af3107a3fd3/190/-1f4,-63.5af3107a3fdc/190/-12c,-1ec.50daa4eba7c8/190/64,-1f3.5af3107a3fd3/190/1f4,-c7.9184e729ff9/1f4/c8,-12b.5af3107a3fef/-1f4/12c,-c7.9184e729ff9/-1f4/1e7.58acfcdd97fd,-1f3.5af3107a3fd3/-1f4/1f4,-c7.9184e729ff9/12c.00000000000006/1f4,-18f.9184e729ffb/-63.5af3107a3ffd/1f4,-1e8.895ebd8bffc/-63.5af3107a3ffd/12c,-1e2.302ab5fcbfa/-1f4/c8,-c7.9184e729ff9/-63.5af3107a3ffd/1ec.8e,64.00000000000036/-1f4/-64,1f4/-1f4/-1f4,1f4/-1f4/1f3.3e7,c8.00000000000011/-1f4/1e7.58acfcdd97fd,c8.00000000000011/-63.5af3107a3ffd/190,64.00000000000036/190/1f4,1f4/190/1f3.3e7,12c.0000000000007/1f4/0,-1f3.5af3107a3fd3/-63.5af3107a3ffd/-1f4,-18f.9184e729ffb/-63.5af3107a3ffd/-c8,-1f3.5af3107a3fd3/190/-64,-1f3.5af3107a3fd3/-1f4/-1f4,1f4/-63.5af3107a3ffd/1f4";
			var geo0uvs:String ="0.0bece/0.517bc,0.532bb/0.517bc,0.3640b/0.4387f,0.51f2b/0.274b0,0.51a25/0.0b12d,0.3ca12/0.20741,0.19c36/0.435db,0.0b53a/0.3bc6b,0.0c601/0.51b04,0.3b8e8/0.07b04,0.7cdce/0.a9bea,0.78f2e/0.c421e,0.88d36/0.c42f9,0.90c82/0.a9bea,0.69fb7/0.b0120,0.6a8e5/0.c4115,0.7c8a0/0.e7a52,0.6931e/0.defe7,0.97bd1/0.17149,0.211d3/0.4fc28,0.3502b/0.26ccc,0.52984/0.09f80,0.0b79e/0.09f80,0.0c957/0.200d7,0.4fd9f/0.afe45,0.3afa5/0.a8b05,0.4f80a/0.c3fc7,0.5556f/0.e5267,0.0becd/0.010fd,0.1a743/0.2e053,0.c1ec8/0.c3dcf,0.ac113/0.c3fa8,0.a5864/0.e6ff5,0.c1ec8/0.e5b06,0.c1ec8/0.a9bea,0.521f5/0.356eb,0.25c29/0.09fbd,0.3afa5/0.c39af,0.3afa5/0.16f17,0.52984/0.51166";
			var geo0faces:String ="0,1,2,0,1,2,3,4,5,3,4,5,6,7,8,6,7,8,9,5,4,9,5,4,8,a,b,a,b,c,c,8,b,d,a,c,a,8,7,b,a,e,d,a,7,f,b,e,4,a,d,10,b,f,9,4,d,11,10,f,a,4,3,b,10,12,b,a,3,c,b,12,c,6,8,13,6,8,e,f,10,14,15,16,11,e,10,17,14,16,11,10,12,18,19,1a,13,9,d,1b,11,f,12,13,d,1a,1b,f,14,0,15,1c,0,1d,16,17,18,1e,1f,20,1,16,18,21,1e,20,19,c,17,22,d,1f,16,19,17,1e,22,1f,b,17,c,c,1f,d,17,b,3,1f,c,12,18,17,3,20,1f,12,18,3,5,23,3,5,0,2,15,0,2,1d,2,5,15,2,5,1d,9,13,15,9,24,1d,10,1a,12,19,25,1a,14,13,12,26,1b,1a,1a,14,12,25,26,1a,13,14,15,24,1c,1d,12,d,7,1a,f,e,11,12,7,18,1a,e,7,6,e,7,6,14,11,7,e,17,7,14,c,19,e,13,27,14,9,15,5,9,1d,5,2,18,5,2,23,5,c,e,6,13,14,6,1,18,2,1,23,2,f,e,19,15,14,27";
			var geo0:FacesDefinition = new FacesDefinition();
			geo0.f = buildFaces( geo0faces.split(","),  buildVertices(read(geo0vert).split(",")), buildUVs(read(geo0uvs).split(",")) );
			geos.push(geo0);
		}

		private function buildFaces(aFaces:Array, vVerts:Vector.<Vertex>, vUVs:Vector.<UV>):Vector.<Face>
		{
			var vFaces:Vector.<Face> = new Vector.<Face>();
			var f:Face;
			for(var i:int = 0;i<aFaces.length;i+=6){
				f = new Face( vVerts[parseInt(aFaces[i], 16)],
									vVerts[parseInt(aFaces[i+1], 16)],
									vVerts[parseInt(aFaces[i+2], 16)],
									null,
									vUVs[parseInt(aFaces[i+3], 16)],
									vUVs[parseInt(aFaces[i+4], 16)],
									vUVs[parseInt(aFaces[i+5], 16)]);
				vFaces.push(f);
			}

			return vFaces;
		}

		private function buildVertices(aVerts:Array):Vector.<Vertex>
		{
			var tmpv:Array;
			var vVerts:Vector.<Vertex> = new Vector.<Vertex>();
			for(var i:int = 0;i<aVerts.length;i++){
				tmpv = aVerts[i].split("/");
				vVerts[i] = new Vertex( parseFloat(tmpv[0])*_scale, parseFloat(tmpv[1])*_scale, parseFloat(tmpv[2])*_scale  );
			}
			return vVerts;
		}

		private function buildUVs(aUvs:Array):Vector.<UV>
		{
			var tmpv:Array;
			var vUVs:Vector.<UV> = new Vector.<UV>();
			for(var i:int = 0;i<aUvs.length;++i){
				tmpv = aUvs[i].split("/");
				vUVs[i] = new UV(parseFloat(tmpv[0]), parseFloat(tmpv[1]));
			}

			return vUVs;
		}


		private function buildMaterials():void
		{
				var aw_0_Bitmap:Bitmap = new Aw_0_Bitmap_Bitmap();
				applyMaterialToMesh("aw_0", aw_0_Bitmap.bitmapData);

		}

		private function applyMaterialToMesh(id:String, bmd:BitmapData):void
		{
			for(var i:int;i<meshes.length;++i){
				if(meshes[i].name == id){
					if(!bmd){
						trace("Embed of "+id+" failed! Check source path or if CS4 call 911!");
					} else {
					meshes[i].material = new BitmapMaterial(bmd);
					}
					break;
				}
			}
		}

		private function cleanUp():void
		{
			for(var i:int = 0;i<1;++i){
				objs["obj"+i] == null;
			}
			aV = null;
			aU = null;
		}

		private function addContainers():void
		{
			aC = [];
			aC.push(this);
			var m0:Matrix3D = new Matrix3D();
			m0.rawData = Vector.<Number>([1,0,0,0,0,1,0,0,0,0,1,0,0*_scale,0*_scale,0*_scale,1]);
			transform = m0;
			name = "main";

			var cont1:ObjectContainer3D = new ObjectContainer3D();
			aC.push(cont1);
			addChild(cont1);
			var m1:Matrix3D = new Matrix3D();
			m1.rawData = Vector.<Number>([1,0,0,0,0,1,0,0,0,0,1,0,0*_scale,0*_scale,0*_scale,1]);
			cont1.transform = m1;
			cont1.name = "default0";

			var cont2:ObjectContainer3D = new ObjectContainer3D();
			aC.push(cont2);
			addChild(cont2);
			var m2:Matrix3D = new Matrix3D();
			m2.rawData = Vector.<Number>([1,0,0,0,0,1,0,0,0,0,1,0,0*_scale,0*_scale,0*_scale,1]);
			cont2.transform = m2;
			cont2.name = "stile0";

		}

		public function get containers():Array
		{
			return aC;
		}


		public function get meshes():Array
		{
			return oList;
		}


		private function read(str:String):String
		{
			var start:int= 0;
			var chunk:String;
			var end:int= 0;
			var dec:String = "";
			var charcount:int = str.length;
			for(var i:int = 0;i<charcount;++i){
				if (str.charCodeAt(i)>=44 && str.charCodeAt(i)<= 48 ){
					dec+= str.substring(i, i+1);
				}else{
					start = i;
					chunk = "";
					while(str.charCodeAt(i)!=44 && str.charCodeAt(i)!= 45 && str.charCodeAt(i)!= 46 && str.charCodeAt(i)!= 47 && i<=charcount){
						i++;
					}
					chunk = ""+parseInt("0x"+str.substring(start, i), 16 );
					dec+= chunk;
					i--;
				}
			}
			return dec;
		}

	}
}
class FacesDefinition
{
	import away3d.core.base.Face;
	import away3d.core.base.Geometry;
	public var f:Vector.<Face>;
	public var geometry:Geometry;
}