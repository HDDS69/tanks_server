extends Node

var network = ENetMultiplayerPeer.new()
var port = 1909
var max_player = 100
func _ready() -> void:
	StartServer()

func StartServer():
	network.create_server(port,max_player)
	get_tree().set_multiplayer(network)
	print("server started")
	
	network.peer_connected.connect("_Peer_Connected")
	network.peer_disconnected.connect("_Peer_Disconnected")
