package arm.node;

@:keep class MyKeyboardOpt extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _RotateObjectAroundAxis = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _OnKeyboard_002 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_002.property0 = "Down";
		_OnKeyboard_002.property1 = "a";
		_OnKeyboard_002.addOutputs([_RotateObjectAroundAxis]);
		_RotateObjectAroundAxis.addInput(_OnKeyboard_002, 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.ObjectNode(this, "car"), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.009999999776482582), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.FloatNode(this, 0.05000000074505806), 0);
		_RotateObjectAroundAxis.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RotateObjectAroundAxis_001 = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _OnKeyboard_003 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_003.property0 = "Down";
		_OnKeyboard_003.property1 = "d";
		_OnKeyboard_003.addOutputs([_RotateObjectAroundAxis_001]);
		_RotateObjectAroundAxis_001.addInput(_OnKeyboard_003, 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.ObjectNode(this, "car"), 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, -0.009999999776482582), 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.FloatNode(this, 0.05000000074505806), 0);
		_RotateObjectAroundAxis_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateOnLocalAxis_001 = new armory.logicnode.TranslateOnLocalAxisNode(this);
		var _OnKeyboard_001 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_001.property0 = "Down";
		_OnKeyboard_001.property1 = "s";
		_OnKeyboard_001.addOutputs([_TranslateOnLocalAxis_001]);
		_TranslateOnLocalAxis_001.addInput(_OnKeyboard_001, 0);
		_TranslateOnLocalAxis_001.addInput(new armory.logicnode.ObjectNode(this, "car"), 0);
		_TranslateOnLocalAxis_001.addInput(new armory.logicnode.FloatNode(this, -0.20000000298023224), 0);
		_TranslateOnLocalAxis_001.addInput(new armory.logicnode.IntegerNode(this, 3), 0);
		_TranslateOnLocalAxis_001.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_TranslateOnLocalAxis_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateOnLocalAxis = new armory.logicnode.TranslateOnLocalAxisNode(this);
		var _OnKeyboard = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard.property0 = "Down";
		_OnKeyboard.property1 = "w";
		_OnKeyboard.addOutputs([_TranslateOnLocalAxis]);
		_TranslateOnLocalAxis.addInput(_OnKeyboard, 0);
		_TranslateOnLocalAxis.addInput(new armory.logicnode.ObjectNode(this, "car"), 0);
		_TranslateOnLocalAxis.addInput(new armory.logicnode.FloatNode(this, 0.30000001192092896), 0);
		_TranslateOnLocalAxis.addInput(new armory.logicnode.IntegerNode(this, 3), 0);
		_TranslateOnLocalAxis.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_TranslateOnLocalAxis.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}