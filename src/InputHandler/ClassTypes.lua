export type InputHandler = {
	_actionGroups: {[string]: ActionGroup},
	_commonTypes: {[string]: InputType},
	_customTypes: {[string]: InputType},
	new: () -> (InputHandler),
	addActionGroup: (self: InputHandler, name:string,enabled:boolean?) -> (ActionGroup),
	setActionGroupName: (self: InputHandler, oldName: string, newName: string) -> (),
	getActionGroup: (self: InputHandler,name: string) -> (ActionGroup?),
	removeActionGroup: (self: InputHandler,name: string) -> (),
	addType: (self: InputHandler,value: Enum.UserInputType | Enum.KeyCode, valueType: Enum.UserInputType | Enum.KeyCode, name: string, connection: (UserStorageService | GuiButton)?) -> (InputType),
	getType: (self: InputHandler,name: string) -> (InputType?),
	getTypes: (self: InputHandler) -> ({common: {InputType}, custom: {InputType}}),
	getCommonType: (self: InputHandler,name: string) -> (InputType?),
	getCommonTypes: (self: InputHandler) -> ({InputType}),
	getCustomType: (self: InputHandler,name: string) -> (InputType),
	getCustomTypes: (self: InputHandler) -> ({InputType}),
	removeType: (self: InputHandler,name: string) -> ()
}

export type InputAction = {
	_enabled: boolean,
	_name: string,
	_listeners: {[string]: Listener},
	_actionGroup: ActionGroup,
	_inputBegin: BindableEvent,
	_inputChange: BindableEvent,
	_inputEnd: BindableEvent,
	new: (inputActionGroup: ActionGroup, name: string, enabled: boolean?) -> (InputAction),
	enable: (self: InputAction) -> (),
	disable: (self: InputAction) -> (),
	setEnabled: (self: InputAction, value: boolean) -> (),
	isPressed: (self: InputAction) -> (boolean),
	readValue: (self: InputAction) -> (any),
	addListener: (self: InputAction, inputType: InputType, gameProcessed: boolean, enabled: boolean?, listenerStates: {Enum.UserInputState}?) -> (Listener),
	getListener: (self: InputAction, name:string) -> (Listener),
	getListeners: (self: InputAction) -> ({[string]: Listener}),
	addListenerState: (self: InputAction, name: string, state: Enum.UserInputState) -> (),
	addAllListenerStates: (self: InputAction, name: string) -> (),
	removeListenerState: (self: InputAction, name: string, state: Enum.UserInputState) -> (),
	removeAllListenerStates: (self: InputAction, name: string) -> (),
	removeListener: (self: InputAction, inputType: InputType) -> (),
	connect: (self: InputAction, func: (delta: Vector3?, position: Vector3?) -> (), state: Enum.UserInputState) -> (RBXScriptConnection),
	disconnect: (self: InputAction, connection: RBXScriptConnection) -> (),
	setName: (self: InputAction, name: string) -> (),
	getName: (self: InputAction) -> (string),
	getEnabled: (self: InputAction) -> (boolean),
	fire: (self: InputAction, inputState: Enum.UserInputState, delta: Vector3, position: Vector3) -> ()
}

export type ActionGroup = {
	_enabled: boolean,
	_name: string,
	_inputActions: {[string]: InputAction},
	new: (inputHandler: InputHandler,name: string, enabled: boolean?) -> (ActionGroup),
	enable: (self: ActionGroup) -> (),
	disable: (self: ActionGroup) -> (),
	setEnabled: (self: ActionGroup, value: boolean) -> (),
	addAction: (self: ActionGroup, name: string, enabled: boolean?) -> (InputAction),
	getAction: (self: ActionGroup, name: string) -> (InputAction?),
	getAllActions: (self: ActionGroup) -> ({[string]: InputAction}),
	removeAction: (self: ActionGroup, name: string) -> (),
	getEnabled: (self: ActionGroup) -> (boolean),
	setActionName: (self: ActionGroup, oldName: string, newName: string) -> (),
	setName: (self: ActionGroup, name: string) -> (),
	getName: (self: ActionGroup) -> (string)
}

export type Listener = {
	_enabled: boolean,
	_connected: {[Enum.UserInputState]: RBXScriptConnection | false},
	_inputAction: InputAction,
	_connectionType: InputType,
	_ignoreGameProcessed: boolean,
	_gameProcessed: boolean,
	_delta: Vector3,
	_position: Vector3,
	pressed: boolean,
	new: (inputAction: InputAction, inputType: InputType, enabled: boolean?, ignoreGameProcessed: boolean?, gameProcessed: boolean?) -> (Listener),
	enable: (self: Listener) -> (),
	disable: (self: Listener) -> (),
	setEnabled: (self: Listener, value: boolean) -> (),
	connect: (self: Listener, state: Enum.UserInputState) -> (),
	connectAll: (self: Listener) -> (),
	disconnect: (self: Listener, state: Enum.UserInputState) -> (),
	disconnectAll: (self: Listener) -> (),
	changeInput: (self: Listener, inputType: InputType) -> (),
	getEnabled: (self: Listener) -> (boolean),
	getDelta: (self: Listener) -> (Vector3),
	getPosition: (self: Listener) -> (Vector3),
	destroy: (self: Listener) -> nil
}

export type InputType = {
	value: Enum.UserInputType | Enum.KeyCode,
	valueType: Enum.UserInputType | Enum.KeyCode,
	name: string,
	connection: UserStorageService | GuiButton,
	new: (newValue: Enum.UserInputType | Enum.KeyCode, newValueType: Enum.UserInputType | Enum.KeyCode, newName: string, newConnection: (UserStorageService | GuiButton)?) -> (InputType),
	compare: (self: InputType, input: InputObject) -> (boolean)
}
return {}
