package com.citrusengine.view.away3dview {

	import away3d.containers.ObjectContainer3D;

	import awayphysics.debug.AWPDebugDraw;

	import com.citrusengine.core.CitrusEngine;
	import com.citrusengine.physics.AwayPhysics;

	/**
	 * @author Aymeric
	 */
	public class AwayPhysicsDebugArt extends ObjectContainer3D {
		
		public var debugDrawer:AWPDebugDraw;
		
		private var _ce:CitrusEngine;
		
		private var _awayPhysics:AwayPhysics;

		public function AwayPhysicsDebugArt() {
			
			_ce = CitrusEngine.getInstance();
			
			if (parent is Away3DArt)
				_awayPhysics = Away3DArt(parent).citrusObject as AwayPhysics;
			else
				_awayPhysics = _ce.state.getFirstObjectByType(AwayPhysics) as AwayPhysics;
			
			debugDrawer = new AWPDebugDraw((_ce.state.view as Away3DView).viewRoot, _awayPhysics.world);
		}
		
		public function update():void {
			debugDrawer.debugDrawWorld();
		}
	}
}
