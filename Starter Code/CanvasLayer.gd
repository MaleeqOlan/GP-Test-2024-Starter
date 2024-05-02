extends CanvasLayer
# Physics2DServer expects references to be kept around.
var body
var shape


func _body_moved(state, index):
	# Created your own canvas item, use it here.
	RenderingServer.canvas_item_set_transform(canvas_item, state.transform)


func _ready():
	# Create the body.
	body = Physics2DServer.body_create()
	Physics2DServer.body_set_mode(body, Physics2DServer.BODY_MODE_RIGID)
	# Add a shape.
	shape = Physics2DServer.rectangle_shape_create()
	# Set rectangle extents.
	Physics2DServer.shape_set_data(shape, Vector2(10, 10))
	# Make sure to keep the shape reference!
	Physics2DServer.body_add_shape(body, shape)
	# Set space, so it collides in the same space as current scene.
	Physics2DServer.body_set_space(body, get_world_2d().space)
	# Move initial position.
	Physics2DServer.body_set_state(body, Physics2DServer.BODY_STATE_TRANSFORM, Transform2D(0, Vector2(10, 20)))
	# Add the transform callback, when body moves
	# The last parameter is optional, can be used as index
	# if you have many bodies and a single callback.
	Physics2DServer.body_set_force_integration_callback(body, self, "_body_moved", 0)
