//AS3ExporterAIR version 2.3, code Flash 10, generated by Prefab3D: http://www.closier.nl/prefab
package objects.crate
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

	public class Crate extends Mesh
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

		public function Crate(scale:Number = 1)
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
			m0.rawData = Vector.<Number>([1,0,0,0,0,1,0,0,0,0,1,0,0*_scale,81.7695*_scale,0*_scale,1]);
			transform = m0;

			objs.obj0 = {name:"aw_0",  transform:m0, pivotPoint:new Vector3D(0,0,0), container:-1, bothsides:false, material:null, ownCanvas:false, pushfront:false, pushback:false};
			objs.obj0.geo=geos[0];

			var ref:Object;
			
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
					this.type = ".as";
					this.bothsides = ref.bothsides;
					this.name = ref.name;
					this.pushfront = ref.pushfront;
					this.pushback = ref.pushback;
					this.ownCanvas = ref.ownCanvas;

					oList.push(this);
					this.transform = ref.transform;
					this.movePivot(ref.pivotPoint.x, ref.pivotPoint.y, ref.pivotPoint.z);
					if (ref.geo.geometry != null) {
						this.geometry = ref.geo.geometry;
						continue;
					}
					ref.geo.geometry = new Geometry();
					this.geometry = ref.geo.geometry;
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
			var geo0vert:String ="-64/-29.2bbdb2e2797fa/-54.26f6,64/-29.2bbdb2e2797fa/-54.26f6,64/29.1e0f/-54.26f6,-64/29.1e0f/-54.26f6,-64/42.45bfc83533ff/-3c,64/42.45bfc83533ff/-3c,64/42.45bfc83533ff/3c,-64/42.45bfc83533ff/3c,-64/29.1e0f/54.26f6,64/29.1e0f/54.26f6,64/-29.2bbdb2e2797fa/54.26f6,-64/-29.2bbdb2e2797fa/54.26f6,-64/-42.45bfc83533ff/3c,64/-42.45bfc83533ff/3c,64/-42.45bfc83533ff/-3c,-64/-42.45bfc83533ff/-3c,-7c.26f6/-29.2bbdb2e2797fa/3c,-7c.26f6/-29.2bbdb2e2797fa/-3c,-7c.26f6/29.1e0f/-3c,-7c.26f6/29.1e0f/3c,7c.26f6/-29.2bbdb2e2797fa/-3c,7c.26f6/-29.2bbdb2e2797fa/3c,7c.26f6/29.1e0f/3c,7c.26f6/29.1e0f/-3c,-8c/-51.1e0f/-64,8c/-51.1e0f/-64,64/-29.2bbdb2e2797fa/-64,-64/-29.2bbdb2e2797fa/-64,-8c/51.1e0f/-64,-64/29.1e0f/-64,8c/51.1e0f/-64,64/29.1e0f/-64,64/51.1e0f/-3c,-64/51.1e0f/-3c,-8c/51.1e0f/64,-64/51.1e0f/3c,8c/51.1e0f/64,64/51.1e0f/3c,64/29.1e0f/64,-64/29.1e0f/64,-8c/-51.1e0f/64,-64/-29.2bbdb2e2797fa/64,8c/-51.1e0f/64,64/-29.2bbdb2e2797fa/64,64/-51.1e0f/3c,-64/-51.1e0f/3c,-64/-51.1e0f/-3c,64/-51.1e0f/-3c,-8c/-29.2bbdb2e2797fa/-3c,-8c/-29.2bbdb2e2797fa/3c,-8c/29.1e0f/3c,-8c/29.1e0f/-3c,8c/-29.2bbdb2e2797fa/3c,8c/-29.2bbdb2e2797fa/-3c,8c/29.1e0f/-3c,8c/29.1e0f/3c";
			var geo0uvs:String ="0.de635/0.da7a5,0.de635/0.8dda8,0.137b0/0.8dda8,0.137b0/0.da7a5,0.6dbb9/0.8d520,0.6dbb9/0.d9719,0.9800d/0.d9719,0.9800e/0.8d520,0.016355/0.4827f,0.62d52/0.48280,0.62d52/0.4751,0.016354/0.4751,0.de138/0.485c,0.91f40/0.485c,0.91f40/0.577ed,0.de138/0.577ed,0.41414/0.be6cf,0.0166cc/0.be6ce,0.0166cc/0.d9f77,0.41414/0.d9f77,0.40ab7/0.74273,0.015d6e/0.74273,0.015d6e/0.8fb1b,0.40ab7/0.e5e9,0.f2355/0.edb6a,0.f2355/0.7a9e2,0.e224f/0.dfc5,0.e224f/0.dc79b,0.aefc0/0.edb6a,0.bf0c7/0.dc79b,0.aefc0/0.7a9e2,0.bf0c7/0.dfc5,0.59c32/0.79d58,0.59c32/0.ecee1,0.6a2e9/0.dbda4,0.6a2e9/0.8ae95,0.abf94/0.79d58,0.9b8dd/0.8ae95,0.abf94/0.ecee1,0.9b8dd/0.dbda4,0.02f8f/0.5bf9f,0.76118/0.5bfa0,0.64d49/0.4be99,0.01435f/0.4be99,0.02f8f/0.18c0a,0.01435f/0.28d11,0.76118/0.18c0b,0.19d/0.28d11,0.18280/0.19412,0.7e777/0.19412,0.8f8b4/0.29ac8,0.e07c3/0.29ac9,0.18280/0.abf2,0.e07c4/0.5b0bd,0.7e777/0.abf2,0.8f8b4/0.5b0bd,0.54f21/0.aa958,0.02bbf/0.aa958,0.013d51/0.bb252,0.43d8f/0.bb252,0.54f21/0.edced,0.43d8f/0.dd3f4,0.02bbf/0.edced,0.013d51/0.dd3f4,0.545c3/0.604fc,0.002261/0.604fd,0.0133f3/0.70df6,0.43431/0.70df5,0.545c3/0.a3891,0.43431/0.92f98,0.002262/0.a3891,0.0133f3/0.92f98";
			var geo0faces:String ="0,1,2,0,1,2,3,0,2,3,0,2,4,5,6,4,5,6,7,4,6,7,4,6,8,9,a,8,9,a,b,8,a,b,8,a,c,d,e,c,d,e,f,c,e,f,c,e,10,11,12,10,11,12,13,10,12,13,10,12,14,15,16,14,15,16,17,14,16,17,14,16,18,19,1a,18,19,1a,1b,18,1a,1b,18,1a,1c,18,1b,1c,18,1b,1d,1c,1b,1d,1c,1b,1e,1c,1d,1e,1c,1d,1f,1e,1d,1f,1e,1d,19,1e,1f,19,1e,1f,1a,19,1f,1a,19,1f,1c,1e,20,20,21,22,21,1c,20,23,20,22,22,1c,21,24,20,23,23,22,21,25,24,23,24,22,23,26,24,25,25,24,23,27,26,25,1e,24,25,21,26,27,20,1e,25,22,21,27,22,24,26,28,29,2a,27,22,26,2b,28,2a,28,22,27,2c,28,2b,29,28,27,2d,2c,2b,2a,28,29,2e,2c,2d,2b,2a,29,2f,2e,2d,24,2a,2b,29,2e,2f,26,24,2b,2a,29,2f,28,2a,2c,30,31,32,2d,28,2c,33,30,32,18,28,2d,34,30,33,2e,18,2d,35,34,33,19,18,2e,36,34,35,2f,19,2e,37,36,35,2a,19,2f,31,36,37,2c,2a,2f,32,31,37,28,18,30,38,39,3a,31,28,30,3b,38,3a,22,28,31,3c,38,3b,32,22,31,3d,3c,3b,1c,22,32,3e,3c,3d,33,1c,32,3f,3e,3d,18,1c,33,39,3e,3f,30,18,33,3a,39,3f,19,2a,34,40,41,42,35,19,34,43,40,42,1e,19,35,44,40,43,36,1e,35,45,44,43,24,1e,36,46,44,45,37,24,36,47,46,45,2a,24,37,41,46,47,34,2a,37,42,41,47,1b,1a,1,1b,1a,1,0,1b,1,0,1b,1,1d,1b,0,1d,1b,0,3,1d,0,3,1d,0,1f,1d,3,1f,1d,3,2,1f,3,2,1f,3,1a,1f,2,1a,1f,2,1,1a,2,1,1a,2,21,20,5,23,22,5,4,21,5,4,23,5,23,21,4,25,23,4,7,23,4,7,25,4,25,23,7,27,25,7,6,25,7,6,27,7,20,25,6,22,27,6,5,20,6,5,22,6,27,26,9,2b,2a,9,8,27,9,8,2b,9,29,27,8,2d,2b,8,b,29,8,b,2d,8,2b,29,b,2f,2d,b,a,2b,b,a,2f,b,26,2b,a,2a,2f,a,9,26,a,9,2a,a,2d,2c,d,33,32,d,c,2d,d,c,33,d,2e,2d,c,35,33,c,f,2e,c,f,35,c,2f,2e,f,37,35,f,e,2f,f,e,37,f,2c,2f,e,32,37,e,d,2c,e,d,32,e,31,30,11,3b,3a,11,10,31,11,10,3b,11,32,31,10,3d,3b,10,13,32,10,13,3d,10,33,32,13,3f,3d,13,12,33,13,12,3f,13,30,33,12,3a,3f,12,11,30,12,11,3a,12,35,34,15,43,42,15,14,35,15,14,43,15,36,35,14,45,43,14,17,36,14,17,45,14,37,36,17,47,45,17,16,37,17,16,47,17,34,37,16,42,47,16,15,34,16,15,42,16";
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
		{}


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