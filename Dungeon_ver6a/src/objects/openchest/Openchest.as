//AS3ExporterAIR version 2.3, code Flash 10, generated by Prefab3D: http://www.closier.nl/prefab
package objects.openchest
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

	public class Openchest extends Mesh
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

		public function Openchest(scale:Number = 1)
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
			m0.rawData = Vector.<Number>([1,0,0,0,0,1,0,0,0,0,1,0,0*_scale,227.71819999999997*_scale,24.523300000000003*_scale,1]);
			transform = m0;

			objs.obj0 = {name:"aw_0",  transform:m0, pivotPoint:new Vector3D(0,0,0), container:-1, bothsides:true, material:null, ownCanvas:false, pushfront:false, pushback:false};
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
			var geo0vert:String ="-a7.75c/-c6.072ab499cffd/-88.18a361d3b3fe,a7.75c/-c6.072ab499cffd/-88.18a361d3b3fe,a7.75c/-39.1453c3cf8bff0/-88.18a361d3b3fe,-a7.75c/-39.1453c3cf8bff0/-88.18a361d3b3fe,-c6.31b685e227fe/-f.11107c25c8ff2/62.0217,c6.31b685e227fe/-f.11107c25c8ff2/62.0217,c6.31b685e227fe/-e3.4151e59677fd/62.0217,-c6.31b685e227fe/-e3.4151e59677fd/62.0217,c6.31b685e227fe/-e3.4151e59677fd/-93.3e9,-c6.31b685e227fe/-e3.4151e59677fd/-93.3e9,-bd.281284a61802/-c5.4151e59677fd/44.0217,-bd.281284a61802/-c5.4151e59677fd/-75.3e9,-bd.281284a61802/-39.4151e59677ff/-75.3e9,-bd.281284a61802/-39.4151e59677ff/44.0217,bd.281284a61802/-c5.4151e59677fd/-75.3e9,bd.281284a61802/-c5.4151e59677fd/44.0217,bd.281284a61802/-39.4151e59677ff/44.0217,bd.281284a61802/-39.4151e59677ff/-75.3e9,a7.75c/-c6.072ab499cffd/-93.3e9,-a7.75c/-c6.072ab499cffd/-93.3e9,-c6.31b685e227fe/-f.11107c25c8ff2/-93.3e9,-a7.75c/-39.1453c3cf8bff0/-93.3e9,c6.31b685e227fe/-f.11107c25c8ff2/-93.3e9,a7.75c/-39.1453c3cf8bff0/-93.3e9,-c6.31b685e227fe/-c5.4151e59677fd/-75.3e9,-c6.31b685e227fe/-c5.4151e59677fd/44.0217,-c6.31b685e227fe/-39.4151e59677ff/44.0217,-c6.31b685e227fe/-39.4151e59677ff/-75.3e9,c6.31b685e227fe/-c5.4151e59677fd/44.0217,c6.31b685e227fe/-c5.4151e59677fd/-75.3e9,c6.31b685e227fe/-39.4151e59677ff/-75.3e9,c6.31b685e227fe/-39.4151e59677ff/44.0217,c6.31b685e227fe/-f.107ef73e9efdd/-86.1e7b,-c6.31b685e227fe/-f.107ef73e9efdd/-86.1e7b,-c6.31b685e227fe/-f.107ef73e9efdd/55.1ca9,c6.31b685e227fe/-f.107ef73e9efdd/55.1ca9,-1c.1c28/cd.224e/-27.146f69dcbf804,1c.1c28/cd.224e/-27.146f69dcbf804,13.3dd/d6.d300b5967fe/-10.1e9c34d362803,-13.3dd/d6.d300b5967fe/-10.1e9c34d362803,-10.86a/e3.4151e59677fd/14.34e48e9f6a7fb,10.86a/e3.4151e59677fd/14.34e48e9f6a7fb,14.5dad8e696ffe/c3.504a4a0a7003/28.18f1,-14.5dad8e696ffe/c3.504a4a0a7003/28.18f1,-23.17b0/a8.1f82/-22.423,23.17b0/a8.1f82/-22.423,-18.2c67f4c7fa002/b3.0509e1bb6802/-5.1ce88ef2899019,18.2c67f4c7fa002/b3.0509e1bb6802/-5.1ce88ef2899019,-1c.1c28/db.57bf8020bffd/-0.10c95cca905023,-23.17b0/ba.189c65b00803/e.5eadab8567fd,1c.1c28/db.57bf8020bffd/-0.10c95cca905023,23.17b0/ba.189c65b00803/e.5eadab8567fd,-a0.03db33b1a001/9c.14198ea64803/6e.1d2b,a0.03db33b1a001/9c.14198ea64803/6e.1d2b,a0.03db33b1a001/5b.366345c1f003/86.e3724990c02,-a0.03db33b1a001/5b.366345c1f003/86.e3724990c02,-a0.03db33b1a001/cb.1812/12.2b4f1aadab7fd,a0.03db33b1a001/cb.1812/12.2b4f1aadab7fd,a0.03db33b1a001/c4.2d54477ee003/3e.1361,-a0.03db33b1a001/c4.2d54477ee003/3e.1361,-c6.31b685e227fe/-f.11107c25c8ff2/62.0217,-c6.31b685e227fe/d7.c4/e.1fa2240d147fa,-c6.31b685e227fe/d0.521bf3548ffe/43.f61,-c6.31b685e227fe/17.1533dd4804ffe/86.1781,a0.03db33b1a001/-3.195a27791dff5c/5d.21dd,-a0.03db33b1a001/-3.195a27791dff5c/5d.21dd,-a0.03db33b1a001/1d.1dcc/7a.22ff,a0.03db33b1a001/1d.1dcc/7a.22ff,c6.31b685e227fe/d7.c4/e.1fa2240d147fa,c6.31b685e227fe/-f.11107c25c8ff2/62.0217,c6.31b685e227fe/17.1533dd4804ffe/86.1781,c6.31b685e227fe/d0.521bf3548ffe/43.f61,c6.31b685e227fe/5c.55542bc5d804/93.3e9,c6.31b685e227fe/a3.2bcd1fb14001/79.1553,-c6.31b685e227fe/a3.2bcd1fb14001/79.1553,-c6.31b685e227fe/5c.55542bc5d804/93.3e9,-a0.03db33b1a001/a3.2bcd1fb14001/79.1553,-a0.03db33b1a001/5c.55542bc5d804/93.3e9,a0.03db33b1a001/5c.55542bc5d804/93.3e9,a0.03db33b1a001/a3.2bcd1fb14001/79.1553,-a0.03db33b1a001/d7.c4/e.1fa2240d147fa,-a0.03db33b1a001/d0.521bf3548ffe/43.f61,a0.03db33b1a001/d0.521bf3548ffe/43.f61,a0.03db33b1a001/d7.c4/e.1fa2240d147fa,a0.03db33b1a001/-f.11107c25c8ff2/62.0217,a0.03db33b1a001/17.1533dd4804ffe/86.1781,-a0.03db33b1a001/17.1533dd4804ffe/86.1781,-a0.03db33b1a001/-f.11107c25c8ff2/62.0217";
			var geo0uvs:String ="0.770ae/0.923eb,0.2895/0.e9fe,0.195d3/0.b9ab5,0.770ae/0.b9ab5,0.7c700/0.04fe0,0.0d303/0.04fe0,0.0d303/0.4080c,0.7c700/0.4080c,0.0d303/0.852f5,0.7c700/0.852f5,0.8d6b7/0.57fa6,0.8d6b7/0.8bd9b,0.12107/0.8bd9b,0.b4a45/0.57fa6,0.b7fd6/0.58187,0.b7fd6/0.8bf7d,0.df365/0.8bf7d,0.df365/0.58187,0.015f93/0.8d7d2,0.73a6f/0.8d7d2,0.846ce/0.c451f,0.846cf/0.88cf3,0.c5d3/0.911cf,0.c5d3/0.b8899,0.0fa30/0.14296,0.7ee2c/0.c99db,0.7619b/0.bdd55,0.186c0/0.bdd56,0.0c43d/0.89cae,0.0c43d/0.c54da,0.0150ce/0.b9854,0.0150ce/0.e9c1,0.015f93/0.9085d,0.73a6f/0.9085c,0.789b3/0.911cf,0.789b4/0.b8899,0.bcf6/0.baccb,0.186c0/0.baccb,0.018158/0.b9854,0.02689/0.e9c1,0.84d7a/0.13f7,0.84d7a/0.74a7,0.84d7a/0.38192,0.84d7a/0.010e04,0.946d3/0.9ce74,0.d91bd/0.9ce68,0.d0b41/0.e807,0.9cd4b/0.9104f,0.e154/0.b86fc,0.8cd49/0.9136d,0.04c89/0.74a7,0.04c89/0.13f7,0.03dc3/0.92328,0.03dc4/0.b96b6,0.90eed/0.cf345,0.d59d6/0.cf34a,0.cd35d/0.c3525,0.99567/0.c3521,0.04c89/0.010e04,0.04c89/0.38192,0.8764b/0.13f7,0.8764c/0.74a7,0.8764b/0.38193,0.8764b/0.010e04,0.d0b40/0.e3f2,0.9cd4a/0.e3f3,0.e569/0.b86fc,0.8f61b/0.9136d,0.0023b8/0.74a7,0.0023b7/0.13f7,0.0014f1/0.92328,0.0014f3/0.b96b6,0.cd35d/0.c0c53,0.99568/0.c0c50,0.0023b8/0.010e04,0.0023b8/0.38192,0.0fa30/0.cd115,0.7ee2c/0.cd115,0.7c700/0.0018a7,0.0d303/0.0018a7,0.7fdf5/0.15b2d,0.6fc79/0.d8fc4,0.7239d/0.dfc90,0.7d6d1/0.dfc90,0.7c79f/0.eac0b,0.732cc/0.eac0b,0.6ea63/0.f34d1,0.80ffd/0.18549,0.81ccf/0.ceb7d,0.6df51/0.ce88d,0.8f466/0.dddff,0.853dd/0.dad07,0.81f6e/0.e0c5c,0.8b364/0.e542f,0.6a6ae/0.dacf6,0.6061f/0.162fc,0.6470f/0.e5412,0.6db10/0.e0c53,0.7fc3d/0.e4c51,0.885a1/0.ea764,0.6fe35/0.e4c4f,0.674c7/0.ea74c,0.e3825/0.2311d,0.89d59/0.2311d,0.89d59/0.36536,0.e3825/0.36536,0.e3824/0.050c1,0.89d59/0.050c2,0.89d59/0.011761,0.e3824/0.011761,0.d91bd/0.9ce68,0.946d3/0.9ce74,0.9b206/0.aa387,0.d268e/0.aa37d,0.89d59/0.86f5,0.e3824/0.54591,0.e3824/0.47ef3,0.89d59/0.47ef3,0.d59d6/0.cf34a,0.90eed/0.cf345,0.97a1d/0.dc859,0.ceea4/0.dc85d,0.a8c37/0.e673c,0.bdc89/0.e673d,0.ac423/0.b4265,0.c1475/0.1203d,0.3947a/0.14a56,0.24427/0.ce75f,0.24429/0.d93f8,0.3947b/0.d93f5,0.3904d/0.1606a,0.23ffb/0.dc423,0.23ffb/0.e70bc,0.3904d/0.e70bd,0.010755/0.ce763,0.0018d0/0.ce765,0.0018d2/0.d93fe,0.010757/0.d93fb,0.5bba4/0.1606a,0.4cd1f/0.1606a,0.4cd1f/0.e70bc,0.5bba4/0.e70bc,0.010328/0.dc423,0.0014a3/0.dc423,0.0014a3/0.e70bc,0.010328/0.e70bc,0.5bfd1/0.ce757,0.4d14c/0.ce759,0.4d14e/0.d93f2,0.5bfd3/0.d93ef,0.ac429/0.be455,0.c147c/0.be453,0.c065e/0.babba,0.11507/0.babbb,0.a85e4/0.f26a4,0.bd636/0.f26a5,0.bc819/0.eee0c,0.a9401/0.eee0a,0.d2695/0.b456f,0.d91c5/0.a705b,0.d5a8b/0.a7067,0.cf9c8/0.b1ddb,0.9089a/0.db2ac,0.973ca/0.e87c0,0.9a097/0.e602c,0.93fd4/0.15eac,0.ce852/0.e87c6,0.d5384/0.db2b3,0.d1c4b/0.db2be,0.cbb85/0.e6031,0.946db/0.10b3d,0.9b20d/0.b4575,0.9deda/0.b1de0,0.97e15/0.a706d";
			var geo0faces:String ="0,1,2,0,1,2,3,0,2,3,0,2,4,5,6,4,5,6,7,4,6,7,4,6,7,6,8,7,6,8,9,7,8,9,7,8,a,b,c,a,b,c,d,a,c,d,a,c,e,f,10,e,f,10,11,e,10,11,e,10,9,8,12,9,8,12,13,9,12,13,9,12,14,9,13,14,15,16,15,14,13,17,14,16,16,14,15,18,19,1a,17,16,15,1b,18,1a,8,16,17,1c,1d,1e,12,8,17,1f,1c,1e,13,12,1,13,12,20,0,13,1,21,13,20,15,13,0,17,16,22,3,15,0,23,17,22,17,15,3,1b,1a,24,2,17,3,25,1b,24,12,17,2,1f,1e,26,1,12,2,27,1f,26,7,9,18,7,9,28,19,7,18,29,7,28,4,7,19,4,7,2a,1a,4,19,2b,4,2a,14,4,1a,2c,2d,2e,1b,14,1a,2f,2c,2e,9,14,1b,15,14,30,18,9,1b,31,15,30,8,6,1c,8,6,32,1d,8,1c,33,8,32,16,8,1d,1d,1c,34,1e,16,1d,35,1d,34,5,16,1e,36,37,38,1f,5,1e,39,36,38,6,5,1f,6,5,3a,1c,6,1f,3b,6,3a,19,18,b,29,28,3c,a,19,b,3d,29,3c,1a,19,a,2b,2a,3e,d,1a,a,3f,2b,3e,1b,1a,d,2f,2e,40,c,1b,d,41,2f,40,18,1b,c,31,30,42,b,18,c,43,31,42,1d,1c,f,33,32,44,e,1d,f,45,33,44,1e,1d,e,35,34,46,11,1e,e,47,35,46,1f,1e,11,39,38,48,10,1f,11,49,39,48,1c,1f,10,3b,3a,4a,f,1c,10,4b,3b,4a,14,16,20,19,18,4c,21,14,20,4d,19,4c,5,4,22,5,4,4e,23,5,22,4f,5,4e,24,25,26,50,51,52,27,24,26,53,50,52,28,29,2a,54,55,56,2b,28,2a,57,54,56,2c,2d,25,58,59,51,24,2c,25,50,58,51,2c,24,27,5a,5b,5c,2e,2c,27,5d,5a,5c,25,2d,2f,5e,5f,60,26,25,2f,61,5e,60,2e,27,30,5d,5c,62,31,2e,30,63,5d,62,27,26,32,53,52,64,30,27,32,62,53,64,26,2f,33,61,60,65,32,26,33,64,61,65,31,30,28,63,62,54,2b,31,28,57,63,54,30,32,29,62,64,55,28,30,29,54,62,55,32,33,2a,64,65,56,29,32,2a,55,64,56,34,35,36,66,67,68,37,34,36,69,66,68,38,39,3a,6a,6b,6c,3b,38,3a,6d,6a,6c,3c,3d,3e,6e,6f,70,3f,3c,3e,71,6e,70,40,41,42,72,73,74,43,40,42,75,72,74,44,45,46,76,77,78,47,44,46,79,76,78,3b,3a,35,6d,6c,67,34,3b,35,66,6d,67,47,46,48,79,78,7a,49,47,48,7b,79,7a,43,42,37,75,74,69,36,43,37,68,75,69,3f,3e,4a,71,70,7c,4b,3f,4a,7d,71,7c,4b,4a,4c,7e,7f,80,4d,4b,4c,81,7e,80,49,48,4e,82,83,84,4f,49,4e,85,82,84,3e,3d,50,86,87,88,51,3e,50,89,86,88,44,47,52,8a,8b,8c,53,44,52,8d,8a,8c,46,45,54,8e,8f,90,55,46,54,91,8e,90,3c,3f,56,92,93,94,57,3c,56,95,92,94,4a,3e,51,7f,86,89,4c,4a,51,80,7f,89,47,49,4f,8b,82,85,52,47,4f,8c,8b,85,48,46,55,83,8e,91,4e,48,55,84,83,91,3f,4b,4d,93,7e,81,56,3f,4d,94,93,81,4d,4c,34,96,97,98,37,4d,34,99,96,98,4f,4e,36,9a,9b,9c,35,4f,36,9d,9a,9c,51,50,38,9e,9f,a0,3b,51,38,a1,9e,a0,53,52,3a,a2,a3,a4,39,53,3a,a5,a2,a4,55,54,40,a6,a7,a8,43,55,40,a9,a6,a8,57,56,42,aa,ab,ac,41,57,42,ad,aa,ac,4c,51,3b,97,9e,a1,34,4c,3b,98,97,a1,52,4f,35,a3,9a,9d,3a,52,35,a4,a3,9d,4e,55,43,9b,a6,a9,36,4e,43,9c,9b,a9,56,4d,37,ab,96,99,42,56,37,ac,ab,99";
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